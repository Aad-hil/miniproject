package com.miniproject.pg_accommodation_system.service.impl;

import com.miniproject.pg_accommodation_system.entity.City;
import com.miniproject.pg_accommodation_system.entity.Locality;
import com.miniproject.pg_accommodation_system.repository.CityRepository;
import com.miniproject.pg_accommodation_system.repository.LocalityRepository;
import com.miniproject.pg_accommodation_system.repository.PGPlaceRepository;
import com.miniproject.pg_accommodation_system.service.AdminService;
import org.springframework.stereotype.Service;

@Service
public class AdminServiceImpl implements AdminService {

    private final CityRepository cityRepo;
    private final LocalityRepository localityRepo;
    private final PGPlaceRepository placeRepo;

    public AdminServiceImpl(CityRepository cityRepo,
                            LocalityRepository localityRepo,
                            PGPlaceRepository placeRepo) {
        this.cityRepo = cityRepo;
        this.localityRepo = localityRepo;
        this.placeRepo = placeRepo;
    }

    @Override
    public City addCity(String name) {
        if (name == null || name.trim().isEmpty()) {
            throw new IllegalArgumentException("City name cannot be empty");
        }
        City city = new City();
        city.setName(name.trim());
        return cityRepo.save(city);
    }

    @Override
    public Locality addLocality(Long cityId, String localityName) {
        if (localityName == null || localityName.trim().isEmpty()) {
            throw new IllegalArgumentException("Locality name cannot be empty");
        }

        City city = cityRepo.findById(cityId)
                .orElseThrow(() -> new IllegalArgumentException("City not found"));

        Locality locality = new Locality();
        locality.setName(localityName.trim());
        locality.setCity(city);

        return localityRepo.save(locality);
    }

    @Override
    public void deletePlace(Long placeId) {
        if (!placeRepo.existsById(placeId)) {
            throw new IllegalArgumentException("Invalid place ID");
        }
        placeRepo.deleteById(placeId);
    }
}
