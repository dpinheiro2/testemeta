package br.com.meta.testemeta.service;

import br.com.meta.testemeta.dao.ClasseDao;
import br.com.meta.testemeta.dao.GenericDao;
import br.com.meta.testemeta.model.Classe;
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
public class ClasseServiceImpl extends GenericServiceImpl<Classe, Long> implements ClasseService {

    private ClasseDao classeDao;

    @Autowired
    public ClasseServiceImpl(
            @Qualifier("classeDaoImpl") GenericDao<Classe, Long> genericDao) {
        super(genericDao);
        this.classeDao = (ClasseDao) genericDao;
    }

}
