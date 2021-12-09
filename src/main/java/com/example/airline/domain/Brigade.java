package com.example.airline.domain;

import org.hibernate.validator.constraints.Length;

import javax.persistence.*;
import javax.validation.constraints.NotBlank;

@Entity
@Table(name = "brigades")
public class Brigade {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long id;
    @NotBlank(message = "Please fill the name")
    @Length(max = 64, message = "Name too long")
    private String name;
    private Boolean isFree = true;

    public Brigade() {
    }

    public Brigade(String name) {
        this.name = name;
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

    public Boolean getStatus() {
        return isFree;
    }

    public void setStatus(Boolean isFree) {
        this.isFree = isFree;
    }
}
