package com.miniproject.pg_accommodation_system.service;

import com.miniproject.pg_accommodation_system.entity.PGPlace;
import com.miniproject.pg_accommodation_system.entity.Owner;

import java.util.List;
import java.util.Optional;

public interface TenantService {
    // Retrieve available PG places in a specific city
    List<PGPlace> listByCityId(Long cityId);

    // List available PG places in a specific locality
    List<PGPlace> searchByLocality(String locality);

    // Retrieve PG place detail by id
    PGPlace getPlaceProfile(Long placeId, boolean incrementVisitor);

    // Retrieve owner details only if place is AVAILABLE
    Optional<Owner> getOwnerContactIfAvailable(Long placeId);
}
