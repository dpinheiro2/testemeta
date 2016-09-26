package br.com.meta.testemeta.model;


import com.fasterxml.jackson.annotation.JsonIgnore;
import org.hibernate.annotations.GenericGenerator;

import javax.persistence.*;
import java.io.Serializable;
import java.util.Collection;

/**
 * Grupo Meta
 * Teste
 * Daniel Pinheiro Vargas
 * Criado em 25/09/2016.
 */


@Entity
@Table(name = "habitats")
public class Habitat implements Serializable {

    @Id
    @GeneratedValue(generator = "increment")
    @GenericGenerator(name = "increment", strategy = "increment")
    @Column(name = "id")
    private Long idHabitat;

    @Column(name = "descricao", nullable = false, length = 255)
    private String descricao;

    @OneToMany(mappedBy="habitat", fetch = FetchType.LAZY)
    @JsonIgnore
    private Collection<Animal> animais;

    public Long getIdHabitat() {
        return idHabitat;
    }

    public void setIdHabitat(Long idHabitat) {
        this.idHabitat = idHabitat;
    }

    public String getDescricao() {
        return descricao;
    }

    public void setDescricao(String descricao) {
        this.descricao = descricao;
    }

    public Collection<Animal> getAnimais() {
        return animais;
    }

    public void setAnimais(Collection<Animal> animais) {
        this.animais = animais;
    }
}