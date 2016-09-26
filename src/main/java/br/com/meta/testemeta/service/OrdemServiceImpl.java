package br.com.meta.testemeta.service;


import br.com.meta.testemeta.dao.GenericDao;
import br.com.meta.testemeta.dao.OrdemDao;
import br.com.meta.testemeta.model.Ordem;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.Collection;


/**
 * Grupo Meta
 * Teste
 * Daniel Pinheiro Vargas
 * Criado em 25/09/2016.
 */


@Service
@Transactional
public class OrdemServiceImpl extends GenericServiceImpl<Ordem, Long> implements OrdemService {

    private OrdemDao ordemDao;

    @Autowired
    public OrdemServiceImpl(
            @Qualifier("ordemDaoImpl") GenericDao<Ordem, Long> genericDao) {
        super(genericDao);
        this.ordemDao = (OrdemDao) genericDao;
    }

    @Override
    public Collection<Ordem> getOrdensByClasse(String idClasse) {

        return ordemDao.getOrdensByClasse(idClasse);
    }
}