package com.project.an.controller;

import org.mybatis.spring.annotation.MapperScan;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.*;

@Controller
@MapperScan(value = "com.project.an.mapper",sqlSessionFactoryRef = "sqlSessionFactoryBean")
@RequestMapping(value = "/", method = {RequestMethod.GET, RequestMethod.POST})
public class MainController {
    @GetMapping("")@PostMapping
    public String root() {

        return "/main";
    }
    @GetMapping("r1")@PostMapping
    public String root1() {

        return "/main1";
    }
    @GetMapping("r2")@PostMapping
    public String root2() {

        return "/main2";
    }
    @GetMapping("r3")@PostMapping
    public String root3() {

        return "/main3";
    }
    @GetMapping("r4")@PostMapping
    public String root4() {

        return "/main4";
    }
    @GetMapping("r5")@PostMapping
    public String root5() {

        return "/main4";
    }
    @GetMapping("r6")@PostMapping
    public String root6() {

        return "/main4";
    }

}
