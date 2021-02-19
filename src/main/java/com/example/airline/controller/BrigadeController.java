package com.example.airline.controller;

import com.example.airline.domain.Brigade;
import com.example.airline.domain.Employer;
import com.example.airline.domain.Flight;
import com.example.airline.domain.FlightStatus;
import com.example.airline.repos.BrigadeRepo;
import com.example.airline.repos.EmployerRepo;
import com.example.airline.repos.FlightRepo;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

import java.util.List;
import java.util.Map;

@Controller
@RequestMapping("/brigade")
public class BrigadeController {
    @Autowired
    private EmployerRepo employerRepo;
    @Autowired
    private BrigadeRepo brigadeRepo;
    @Autowired
    private FlightRepo flightRepo;

    @GetMapping
    public String brigadeList(Model model){
        model.addAttribute("brigades", brigadeRepo.findAll());
        return "brigadeList";
    }

    @GetMapping("{brigade}")
    public String brigadeInfoForm(@PathVariable Brigade brigade, Model model){
        model.addAttribute("brigades", brigade);
        model.addAttribute("employers", employerRepo.findEmployersByBrigadeId(brigade.getId()));
        return "brigadeInfo";
    }

    @GetMapping("/edit/{brigade}")
    public String brigadeEditForm(@PathVariable Brigade brigade, Model model){
        model.addAttribute("brigades", brigade);
        return "brigadeEdit";
    }

    @GetMapping("delete/{brigade}")
    public String deleteBrigade(@PathVariable Brigade brigade,Model model){
        try {
            List<Employer> employers = employerRepo.findEmployersByBrigadeId(brigade.getId());
            for (Employer employer : employers ) {
                employer.setBrigadeId(null);
            }
        } catch (Exception e){}
        try {
            Flight flight = flightRepo.findFlightByBrigadeId(brigade.getId());
            flight.setBrigadeId(null);
            flight.setFlightStatus(FlightStatus.NOTREADY);
        } catch (Exception e){}
        brigadeRepo.delete(brigade);
        model.addAttribute("brigades", brigadeRepo.findAll());
        return "brigadeList";
    }

    @PostMapping("/brigadesave")
    public String brigadeSave(
            @RequestParam String name,
            @RequestParam("brigadeId") Brigade brigade
    ) {
        brigade.setName(name);

        brigadeRepo.save(brigade);
        return "redirect:/brigade";
    }


    @PostMapping
    public String add(
            @RequestParam String name,
            Map<String, Object> model
    ) {
        Brigade brigade = new Brigade(name);

        brigadeRepo.save(brigade);

        Iterable<Brigade> brigades = brigadeRepo.findAll();

        model.put("brigades", brigades);

        return "redirect:/brigade";
    }
}
