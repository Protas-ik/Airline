package com.example.airline.repos;

import com.example.airline.domain.Flight;
import com.example.airline.domain.FlightStatus;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.repository.CrudRepository;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public interface FlightRepo extends JpaRepository<Flight, Long> {
    List<Flight> findFlightsByFlightStatus(FlightStatus flightStatus);
    Flight findFlightByBrigadeId(Long brigadeId);

}
