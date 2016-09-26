package br.com.meta.testemeta.model;

import org.hibernate.annotations.GenericGenerator;

import javax.persistence.*;
import java.io.Serializable;

/**
 * Grupo Meta
 * Teste
 * Daniel Pinheiro Vargas
 * Criado em 25/09/2016.
 */


@Entity
@Table(name = "animais")
public class Animal implements Serializable {

    @Id
    @GeneratedValue(generator = "increment")
    @GenericGenerator(name = "increment", strategy = "increment")
    @Column(name = "id")
    private Long idAnimal;

    @Column(name = "nome", nullable = false, length = 255)
    private String nome;

    @Column(name = "nomeCientifico", nullable = false, length = 255)
    private String nomeCientifico;


    /* 1-Sim 2-Não */
    @Column(name = "indAmeacado", nullable = false, length = 1)
    private String indAmeacado;

    @ManyToOne(fetch = FetchType.EAGER)
    @JoinColumn(name = "idOrdem", nullable = false)
    private Ordem ordem;

    @ManyToOne(fetch = FetchType.EAGER)
    @JoinColumn(name = "idHabitat", nullable = true)
    private Habitat habitat;

    public Long getIdAnimal() {
        return idAnimal;
    }

    public void setIdAnimal(Long idAnimal) {
        this.idAnimal = idAnimal;
    }

    public String getNome() {
        return nome;
    }

    public void setNome(String nome) {
        this.nome = nome;
    }

    public String getNomeCientifico() {
        return nomeCientifico;
    }

    public void setNomeCientifico(String nomeCientifico) {
        this.nomeCientifico = nomeCientifico;
    }

    public String getIndAmeacado() {
        return indAmeacado;
    }

    public void setIndAmeacado(String indAmeacado) {
        this.indAmeacado = indAmeacado;
    }

    public Ordem getOrdem() {
        return ordem;
    }

    public void setOrdem(Ordem ordem) {
        this.ordem = ordem;
    }

    public Habitat getHabitat() {
        return habitat;
    }

    public void setHabitat(Habitat habitat) {
        this.habitat = habitat;
    }
}