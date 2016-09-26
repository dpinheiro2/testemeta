package br.com.meta.testemeta.service;

import br.com.meta.testemeta.dao.AnimalDao;
import br.com.meta.testemeta.dao.GenericDao;
import br.com.meta.testemeta.model.Animal;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

/**
 * Grupo Meta
 * Teste
 * Daniel Pinheiro Vargas
 * Criado em 25/09/2016.
 */


@Service
@Transactional
public class AnimalServiceImpl extends GenericServiceImpl<Animal, Long> implements AnimalService {

    private AnimalDao animalDao;

    @Autowired
    public AnimalServiceImpl(
            @Qualifier("animalDaoImpl") GenericDao<Animal, Long> genericDao) {
        super(genericDao);
        this.animalDao = (AnimalDao) genericDao;
    }
}