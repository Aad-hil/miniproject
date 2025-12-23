package com.miniproject.pg_accommodation_system.service.impl;

import com.miniproject.pg_accommodation_system.entity.PGPlace;
import com.miniproject.pg_accommodation_system.exception.ForbiddenException;
import com.miniproject.pg_accommodation_system.exception.NotFoundException;
import com.miniproject.pg_accommodation_system.exception.ValidationException;
import com.miniproject.pg_accommodation_system.entity.Owner;
import com.miniproject.pg_accommodation_system.repository.PGPlaceRepository;
import com.miniproject.pg_accommodation_system.service.TenantService;
import org.springframework.stereotype.Service;

import java.util.List;
import java.util.Optional;
@Service
public class TenantServiceImpl implements TenantService {

    private final PGPlaceRepository placeRepo;

    public TenantServiceImpl(PGPlaceRepository placeRepo) {
        this.placeRepo = placeRepo;
    }

    @Override
    public List<PGPlace> listByCityId(Long cityId) {
        return placeRepo.findByCity_IdAndStatus(cityId, "AVAILABLE");
    }

    @Override
    public List<PGPlace> searchByLocality(String locality) {
        if (locality == null || locality.trim().isEmpty()) {
            throw new ValidationException("Locality must be a non-empty text input");
        }
        return placeRepo.findByLocality_NameIgnoreCaseAndStatus(locality.trim(), "AVAILABLE");
    }

    @Override
    public PGPlace getPlaceProfile(Long placeId, boolean incrementVisitor) {
        PGPlace place = placeRepo.findById(placeId)
                .orElseThrow(() -> new NotFoundException("PG place not found with id " + placeId));
        if (incrementVisitor) {
            place.setVisitorCount(place.getVisitorCount() + 1);
            placeRepo.save(place);
        }
        return place;
    }

    @Override
    public Optional<Owner> getOwnerContactIfAvailable(Long placeId) {
        PGPlace place = getPlaceProfile(placeId, false);
        if ("AVAILABLE".equalsIgnoreCase(place.getStatus())) {
            return Optional.of(place.getOwner());
        }
        throw new ForbiddenException("Contact details accessible only if the place is AVAILABLE");
    }
}
