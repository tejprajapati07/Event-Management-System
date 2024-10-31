package com.eventmanagement.repository;

import org.springframework.data.jpa.repository.JpaRepository;
import com.eventmanagement.model.Venue;

public interface VenueRepository extends JpaRepository<Venue, Long> {
}
