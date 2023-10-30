package com.ManagementSystem.Controller;

public class AvailabilityResponse {

    private boolean available;

    public AvailabilityResponse(boolean available) {
        this.available = available;
    }

    public boolean isAvailable() {
        return available;
    }
}
