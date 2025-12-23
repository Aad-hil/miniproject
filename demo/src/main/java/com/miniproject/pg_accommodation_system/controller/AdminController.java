package com.miniproject.pg_accommodation_system.controller;

import com.miniproject.pg_accommodation_system.dto.CityDTO;
import com.miniproject.pg_accommodation_system.dto.LocalityDTO;
import com.miniproject.pg_accommodation_system.entity.City;
import com.miniproject.pg_accommodation_system.entity.Locality;
import com.miniproject.pg_accommodation_system.service.AdminService;
import io.swagger.v3.oas.annotations.Operation;
import io.swagger.v3.oas.annotations.tags.Tag;
import org.springframework.web.bind.annotation.*;

@RestController
@RequestMapping("/admin")
@Tag(name = "Admin APIs", description = "Endpoints for administrators to manage cities, localities, and PG places")
public class AdminController {

    private final AdminService adminService;

    public AdminController(AdminService adminService) {
        this.adminService = adminService;
    }

    @Operation(summary = "Add City")
    @PostMapping("/cities/add")
    public CityDTO addCity(@RequestParam String name) {
        City city = adminService.addCity(name);
        return new CityDTO(city.getId(), city.getName());
    }

    @Operation(summary = "Add Locality")
    @PostMapping("/localities/add")
    public LocalityDTO addLocality(@RequestParam Long cityId, @RequestParam String name) {
        Locality locality = adminService.addLocality(cityId, name);
        return new LocalityDTO(locality.getId(), locality.getName(), locality.getCity().getName());
    }

    @Operation(summary = "Delete PG Place")
    @DeleteMapping("/places/delete")
    public void delete(@RequestParam Long placeId) {
        adminService.deletePlace(placeId);
    }
}
