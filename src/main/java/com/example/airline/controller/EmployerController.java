package com.example.airline.controller;

import com.example.airline.domain.*;
import com.example.airline.repos.BrigadeRepo;
import com.example.airline.repos.EmployerRepo;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

import java.util.Map;

@Controller
@RequestMapping("/employer")
public class EmployerController {
    @Autowired
    private EmployerRepo employerRepo;
    @Autowired
    private BrigadeRepo brigadeRepo;

    @GetMapping
    public String employerList(Model model){
        model.addAttribute("employers", employerRepo.findAll());
        return "employerList";
    }

    @GetMapping("{employer}")
    public String employerEditForm(@PathVariable Employer employer, Model model){
        model.addAttribute("employers", employer);
        model.addAttribute("brigades", brigadeRepo.findAll());
        return "employerEdit";
    }

    @GetMapping("delete/{employer}")
    public String deleteEmployer(@PathVariable Employer employer,Model model){
        employerRepo.delete(employer);
        model.addAttribute("employers", employerRepo.findAll());
        return "employerList";
    }

    @PostMapping
    public String add(
            @RequestParam String name,
            @RequestParam String surname,
            @RequestParam Profession profession,
            Map<String, Object> model
    ) {
        Employer employer = new Employer(name, surname, profession);

        employerRepo.save(employer);

        Iterable<Employer> employers = employerRepo.findAll();

        model.put("employers", employers);

        return "redirect:/employer";
    }

    @PostMapping("/employersave")
    public String employerSave(
            @RequestParam String surname,
            @RequestParam Long brigade_id,
            @RequestParam("employerId") Employer employer
    ) {
        employer.setSurname(surname);
        employer.setBrigadeId(brigade_id);

        employerRepo.save(employer);
        return "redirect:/employer";
    }
}
