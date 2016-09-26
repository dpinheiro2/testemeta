package br.com.meta.testemeta.dao;

import java.util.List;

/**
 * Grupo Meta
 * Teste
 * Daniel Pinheiro Vargas
 * Criado em 25/09/2016.
 */


public interface GenericDao<T, ID> {
    public void save(T entity);
    public void delete(T entity);
    public T getById(ID id);
    public List<T> getAll();

}
