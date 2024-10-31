package com.eventmanagement.repository;

import org.springframework.data.jpa.repository.JpaRepository;
import com.eventmanagement.model.Attendee;

public interface AttendeeRepository extends JpaRepository<Attendee, Long> {
}
