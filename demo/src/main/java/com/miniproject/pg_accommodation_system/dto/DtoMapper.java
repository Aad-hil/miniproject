package com.miniproject.pg_accommodation_system.dto;

import com.miniproject.pg_accommodation_system.entity.PGPlace;

public class DtoMapper {

    public static PGPlaceDTO toDto(PGPlace place) {
        return new PGPlaceDTO(
                place.getId(),
                place.getRegistrationNumber(),
                place.getTitle(),
                place.getBuiltUpArea().doubleValue(),
                place.getRentAmount().doubleValue(),
                place.getStatus(),
                place.getAddress(),
                place.getCity().getName(),
                place.getLocality().getName(),
                place.getOwner().getName(),
                place.getOwner().getEmail(),
                place.getOwner().getMobile()
        );
    }
}
