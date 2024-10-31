package com.eventmanagement.model;

import jakarta.persistence.Entity;
import jakarta.persistence.GeneratedValue;
import jakarta.persistence.GenerationType;
import jakarta.persistence.Id;
import jakarta.persistence.ManyToOne;

@Entity
public class RSVP {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long id;

    @ManyToOne
    private Event event;

    private int numTickets;
    private String bookingName;
    private String bookingEmail;

    private String status = "Pending"; // Default status set to "Pending"

    // Getters and Setters
    public Long getId() { return id; }
    public void setId(Long id) { this.id = id; }

    public Event getEvent() { return event; }
    public void setEvent(Event event) { this.event = event; }

    public int getNumTickets() { return numTickets; }
    public void setNumTickets(int numTickets) { this.numTickets = numTickets; }

    public String getBookingName() { return bookingName; }
    public void setBookingName(String bookingName) { this.bookingName = bookingName; }

    public String getBookingEmail() { return bookingEmail; }
    public void setBookingEmail(String bookingEmail) { this.bookingEmail = bookingEmail; }

    public String getStatus() { return status; }
    public void setStatus(String status) { this.status = status; }
}
