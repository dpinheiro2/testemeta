package br.com.meta.testemeta.config;

import org.apache.commons.dbcp2.BasicDataSource;
import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.ComponentScan;
import org.springframework.context.annotation.Configuration;
import org.springframework.jdbc.datasource.embedded.EmbeddedDatabase;
import org.springframework.jdbc.datasource.embedded.EmbeddedDatabaseBuilder;
import org.springframework.jdbc.datasource.embedded.EmbeddedDatabaseType;
import org.springframework.orm.hibernate4.HibernateTransactionManager;
import org.springframework.orm.hibernate4.LocalSessionFactoryBean;
import org.springframework.transaction.annotation.EnableTransactionManagement;
import org.springframework.web.servlet.config.annotation.DefaultServletHandlerConfigurer;
import org.springframework.web.servlet.config.annotation.EnableWebMvc;
import org.springframework.web.servlet.config.annotation.ResourceHandlerRegistry;
import org.springframework.web.servlet.config.annotation.WebMvcConfigurerAdapter;
import org.springframework.web.servlet.view.InternalResourceViewResolver;

import javax.sql.DataSource;
import java.util.Properties;

/**
 * Grupo Meta
 * Teste
 * Daniel Pinheiro Vargas
 * Criado em 25/09/2016.
 */


@Configuration
@EnableWebMvc
@ComponentScan("br.com.meta.testemeta")
@EnableTransactionManagement
public class WebMvcConfig extends WebMvcConfigurerAdapter {

    @Bean(name = "viewResolver")
    public InternalResourceViewResolver getViewResolver() {
        InternalResourceViewResolver viewResolver = new InternalResourceViewResolver();
        viewResolver.setPrefix("/WEB-INF/views/");
        viewResolver.setSuffix(".jsp");
        return viewResolver;
    }

    private Properties getConnectionProperties() {
        Properties properties = new Properties();
        properties.put("connection.acquireIncrement", "2");
        properties.put("connection.minPoolSize", "20");
        properties.put("connection.maxPoolSize", "50");
        properties.put("connection.maxIdleTime", "600");
        return properties;
    }


    @Bean
    public DataSource dataSource() {

        EmbeddedDatabaseBuilder builder = new EmbeddedDatabaseBuilder();
        EmbeddedDatabase db = builder
                .setType(EmbeddedDatabaseType.HSQL)
                .addScript("create-db.sql")
                .addScript("alter-table.sql")
                .addScript("db-test-data.sql").build();

        return db;
    }

    @Bean
    public DataSource hsqlDataSource()  {

        BasicDataSource ds = new BasicDataSource();
        try {
            ds.setDriverClassName("org.hsqldb.jdbcDriver");
            ds.setUsername("sa");
            ds.setPassword("");
            ds.setUrl("jdbc:hsqldb:mem:testdb");
        }
        catch(Exception e){
            e.printStackTrace();
        }
        return ds;



    }

    private Properties getHibernateProperties() {
        Properties properties = new Properties();
        properties.put("hibernate.show_sql", "true");
        properties.put("hibernate.dialect", "org.hibernate.dialect.HSQLDialect");
        properties.put("hibernate.format_sql", "true");
        properties.put("hibernate.archive.autodetection", "class,hbm");
        //properties.put("hibernate.hbm2ddl.auto", "update");

        return properties;
    }


    @Autowired
    @Bean(name = "sessionFactory")
    public LocalSessionFactoryBean sessionFactory() {
        LocalSessionFactoryBean sessionFactory = new LocalSessionFactoryBean();
        sessionFactory.setDataSource(hsqlDataSource());
        sessionFactory.setHibernateProperties(getHibernateProperties());
        sessionFactory.setPackagesToScan(new String[] { "br.com.meta.testemeta.model" });
        return sessionFactory;
    }

    @Autowired
    @Bean(name = "transactionManager")
    public HibernateTransactionManager getTransactionManager(SessionFactory sessionFactory) {
        HibernateTransactionManager transactionManager = new HibernateTransactionManager(
                sessionFactory);

        return transactionManager;
    }

    @Override
    public void addResourceHandlers(ResourceHandlerRegistry registry) {
        registry.addResourceHandler("/assets/**").addResourceLocations("/assets/");
    }

    @Override
    public void configureDefaultServletHandling(DefaultServletHandlerConfigurer configurer) {
        configurer.enable();
    }





}
