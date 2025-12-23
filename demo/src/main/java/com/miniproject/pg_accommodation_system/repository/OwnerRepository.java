package com.miniproject.pg_accommodation_system.repository;

import com.miniproject.pg_accommodation_system.entity.Owner;
import org.springframework.data.jpa.repository.JpaRepository;

import java.util.Optional;

public interface OwnerRepository extends JpaRepository<Owner, Long> {
    Optional<Owner> findByEmail(String email);
}
