package br.com.meta.testemeta.service;

import br.com.meta.testemeta.dao.GenericDao;
import br.com.meta.testemeta.dao.HabitatDao;
import br.com.meta.testemeta.model.Habitat;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

/**
 * Comando da 3ª Divisão de Exército
 * Adjunto da Seção de Informática
 * 1º Ten Vargas
 * Criado em 25/09/2016.
 */


@Service
@Transactional
public class HabitatServiceImpl extends GenericServiceImpl<Habitat, Long> implements HabitatService {

    private HabitatDao habitatDao;

    @Autowired
    public HabitatServiceImpl(
            @Qualifier("habitatDaoImpl") GenericDao<Habitat, Long> genericDao) {
        super(genericDao);
        this.habitatDao = (HabitatDao) genericDao;
    }
}