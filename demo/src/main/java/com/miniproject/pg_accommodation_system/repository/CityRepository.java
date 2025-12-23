package com.miniproject.pg_accommodation_system.repository;

import com.miniproject.pg_accommodation_system.entity.City;
import org.springframework.data.jpa.repository.JpaRepository;

import java.util.Optional;

public interface CityRepository extends JpaRepository<City, Long> {
    Optional<City> findByNameIgnoreCase(String name);
}
