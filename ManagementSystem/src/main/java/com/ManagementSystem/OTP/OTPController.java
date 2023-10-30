package com.ManagementSystem.OTP;

import com.ManagementSystem.Entities.User;
import com.ManagementSystem.Service.UserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;
import javax.mail.*;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;
import javax.servlet.http.HttpSession;
import java.util.HashMap;
import java.util.Map;
import java.util.Properties;
import java.util.Random;

@ControllerAdvice
@RestController
public class OTPController {

    @Autowired
    private UserService userService;

    JavaMailSender javaMailSender;


    private Map<String, Map<String, Long>> otpStore = new HashMap<>();

    @GetMapping(value = "/OTP/checkEmailAvailability", produces = MediaType.APPLICATION_JSON_VALUE)
    public ResponseEntity<Boolean> checkEmailAvailability(@RequestParam String email,Model model) {
        boolean isAvailable = userService.doesEmailExist(email);
        if (isAvailable) {
            String otp = generateOTP();
            Map<String, Long> otpData = new HashMap<>();
            otpData.put("otp", Long.parseLong(otp));
            otpData.put("timestamp", System.currentTimeMillis());
            otpStore.put(email, otpData);

            boolean emailSent = sendEmail(email, "OTP Verification", "Your OTP is: " + otp);

            if (emailSent) {

                return ResponseEntity.ok(true);
            } else {
                return ResponseEntity.status(HttpStatus.INTERNAL_SERVER_ERROR).build();
            }
        } else {
            return ResponseEntity.notFound().build();
        }
    }

    private String generateOTP() {
        Random random = new Random();
        int otpValue = 100000 + random.nextInt(900000);
        return String.valueOf(otpValue);
    }

    public boolean sendEmail(String email, String subject, String message) {
        final String username = "flyhigh113114@gmail.com";
        final String password = "aojtgvxhqvaaebls";

        Properties props = new Properties();
        props.put("mail.smtp.auth", "true");
        props.put("mail.smtp.starttls.enable", "true");
        props.put("mail.smtp.host", "smtp.gmail.com");
        props.put("mail.smtp.port", "587");

        Session session = Session.getInstance(props,
                new javax.mail.Authenticator() {
                    protected PasswordAuthentication getPasswordAuthentication() {
                        return new PasswordAuthentication(username, password);
                    }
                });

        try {
            Message emailMessage = new MimeMessage(session);
            emailMessage.setFrom(new InternetAddress(username));
            emailMessage.setRecipients(Message.RecipientType.TO, InternetAddress.parse(email));
            emailMessage.setSubject(subject);
            emailMessage.setText(message);

            Transport.send(emailMessage);
            return true;
        } catch (MessagingException e) {
            e.printStackTrace();
            return false;
        }
    }

    // Method for verifying OTP
    @PostMapping(value = "/OTP/verifyOTP", produces = MediaType.APPLICATION_JSON_VALUE)
    public ResponseEntity<User> verifyOTP(@RequestParam String email, @RequestParam String enteredOTP, HttpSession session) {
        if (otpStore.containsKey(email)) {
            Map<String, Long> otpData = otpStore.get(email);
            long storedOTP = otpData.get("otp");
            long otpTimestamp = otpData.get("timestamp");

            long currentTime = System.currentTimeMillis();
            long otpValidityDuration = 60 * 1000;

            if (currentTime - otpTimestamp <= otpValidityDuration) {
                if (storedOTP == Long.parseLong(enteredOTP)) {
                      System.out.println(email);
                    otpStore.remove(email);

                    User user = userService.getUserByEmail(email);

                    if (user != null) {
                        session.setAttribute("verifiedEmail", email);
                        return ResponseEntity.ok(user);
                    } else {
                        return ResponseEntity.status(HttpStatus.NOT_FOUND).body(null); // User not found
                    }
                } else {
                    return ResponseEntity.status(HttpStatus.BAD_REQUEST).body(null); // Invalid OTP
                }
            } else {
                return ResponseEntity.status(HttpStatus.BAD_REQUEST).body(null); // OTP expired
            }
        } else {
            return ResponseEntity.status(HttpStatus.NOT_FOUND).body(null); // Email not found or OTP expired
        }
    }



}
