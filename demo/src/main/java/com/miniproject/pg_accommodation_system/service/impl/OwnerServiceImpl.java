package com.miniproject.pg_accommodation_system.service.impl;

import com.miniproject.pg_accommodation_system.entity.City;
import com.miniproject.pg_accommodation_system.entity.Locality;
import com.miniproject.pg_accommodation_system.entity.Owner;
import com.miniproject.pg_accommodation_system.entity.PGPlace;
import com.miniproject.pg_accommodation_system.exception.ForbiddenException;
import com.miniproject.pg_accommodation_system.exception.NotFoundException;
import com.miniproject.pg_accommodation_system.exception.ValidationException;
import com.miniproject.pg_accommodation_system.repository.CityRepository;
import com.miniproject.pg_accommodation_system.repository.LocalityRepository;
import com.miniproject.pg_accommodation_system.repository.OwnerRepository;
import com.miniproject.pg_accommodation_system.repository.PGPlaceRepository;
import com.miniproject.pg_accommodation_system.service.OwnerService;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class OwnerServiceImpl implements OwnerService {

    private final OwnerRepository ownerRepo;
    private final PGPlaceRepository placeRepo;
    private final CityRepository cityRepo;
    private final LocalityRepository localityRepo;

    public OwnerServiceImpl(OwnerRepository ownerRepo,
                            PGPlaceRepository placeRepo,
                            CityRepository cityRepo,
                            LocalityRepository localityRepo) {
        this.ownerRepo = ownerRepo;
        this.placeRepo = placeRepo;
        this.cityRepo = cityRepo;
        this.localityRepo = localityRepo;
    }

    @Override
    public PGPlace addPlace(Long ownerId, PGPlace place, Long cityId, String localityName) {
        Owner owner = ownerRepo.findById(ownerId)
                .orElseThrow(() -> new NotFoundException("Owner not found with id " + ownerId));
        if (owner.getAge() < 18) {
            throw new ValidationException("Owner must be at least 18 years old");
        }

        City city = cityRepo.findById(cityId)
                .orElseThrow(() -> new NotFoundException("City not found with id " + cityId));

        Locality locality = localityRepo.findByNameIgnoreCaseAndCity_Id(localityName, cityId)
                .orElseThrow(() -> new NotFoundException("Locality not found in city"));

        place.setOwner(owner);
        place.setCity(city);
        place.setLocality(locality);
        place.setStatus("AVAILABLE");
        place.setVisitorCount(0);

        return placeRepo.save(place);
    }

    @Override
    public List<PGPlace> listOwnerPlaces(Long ownerId) {
        return placeRepo.findByOwner_Id(ownerId);
    }

    @Override
    public PGPlace changeAvailability(Long ownerId, Long placeId, String status) {
        PGPlace place = placeRepo.findById(placeId)
                .orElseThrow(() -> new NotFoundException("PG place not found with id " + placeId));
        if (!place.getOwner().getId().equals(ownerId)) {
            throw new ForbiddenException("You are not the owner of this place");
        }
        place.setStatus(status.toUpperCase());
        return placeRepo.save(place);
    }

    @Override
    public PGPlace updatePlace(Long ownerId, Long placeId, PGPlace updates) {
        PGPlace place = placeRepo.findById(placeId)
                .orElseThrow(() -> new NotFoundException("PG place not found with id " + placeId));
        if (!place.getOwner().getId().equals(ownerId)) {
            throw new ForbiddenException("You are not the owner of this place");
        }
        if (updates.getTitle() != null) place.setTitle(updates.getTitle());
        if (updates.getBuiltUpArea() != null) place.setBuiltUpArea(updates.getBuiltUpArea());
        if (updates.getRentAmount() != null) place.setRentAmount(updates.getRentAmount());
        if (updates.getAddress() != null) place.setAddress(updates.getAddress());
        return placeRepo.save(place);
    }

    @Override
    public void deletePlace(Long ownerId, Long placeId) {
        PGPlace place = placeRepo.findById(placeId)
                .orElseThrow(() -> new NotFoundException("PG place not found with id " + placeId));
        if (!place.getOwner().getId().equals(ownerId)) {
            throw new ForbiddenException("You are not the owner of this place");
        }
        placeRepo.delete(place);
    }
}
