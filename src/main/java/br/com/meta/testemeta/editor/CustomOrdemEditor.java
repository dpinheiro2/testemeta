package br.com.meta.testemeta.editor;

import br.com.meta.testemeta.model.Ordem;
import br.com.meta.testemeta.service.OrdemService;
import org.apache.commons.lang3.StringUtils;

import java.beans.PropertyEditorSupport;
import java.io.Serializable;

/**
 * Grupo Meta
 * Teste
 * Daniel Pinheiro Vargas
 * Criado em 25/09/2016.
 */


public class CustomOrdemEditor extends PropertyEditorSupport {

    private OrdemService ordemService;

    public CustomOrdemEditor (OrdemService ordemService) {
        this.ordemService = ordemService;
    }

    @Override
    public void setAsText(String text) throws IllegalArgumentException {
        Ordem value = null;
        if( !StringUtils.isBlank(text)) {
            value = ordemService.getById(Long.parseLong(text));
            setValue(value);
        }

    }

    @Override
    public String getAsText() {
        Ordem value = ( Ordem ) getValue();
        String asText = "";
        if( value != null ) {
            Serializable id = value.getIdOrdem();
            if( id != null ) {
                asText = id.toString();
            }
        }
        return asText;
    }



}
