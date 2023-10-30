package com.ManagementSystem.Controller;

import com.ManagementSystem.DTO.UserDTO;
import com.ManagementSystem.Entities.Customer;
import com.ManagementSystem.Entities.User;
import com.ManagementSystem.Service.UserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.security.core.Authentication;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.*;

import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.validation.Valid;
import java.io.IOException;
import java.security.Principal;
import java.util.ArrayList;
import java.util.List;
import java.util.logging.Logger;

@Controller
public class UserController {
    private static final Logger logger = Logger.getLogger(UserController.class.getName());

    @Autowired
    UserService userService;

    //http://localhost:8080/ShowHotel
    @RequestMapping("/ShowHotel")
    public String showHotel() {
        return "Hotels";
    }

    @RequestMapping("/Booking")
    public String showBookNowPage() {
        return "BookNow";
    }

    //http://localhost:8080/login
    @RequestMapping("/login")
     public String showLogin(){
        return "Login";
     }

    @RequestMapping("/signup")
     public String showSignup(){
        return "SignUp";
     }
    @RequestMapping("/confirm")
    public String processBookingDetails(@ModelAttribute Customer user, Model model) {
        model.addAttribute("user", user);
        return "ConfirmNow";
    }
    @PostMapping("/EditDetails")
    public String processEditDetails(@ModelAttribute Customer user, Model model) {
        model.addAttribute("user", user);
        return "Edit";
    }


    @PostMapping("/LogIn")
    public String login(
            @RequestParam("email") String email,
            @RequestParam("password") String password,
            Model model) {

        boolean isValidLogin = userService.verifyLogin(email, password);

        if (isValidLogin) {
            model.addAttribute("message", "Login successful!");
            return "Hotels";
        } else {
            model.addAttribute("errorMessage", "Invalid login credentials for user: " + email);

            return "Login";
        }

    }

    @PostMapping("/saveUser")
    public String saveUser(@Valid @ModelAttribute User customerData, BindingResult bindingResult, Model model) {
        if (bindingResult.hasErrors()) {
            model.addAttribute("user", customerData);
            return "SignUp";
        }
        List<String> errors = new ArrayList<>();
        if (userService.doesEmailExist(customerData.getEmail())) {
            errors.add("Email already taken, please use a different email");
            logger.warning("Email already registered for " + customerData.getEmail());
        }
        if (userService.doesMobileExist(customerData.getMobile())) {
            errors.add("Mobile number already taken, please use a different mobile");
            logger.warning("Mobile number already registered for " + customerData.getMobile());
        }
        if (!errors.isEmpty()) {
            model.addAttribute("user", customerData);
            model.addAttribute("errors", errors);
            logger.info("Returning to SignUp view with errors.");
            return "SignUp";
        }
        if (!customerData.getPassword().equals(customerData.getConfirmPassword())) {
            errors.add("Password and Confirm Password do not match.");
            logger.warning("Password and Confirm Password do not match.");
            model.addAttribute("user", customerData);
            model.addAttribute("errors", errors);
            logger.info("Returning to SignUp view with errors.");
            return "SignUp";
        }
        userService.saveUser(customerData);
        model.addAttribute("msg", "Record is saved!!");
        return "Login";
    }

    @GetMapping("/details")
    public String showUserDetails(HttpSession session, Model model) {
        String verifiedEmail = (String) session.getAttribute("verifiedEmail");
        System.out.println(verifiedEmail);
        if (verifiedEmail != null) {
            User user = userService.getUserByEmail(verifiedEmail);
            if (user != null) {
                UserDTO userDetailsDTO = new UserDTO();
                userDetailsDTO.setEmail(user.getEmail());
                userDetailsDTO.setPassword(user.getPassword());

                model.addAttribute("user", userDetailsDTO);

                return "Details";
            }
        }
        return "UserNotFound";
    }



}
