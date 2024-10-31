package com.eventmanagement.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.eventmanagement.model.RSVP;
import com.eventmanagement.repository.RSVPRepository;

@Service
public class RSVPService {

    @Autowired
    private RSVPRepository rsvpRepository;

    public List<RSVP> getAllRsvps() {
        return rsvpRepository.findAll();
    }

    public void updateRsvpStatus(Long id, String status) {
        rsvpRepository.updateStatus(id, status);
    }
    
    public RSVP getRsvpById(Long rsvpId) {
        return rsvpRepository.findById(rsvpId).orElse(null);
    }
}

