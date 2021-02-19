package com.example.airline.domain;

import org.springframework.format.annotation.DateTimeFormat;

import javax.persistence.*;
import java.sql.Time;
import java.sql.Date;


@Entity
@Table(name = "flights")
public class Flight {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long id;
    private String fromPort;
    private String toPort;
    //@DateTimeFormat(pattern = "dd/MM/yyyy")
    private Date dateFlight;
    private Time timeFlight;
    private Long brigadeId = null;
    private FlightStatus flightStatus = FlightStatus.NOTREADY;

    public Flight(){

    }

    public Flight(String fromPort, String toPort, Date dateFlight, Time timeFlight){
        this.fromPort = fromPort;
        this.toPort = toPort;
        this.dateFlight = dateFlight;
        this.timeFlight = timeFlight;
        //this.brigadeId = brigadeId;
    }

    public Long getId() {
        return id;
    }

    public void setId(Long id) {
        this.id = id;
    }

    public String getFromPort() {
        return fromPort;
    }

    public void setFromPort(String fromPort) {
        this.fromPort = fromPort;
    }

    public String getToPort() {
        return toPort;
    }

    public void setToPort(String toPort) {
        this.toPort = toPort;
    }

    public Date getDateFlight() {
        return dateFlight;
    }

    public void setDateFlight(Date dateFlight) {
        this.dateFlight = dateFlight;
    }

    public Time getTimeFlight() {
        return timeFlight;
    }

    public void setTimeFlight(Time timeFlight) {
        this.timeFlight = timeFlight;
    }

    public Long getBrigadeId() {
        return brigadeId;
    }

    public void setBrigadeId(Long brigadeId) {
        this.brigadeId = brigadeId;
    }

    public FlightStatus getFlightStatus() {
        return flightStatus;
    }

    public void setFlightStatus(FlightStatus flightStatus) {
        this.flightStatus = flightStatus;
    }
}
