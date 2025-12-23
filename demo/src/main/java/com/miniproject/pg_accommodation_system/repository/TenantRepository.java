package com.miniproject.pg_accommodation_system.repository;

import com.miniproject.pg_accommodation_system.entity.Tenant;
import org.springframework.data.jpa.repository.JpaRepository;

import java.util.Optional;

public interface TenantRepository extends JpaRepository<Tenant, Long> {
    Optional<Tenant> findByEmail(String email);
}
