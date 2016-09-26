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
@Table(name = "classes")
public class Classe implements Serializable {

    @Id
    @GeneratedValue(generator = "increment")
    @GenericGenerator(name = "increment", strategy = "increment")
    @Column(name = "id")
    private Long idClasse;

    @Column(name = "descricao", nullable = false, length = 255)
    private String descricao;

    @OneToMany(mappedBy="classe", fetch = FetchType.LAZY)
    @JsonIgnore
    private Collection<Ordem> ordens;

    public Long getIdClasse() {
        return idClasse;
    }

    public void setIdClasse(Long idClasse) {
        this.idClasse = idClasse;
    }

    public String getDescricao() {
        return descricao;
    }

    public void setDescricao(String descricao) {
        this.descricao = descricao;
    }

    public Collection<Ordem> getOrdens() {
        return ordens;
    }

    public void setOrdens(Collection<Ordem> ordens) {
        this.ordens = ordens;
    }
}