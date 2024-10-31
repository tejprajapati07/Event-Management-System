package com.eventmanagement.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.eventmanagement.model.Event;
import com.eventmanagement.model.RSVP;
import com.eventmanagement.model.Venue;
import com.eventmanagement.service.EmailService;
import com.eventmanagement.service.EventService;
import com.eventmanagement.service.RSVPService;
import com.eventmanagement.service.VenueService;

import java.time.LocalDate;
import java.time.format.DateTimeFormatter;

@Controller
@RequestMapping("/admin")
public class AdminController {
    @Autowired
    private EventService eventService;

    @Autowired
    private VenueService venueService;

    @Autowired
    private RSVPService rsvpService;

    @Autowired
    private EmailService emailService;

    @GetMapping("/dashboard")
    public String dashboard() {
        return "admin_dashboard";
    }

    @GetMapping("/events")
    public String events(Model model) {
        model.addAttribute("events", eventService.getAllEvents());
        model.addAttribute("venues", venueService.getAllVenues());
        model.addAttribute("event", new Event());
        return "event_form";
    }

    @PostMapping("/saveEvent")
    public String saveEvent(@ModelAttribute Event event) {
        eventService.saveEvent(event);
        return "redirect:/admin/events";
    }

    @GetMapping("/editEvent")
    public String editEvent(@RequestParam("id") Long id, Model model) {
        Event event = eventService.getEventById(id);
        model.addAttribute("event", event);
        model.addAttribute("venues", venueService.getAllVenues());
        model.addAttribute("events", eventService.getAllEvents());
        return "event_form";
    }

    @GetMapping("/deleteEvent")
    public String deleteEvent(@RequestParam("id") Long id) {
        eventService.deleteEvent(id);
        return "redirect:/admin/events";
    }

    @GetMapping("/venues")
    public String venues(Model model) {
        model.addAttribute("venues", venueService.getAllVenues());
        model.addAttribute("venue", new Venue());
        return "venue_form";
    }

    @PostMapping("/saveVenue")
    public String saveVenue(@ModelAttribute Venue venue) {
        venueService.saveVenue(venue);
        return "redirect:/admin/venues";
    }

    @GetMapping("/editVenue")
    public String editVenue(@RequestParam("id") Long id, Model model) {
        Venue venue = venueService.getVenueById(id);
        model.addAttribute("venue", venue);
        model.addAttribute("venues", venueService.getAllVenues());
        return "venue_form";
    }

    @GetMapping("/deleteVenue")
    public String deleteVenue(@RequestParam("id") Long id) {
        venueService.deleteVenue(id);
        return "redirect:/admin/venues";
    }

    @GetMapping("/manage-rsvps")
    public String manageRsvps(Model model) {
        model.addAttribute("rsvps", rsvpService.getAllRsvps());
        return "admin_rsvp";
    }

    

    @PostMapping("/updateStatus")
    public String updateRsvpStatus(@RequestParam Long rsvpId, @RequestParam String status) {
        // Retrieve the RSVP entry
        RSVP rsvp = rsvpService.getRsvpById(rsvpId);
        rsvpService.updateRsvpStatus(rsvpId, status);

        // Format the current date
        String currentDate = LocalDate.now().format(DateTimeFormatter.ofPattern("MMMM dd, yyyy"));

        // Prepare email details
        String subject = "Booking Status Update for " + rsvp.getEvent().getName();
        String message = "Dear " + rsvp.getBookingName() + ",\n\n" +
                "We are writing to inform you that the status of your booking for the event \"" +
                rsvp.getEvent().getName() + "\" has been updated to: " + status + ".\n\n" +
                "Booking Details:\n" +
                "Event: " + rsvp.getEvent().getName() + "\n" +
                "Date of Status Update: " + currentDate + "\n" +
                "Current Status: " + status + "\n\n" +
                "Thank you for choosing our service. Please do not hesitate to reach out to us if you have any questions or require further assistance.\n\n" +
                "Best regards,\n" +
                "The Event Management Team\n" +
                "Email: support@eventmanagement.com\n" +
                "Phone: +1 (123) 456-7890\n\n" +
                "Thank you for using our service!";

        // Send email notification to the user
        emailService.sendEmail(rsvp.getBookingEmail(), subject, message);

        return "redirect:/admin/manage-rsvps";
    }

}
