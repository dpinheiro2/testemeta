package br.com.meta.testemeta.editor;

import br.com.meta.testemeta.model.Habitat;
import br.com.meta.testemeta.service.HabitatService;
import org.apache.commons.lang3.StringUtils;

import java.beans.PropertyEditorSupport;
import java.io.Serializable;

/**
 * Grupo Meta
 * Teste
 * Daniel Pinheiro Vargas
 * Criado em 25/09/2016.
 */


public class CustomHabitatEditor extends PropertyEditorSupport {

    private HabitatService habitatService;

    public CustomHabitatEditor (HabitatService habitatService) {
        this.habitatService = habitatService;
    }

    @Override
    public void setAsText(String text) throws IllegalArgumentException {
        Habitat value = null;
        if( !StringUtils.isBlank(text)) {
            value = habitatService.getById(Long.parseLong(text));
            setValue(value);
        }

    }

    @Override
    public String getAsText() {
        Habitat value = ( Habitat ) getValue();
        String asText = "";
        if( value != null ) {
            Serializable id = value.getIdHabitat();
            if( id != null ) {
                asText = id.toString();
            }
        }
        return asText;
    }



}

