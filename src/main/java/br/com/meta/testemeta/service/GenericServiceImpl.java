package br.com.meta.testemeta.service;

import br.com.meta.testemeta.dao.GenericDao;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;

/**
 * Grupo Meta
 * Teste
 * Daniel Pinheiro Vargas
 * Criado em 25/09/2016.
 */


@Service
@Transactional
public abstract class GenericServiceImpl<T, ID> implements GenericService<T, ID> {

    private GenericDao<T, ID> genericDao;

    public GenericServiceImpl(GenericDao<T, ID> genericDao) {
        this.genericDao = genericDao;
    }

    public GenericServiceImpl() {}

    @Override
    public void save(T entity) {
        genericDao.save(entity);
    }

    @Override
    public void delete(T entity) {
        genericDao.delete(entity);
    }

    @Override
    public T getById(ID id) {
        return genericDao.getById(id);
    }

    @Override
    public List<T> getAll() {
        return genericDao.getAll();
    }

}
