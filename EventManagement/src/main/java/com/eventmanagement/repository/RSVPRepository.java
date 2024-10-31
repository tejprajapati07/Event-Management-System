package com.eventmanagement.repository;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Modifying;
import org.springframework.data.jpa.repository.Query;
import org.springframework.transaction.annotation.Transactional;

import com.eventmanagement.model.RSVP;

public interface RSVPRepository extends JpaRepository<RSVP, Long> {

    @Transactional
    @Modifying
    @Query("UPDATE RSVP r SET r.status = :status WHERE r.id = :id")
    void updateStatus(Long id, String status);
}
