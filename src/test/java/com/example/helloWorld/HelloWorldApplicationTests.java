package com.example.helloWorld;

import org.junit.jupiter.api.Test;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.context.SpringBootTest;
import org.springframework.boot.test.web.client.TestRestTemplate;

import static org.assertj.core.api.Assertions.assertThat;
// import static org.assertj.core.api.Assertions.assertThatCode;

@SpringBootTest(webEnvironment = SpringBootTest.WebEnvironment.RANDOM_PORT)
class HelloWorldApplicationTests {

    @Autowired
    private TestRestTemplate restTemplate;

    // Context loads successfully
    @Test
    void contextLoads() {
    }

    // Application starts successfully
    @Test
    void applicationStartsSuccessfully() {
        String body = this.restTemplate.getForObject("/", String.class);
        assertThat(body).isNotNull();
    }

    // Application responds with Hello World
    @Test
    void applicationRespondsWithHelloWorld() {
        String body = this.restTemplate.getForObject("/", String.class);
        assertThat(body).contains("Hello, World");
    }

    // Application handles invalid endpoint
    @Test
    void applicationHandlesInvalidEndpoint() {
        String body = this.restTemplate.getForObject("/invalid", String.class);
        assertThat(body).contains("Not Found");
    }

}
