package com.example.airline.controller;

import com.example.airline.domain.*;
import com.example.airline.repos.BrigadeRepo;
import com.example.airline.repos.EmployerRepo;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.*;

import javax.validation.Valid;
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
            @Valid Employer employer,
            BindingResult bindingResult,
            Model model
    ) {

        if (bindingResult.hasErrors()) {
            Map<String, String> errorsMap = ControllerUtils.getErrors(bindingResult);

            model.mergeAttributes(errorsMap);
            model.addAttribute("employer", employer);
        } else {
            employerRepo.save(employer);
        }

        Iterable<Employer> employers = employerRepo.findAll();

        model.addAttribute("employers", employers);

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
