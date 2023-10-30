package com.ManagementSystem.Service;

import com.ManagementSystem.Entities.Customer;
import com.ManagementSystem.Entities.User;
import com.ManagementSystem.Repositories.UserRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.mail.SimpleMailMessage;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.stereotype.Service;

@Service
public class UserService {
    @Autowired
    UserRepository userRepository;
     JavaMailSender javaMailSender;


    public User saveUser(User user) {

            return userRepository.save(user);
    }
    public User getUserByEmail(String email) {
        return userRepository.findByEmail(email);
    }

    public boolean verifyLogin(String email, String password) {
        User storedLogin = userRepository.findByEmail(email);
        if (storedLogin != null && storedLogin.getPassword().equals(password)) {
            return true;
        }
        return false;
    }


    public boolean doesEmailExist(String email) {
        User existingUser = userRepository.findByEmail(email);
        return existingUser != null;
    }

    public boolean doesMobileExist(String mobile) {
        User existingUser = userRepository.findByMobile(mobile);
        return existingUser != null;
    }

    public boolean sendSMS(String phoneNumber, String message) {
        SimpleMailMessage mailMessage = new SimpleMailMessage();
        mailMessage.setTo(phoneNumber + "@sms.carrier.com"); // Replace with the actual carrier's email-to-SMS gateway
        mailMessage.setSubject("SMS via Email");
        mailMessage.setText(message);

        try {
            javaMailSender.send(mailMessage);
            return true;
        } catch (Exception e) {
            e.printStackTrace();
            return false;
        }
    }
}