package com.example.airline.domain;

import javax.persistence.*;

@Entity
@Table(name = "employers")
public class Employer {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long id;
    private String name;
    private String surname;
    private Profession profession;
    private Long brigadeId = null;





    public Employer() {
    }

    public Employer(String name, String surname, Profession profession) {
        this.name = name;
        this.surname = surname;
        this.profession = profession;
    }

    public Employer(String name, String surname, Profession profession, Long brigadeId) {
        this.name = name;
        this.surname = surname;
        this.profession = profession;
        this.brigadeId = brigadeId;
    }

    public Long getId() {
        return id;
    }

    public void setId(Long id) {
        this.id = id;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getSurname() {
        return surname;
    }

    public void setSurname(String surname) {
        this.surname = surname;
    }

    public Profession getProfession() {
        return profession;
    }

    public void setProfession(Profession profession) {
        this.profession = profession;
    }

    public Long getBrigadeId() {
        return brigadeId;
    }

    public void setBrigadeId(Long brigadeId) {
        this.brigadeId = brigadeId;
    }


}
