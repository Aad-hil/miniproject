package com.miniproject.pg_accommodation_system.controller;

import com.miniproject.pg_accommodation_system.dto.DtoMapper;
import com.miniproject.pg_accommodation_system.dto.PGPlaceDTO;
import com.miniproject.pg_accommodation_system.entity.PGPlace;
import com.miniproject.pg_accommodation_system.service.OwnerService;
import io.swagger.v3.oas.annotations.Operation;
import io.swagger.v3.oas.annotations.tags.Tag;
import org.springframework.web.bind.annotation.*;

import java.util.List;
import java.util.stream.Collectors;

@RestController
@RequestMapping("/owner")
@Tag(name = "Owner APIs", description = "Endpoints for PG owners to manage their places")
public class OwnerController {

    private final OwnerService ownerService;

    public OwnerController(OwnerService ownerService) {
        this.ownerService = ownerService;
    }

    // 5. Add a new PG place
    @Operation(summary = "Add a new PG place")
    @PostMapping("/places/add")
    public PGPlaceDTO addPlace(@RequestParam Long ownerId,
                               @RequestParam Long cityId,
                               @RequestParam String locality,
                               @RequestBody PGPlace place) {
        return DtoMapper.toDto(ownerService.addPlace(ownerId, place, cityId, locality));
    }

    // 6. Retrieve all PG places added by the owner
    @Operation(summary = "List PG places added by owner")
    @GetMapping("/places")
    public List<PGPlaceDTO> getOwnerPlaces(@RequestParam Long ownerId) {
        return ownerService.listOwnerPlaces(ownerId)
                .stream()
                .map(DtoMapper::toDto)
                .collect(Collectors.toList());
    }

    // 7. Change the status of PG place
    @Operation(summary = "Change PG status (Available/Not Available)")
    @PatchMapping("/places/{id}")
    public PGPlaceDTO changeStatus(@PathVariable Long id,
                                   @RequestParam Long ownerId,
                                   @RequestParam String status) {
        return DtoMapper.toDto(ownerService.changeAvailability(ownerId, id, status));
    }

    // 8. Edit Place details
    @Operation(summary = "Edit PG place details")
    @PutMapping("/places/edit")
    public PGPlaceDTO editPlace(@RequestParam Long ownerId,
                                @RequestParam Long placeId,
                                @RequestBody PGPlace updates) {
        return DtoMapper.toDto(ownerService.updatePlace(ownerId, placeId, updates));
    }

    // 9. Delete Place Details
    @Operation(summary = "Delete PG place")
    @DeleteMapping("/places/delete")
    public void deletePlace(@RequestParam Long ownerId,
                            @RequestParam Long placeId) {
        ownerService.deletePlace(ownerId, placeId);
    }
}
