package com.example.airline.domain;

import org.springframework.security.core.GrantedAuthority;

public enum Role implements GrantedAuthority {
    DISPATCHER,
    USER,
    GOD,
    ADMIN;

    @Override
    public String getAuthority()
    {
        return name();
    }
}
