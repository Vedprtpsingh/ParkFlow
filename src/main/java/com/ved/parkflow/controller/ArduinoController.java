package com.ved.parkflow.controller;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.client.RestTemplate;
import org.springframework.beans.factory.annotation.Autowired;

import java.util.logging.Logger;

@RestController
@RequestMapping("/api/arduino")
public class ArduinoController {

    private static final Logger logger = Logger.getLogger(ArduinoController.class.getName());
    
    @Value("${arduino.ip:192.168.27.200}")
    private String arduinoIp;
    
    @Value("${arduino.port:80}")
    private String arduinoPort;
    
    private final RestTemplate restTemplate;

    @Autowired
    public ArduinoController(RestTemplate restTemplate) {
        this.restTemplate = restTemplate;
    }
    
    @GetMapping("/toggle")
    public ResponseEntity<String> toggleRelay() {
        try {
            String arduinoUrl = "http://" + arduinoIp + ":" + arduinoPort + "/toggle";
            logger.info("Sending toggle request to Arduino at: " + arduinoUrl);
            
            ResponseEntity<String> response = restTemplate.getForEntity(arduinoUrl, String.class);
            
            if (response.getStatusCode() == HttpStatus.OK) {
                logger.info("Arduino relay toggled successfully");
                return ResponseEntity.ok("Barrier opened successfully");
            } else {
                logger.warning("Failed to toggle Arduino relay. Response: " + response.getBody());
                return ResponseEntity.status(response.getStatusCode())
                    .body("Failed to open barrier: " + response.getBody());
            }
        } catch (Exception e) {
            logger.severe("Error communicating with Arduino: " + e.getMessage());
            return ResponseEntity.status(HttpStatus.INTERNAL_SERVER_ERROR)
                .body("Error communicating with barrier system: " + e.getMessage());
        }
    }
}
