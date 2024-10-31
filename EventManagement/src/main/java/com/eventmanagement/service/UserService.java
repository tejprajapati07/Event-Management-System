package com.eventmanagement.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.eventmanagement.model.Event;
import com.eventmanagement.model.RSVP;
import com.eventmanagement.model.User;
import com.eventmanagement.repository.RSVPRepository;
import com.eventmanagement.repository.UserRepository;

@Service
public class UserService {
    @Autowired
    private UserRepository userRepository;
    
    @Autowired
    private RSVPRepository rsvpRepository;
    
    @Autowired
    private EventService eventService;


    public User register(User user) {
        return userRepository.save(user);
    }

    public User login(String email, String password) {
        return userRepository.findByEmailAndPassword(email, password);
    }
    
    public void saveRsvp(Long eventId, int numTickets, String name, String email) {
        Event event = eventService.getEventById(eventId);
        if (event != null) {
            RSVP rsvp = new RSVP();
            rsvp.setEvent(event);
            rsvp.setNumTickets(numTickets);
            rsvp.setBookingName(name);
            rsvp.setBookingEmail(email);
            rsvpRepository.save(rsvp);
        }
    }
    public List<RSVP> getUserBookings() {
        // Retrieve all RSVPs for the user (adjust this logic based on user-specific filtering if needed)
        return rsvpRepository.findAll(); // Replace with user-specific filtering as needed
    }
}
