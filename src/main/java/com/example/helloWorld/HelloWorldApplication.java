package com.example.helloWorld;

import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;

/* howTo
change port
src/main/resources/application.properties
	server.port=8081

run app from terminal
  mvn spring-boot:run
*/

@SpringBootApplication
public class HelloWorldApplication {
	public static void main(String[] args) {
		SpringApplication.run(HelloWorldApplication.class, args);
	}
}
