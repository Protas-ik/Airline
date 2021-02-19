package com.example.airline.repos;

import com.example.airline.domain.Brigade;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

@Repository
public interface BrigadeRepo extends JpaRepository<Brigade, Long> {
    Brigade findBrigadeById( Long brigadeId);
}
