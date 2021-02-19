package com.example.airline.controller;

import com.example.airline.domain.Brigade;
import com.example.airline.domain.Employer;
import com.example.airline.domain.Flight;
import com.example.airline.domain.FlightStatus;
import com.example.airline.repos.BrigadeRepo;
import com.example.airline.repos.FlightRepo;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

import java.sql.Time;
import java.sql.Date;
import java.util.Map;

@Controller
@RequestMapping("/flight")
public class FlightController {
    @Autowired
    private FlightRepo flightRepo;
    @Autowired
    private BrigadeRepo brigadeRepo;

    @GetMapping
    public String flightList(Model model){
        model.addAttribute("flights", flightRepo.findAll());
        return "flightControl";
    }

    @GetMapping("{flight}")
    public String flightEditForm(@PathVariable Flight flight, Model model){
        model.addAttribute("flights", flight);
        model.addAttribute("brigades", brigadeRepo.findAll());
        return "flightEdit";
    }

    @GetMapping("delete/{flight}")
    public String deleteFlight(@PathVariable Flight flight, Model model){
        flightRepo.delete(flight);
        model.addAttribute("flights", flightRepo.findAll());
        return "flightControl";
    }

    @PostMapping
    public String add(
            @RequestParam String fromPort,
            @RequestParam String toPort,
            @RequestParam String date,
            @RequestParam String time,
            Map<String, Object> model
    ) {
        Date date1 = Date.valueOf(date);
        time += ":00";
        Time time1 = Time.valueOf(time);
        Flight flight = new Flight(fromPort,toPort,date1,time1);
        flightRepo.save(flight);
        Iterable<Flight> flights = flightRepo.findAll();
        model.put("flights", flights);
        return "redirect:/flight";
    }

    @PostMapping("/flightsave")
    public String flightSave(
            @RequestParam Long brigade_id,
            @RequestParam("flightId") Flight flight
    ) {
        try {
            Brigade brigadeFromDb = brigadeRepo.findBrigadeById(brigade_id);
            brigadeFromDb.setStatus(false);
            brigadeRepo.save(brigadeFromDb);
            flight.setBrigadeId(brigade_id);
            flight.setFlightStatus(FlightStatus.READY);
            flightRepo.save(flight);
        } catch (Exception e){}
        return "redirect:/flight";
    }

    @GetMapping("/readyflight")
    public String readyFlightForm( Model model){
        model.addAttribute("flights", flightRepo.findFlightsByFlightStatus(FlightStatus.READY));
        return "readyFlights";
    }

}
