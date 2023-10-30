package com.ManagementSystem.Controller;

import com.ManagementSystem.Service.UserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.ControllerAdvice;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

@ControllerAdvice
@RestController
public class AvailabilityController {

    @Autowired
    UserService userService;


    public AvailabilityController() {
    }

    @GetMapping(value = "/checkEmailAvailability", produces = MediaType.APPLICATION_JSON_VALUE)
    public ResponseEntity<?> checkEmailAvailability(@RequestParam String email) {
        boolean isAvailable = !userService.doesEmailExist(email);
        return ResponseEntity.ok(new AvailabilityResponse(isAvailable));
    }

    @GetMapping(value = "/checkMobileAvailability", produces = MediaType.APPLICATION_JSON_VALUE)
    public ResponseEntity<?> checkMobileAvailability(@RequestParam String mobile) {
        boolean isAvailable = !userService.doesMobileExist(mobile);
        return ResponseEntity.ok(new AvailabilityResponse(isAvailable));
    }
}
