package br.com.meta.testemeta.dao;

import org.hibernate.Criteria;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import java.io.Serializable;
import java.lang.reflect.ParameterizedType;
import java.lang.reflect.Type;
import java.util.List;

/**
 * Grupo Meta
 * Teste
 * Daniel Pinheiro Vargas
 * Criado em 25/09/2016.
 */


@SuppressWarnings("unchecked")
@Repository
public abstract class GenericDaoImpl<T, ID extends Serializable> implements GenericDao<T, ID> {

    @Autowired
    private SessionFactory sessionFactory;

    protected Class<? extends T> daoType;

    public GenericDaoImpl() {
        Type t = getClass().getGenericSuperclass();
        ParameterizedType pt = (ParameterizedType) t;
        daoType = (Class<T>) pt.getActualTypeArguments()[0];
    }

    protected Session getSession() {
        return sessionFactory.getCurrentSession();
    }

    @Override
    public void save(T entity){
        getSession().saveOrUpdate(entity);
    }

    @Override
    public void delete(T entity){
        getSession().delete(entity);
    }

    @Override
    public T getById(ID id){
        return (T) getSession().get(daoType, id);
    }

    @Override
    public List<T> getAll() {
        return (List<T>) getSession().createCriteria(daoType).setResultTransformer(Criteria.DISTINCT_ROOT_ENTITY).list();
    }

}
