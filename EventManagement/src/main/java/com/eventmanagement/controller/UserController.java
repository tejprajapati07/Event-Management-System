package com.eventmanagement.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.eventmanagement.model.Event;
import com.eventmanagement.model.RSVP;
import com.eventmanagement.model.User;
import com.eventmanagement.service.EventService;
import com.eventmanagement.service.UserService;

import jakarta.servlet.http.HttpSession;

@Controller
public class UserController {
    @Autowired
    private UserService userService;

    @Autowired
    private EventService eventService; // Assuming you want to show events to the user

    @GetMapping("/login")
    public String login() {
        return "login";
    }

    @PostMapping("/login")
    public String loginUser(@RequestParam String email, @RequestParam String password, Model model) {
        User user = userService.login(email, password);
        if (user != null && "admin@gmail.com".equals(email) && "admin".equals(password)) {
            return "redirect:/admin/dashboard";
        } else if (user != null) {
            return "redirect:/user/dashboard";
        }
        model.addAttribute("error", "Invalid email or password");
        return "login";
    }

    @GetMapping("/register")
    public String register() {
        return "register";
    }

    @PostMapping("/register")
    public String registerUser(@ModelAttribute User user) {
        userService.register(user);
        return "redirect:/login";
    }

    // Add this method to handle /user/dashboard route
    @GetMapping("/user/dashboard")
    public String userDashboard(Model model) {
        model.addAttribute("events", eventService.getAllEvents()); // Assuming EventService provides events for display
        return "user_dashboard"; // Ensure this matches user_dashboard.jsp file name
    }
    
    @GetMapping("/user/rsvp")
    public String showRsvpForm(@RequestParam("eventId") Long eventId, Model model) {
        Event event = eventService.getEventById(eventId); // Ensure this method exists in EventService
        model.addAttribute("eventName", event.getName());
        model.addAttribute("eventId", eventId);
        return "rsvp"; // Ensure this matches rsvp.jsp
    }

    @PostMapping("/user/rsvp")
    public String submitRsvp(@RequestParam Long eventId, 
                             @RequestParam int numTickets, 
                             @RequestParam String name, 
                             @RequestParam String email, 
                             Model model) {
        userService.saveRsvp(eventId, numTickets, name, email);
        return "redirect:/user/bookings"; // Redirect to bookings page after RSVP
    }
    
    @GetMapping("/user/bookings")
    public String viewBookings(Model model) {
        // Fetch bookings for the logged-in user (or all bookings if user-based filtering isn’t required)
        List<RSVP> bookings = userService.getUserBookings(); // Assuming this method retrieves bookings
        model.addAttribute("bookings", bookings);
        return "bookings"; // Render bookings.jsp
    }
    
    @GetMapping("/logout")
    public String logout(HttpSession session) {
        session.invalidate(); // Invalidate the session to log out the user
        return "redirect:/login"; // Redirect to the login page after logout
    }
}
