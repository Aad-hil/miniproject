package com.miniproject.pg_accommodation_system.service;

import com.miniproject.pg_accommodation_system.entity.PGPlace;

import java.util.List;

public interface OwnerService {
    // Add a new PG place
    PGPlace addPlace(Long ownerId, PGPlace place, Long cityId, String locality);

    // Retrieve all PG places added by the owner
    List<PGPlace> listOwnerPlaces(Long ownerId);

    // Change status of PG place (Available or Not Available)
    PGPlace changeAvailability(Long ownerId, Long placeId, String status);

    // Edit place details
    PGPlace updatePlace(Long ownerId, Long placeId, PGPlace updates);

    // Delete place details
    void deletePlace(Long ownerId, Long placeId);
}
