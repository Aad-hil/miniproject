package com.miniproject.pg_accommodation_system.controller;

import java.util.List;
import java.util.stream.Collectors;

import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import com.miniproject.pg_accommodation_system.dto.DtoMapper;
import com.miniproject.pg_accommodation_system.dto.OwnerDTO;
import com.miniproject.pg_accommodation_system.dto.PGPlaceDTO;
import com.miniproject.pg_accommodation_system.exception.ForbiddenException;
import com.miniproject.pg_accommodation_system.service.TenantService;

@RestController
@RequestMapping("/pg")
public class PGController {

    private final TenantService tenantService;

    public PGController(TenantService tenantService) {
        this.tenantService = tenantService;
    }

    @GetMapping("/city/{cityId}")
    public List<PGPlaceDTO> getPlacesByCity(@PathVariable Long cityId) {
        return tenantService.listByCityId(cityId)
                .stream()
                .map(DtoMapper::toDto)   // convert entity → DTO
                .collect(Collectors.toList());
    }

    @GetMapping("/locality/{localityName}")
    public List<PGPlaceDTO> getPlacesByLocality(@PathVariable String localityName) {
        return tenantService.searchByLocality(localityName)
                .stream()
                .map(DtoMapper::toDto)
                .collect(Collectors.toList());
    }


    @GetMapping("/details/{placeId}")
    public PGPlaceDTO getPlaceDetails(@PathVariable Long placeId) {
        return DtoMapper.toDto(tenantService.getPlaceProfile(placeId, true));
    }

    @GetMapping("/owner/{placeId}")
    public OwnerDTO getOwnerContact(@PathVariable Long placeId) {
        return tenantService.getOwnerContactIfAvailable(placeId)
                .map(owner -> new OwnerDTO(owner.getId(), owner.getName(), owner.getEmail(), owner.getMobile(), owner.getAge()))
                .orElseThrow(() -> new ForbiddenException("Contact details accessible only if the place is AVAILABLE"));
    }
}
