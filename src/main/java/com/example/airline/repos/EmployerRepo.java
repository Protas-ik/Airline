package com.example.airline.repos;

import com.example.airline.domain.Employer;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public interface EmployerRepo extends JpaRepository<Employer, Long> {
    List<Employer> findEmployersByBrigadeId(Long brigadeId);
    //Employer findEmployerByBrigadeId(Long )

}
