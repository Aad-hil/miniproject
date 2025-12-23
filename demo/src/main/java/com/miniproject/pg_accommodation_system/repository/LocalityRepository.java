package com.miniproject.pg_accommodation_system.repository;

import com.miniproject.pg_accommodation_system.entity.Locality;
import org.springframework.data.jpa.repository.JpaRepository;

import java.util.List;
import java.util.Optional;

public interface LocalityRepository extends JpaRepository<Locality, Long> {
    Optional<Locality> findByNameIgnoreCaseAndCity_Id(String name, Long cityId);
    List<Locality> findByCity_Id(Long cityId);
}
