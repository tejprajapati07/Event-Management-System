package com.eventmanagement.repository;

import org.springframework.data.jpa.repository.JpaRepository;
import com.eventmanagement.model.Event;

public interface EventRepository extends JpaRepository<Event, Long> {
}
