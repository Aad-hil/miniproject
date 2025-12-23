package com.miniproject.pg_accommodation_system.repository;

import com.miniproject.pg_accommodation_system.entity.PGPlace;
import org.springframework.data.jpa.repository.JpaRepository;

import java.util.List;
import java.util.Optional;

public interface PGPlaceRepository extends JpaRepository<PGPlace, Long> {
    List<PGPlace> findByCity_IdAndStatus(Long cityId, String status);
    List<PGPlace> findByLocality_NameIgnoreCaseAndStatus(String locality, String status);
    List<PGPlace> findByOwner_Id(Long ownerId);
    Optional<PGPlace> findByRegistrationNumber(String registrationNumber);
}
