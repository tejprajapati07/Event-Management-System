package com.eventmanagement.model;

import jakarta.persistence.*;
import lombok.Data;

@Data
@Entity
public class Event {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long id;

    private String name;
    private String description;
    private String date;
    private String imageUrl; // New field for image URL
    private String status = "Open"; // New field for event status, defaulted to "Open"

    @ManyToOne
    @JoinColumn(name = "venue_id")
    private Venue venue;
}
