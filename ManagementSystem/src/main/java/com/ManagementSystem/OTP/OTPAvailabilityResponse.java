package com.ManagementSystem.OTP;

public class OTPAvailabilityResponse {

    private boolean available;

    public OTPAvailabilityResponse(boolean available) {
        this.available = available;
    }

    public boolean isAvailable() {
        return available;
    }
}
