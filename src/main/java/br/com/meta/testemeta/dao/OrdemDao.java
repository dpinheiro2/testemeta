package br.com.meta.testemeta.dao;

import br.com.meta.testemeta.model.Ordem;

import java.util.Collection;

/**
 * Grupo Meta
 * Teste
 * Daniel Pinheiro Vargas
 * Criado em 25/09/2016.
 */


public interface OrdemDao extends GenericDao<Ordem, Long> {

    public Collection<Ordem> getOrdensByClasse(String idClasse);
}
