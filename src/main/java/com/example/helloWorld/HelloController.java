package com.example.helloWorld;

import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

@RestController
public class HelloController {

    @RequestMapping(value = "/")
    public String helloWorld() {
        return "Hello, World! This is a simple Spring Boot application. v0.2";
    }

}
