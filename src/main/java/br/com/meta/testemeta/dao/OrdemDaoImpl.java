package br.com.meta.testemeta.dao;

import br.com.meta.testemeta.model.Ordem;
import org.hibernate.criterion.Restrictions;
import org.springframework.stereotype.Repository;

import java.util.Collection;

/**
 * Grupo Meta
 * Teste
 * Daniel Pinheiro Vargas
 * Criado em 25/09/2016.
 */

@Repository
public class OrdemDaoImpl extends GenericDaoImpl<Ordem, Long> implements OrdemDao {

    @Override
    public Collection<Ordem> getOrdensByClasse(String idClasse) {
        Collection<Ordem> list = (Collection<Ordem>) getSession().createCriteria(Ordem.class)
                .add( Restrictions.eq("classe.idClasse", new Long(idClasse) ) )
                .list();
        return list;
    }

}