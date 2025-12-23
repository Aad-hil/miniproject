package com.miniproject.pg_accommodation_system.service;

import com.miniproject.pg_accommodation_system.entity.City;
import com.miniproject.pg_accommodation_system.entity.Locality;

public interface AdminService {
    City addCity(String name);
    Locality addLocality(Long cityId, String localityName);
    void deletePlace(Long placeId);
}

