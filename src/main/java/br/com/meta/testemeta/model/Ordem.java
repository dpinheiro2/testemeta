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
@Table(name = "ordens")
public class Ordem implements Serializable {

    @Id
    @GeneratedValue(generator = "increment")
    @GenericGenerator(name = "increment", strategy = "increment")
    @Column(name = "id")
    private Long idOrdem;

    @Column(name = "descricao", nullable = false, length = 255)
    private String descricao;

    @ManyToOne(fetch = FetchType.EAGER)
    @JoinColumn(name = "idClasse", nullable = false)
    private Classe classe;

    @OneToMany(mappedBy="ordem", fetch = FetchType.LAZY)
    @JsonIgnore
    private Collection<Animal> animais;

    public Long getIdOrdem() {
        return idOrdem;
    }

    public void setIdOrdem(Long idOrdem) {
        this.idOrdem = idOrdem;
    }

    public String getDescricao() {
        return descricao;
    }

    public void setDescricao(String descricao) {
        this.descricao = descricao;
    }

    public Classe getClasse() {
        return classe;
    }

    public void setClasse(Classe classe) {
        this.classe = classe;
    }

    public Collection<Animal> getAnimais() {
        return animais;
    }

    public void setAnimais(Collection<Animal> animais) {
        this.animais = animais;
    }
}