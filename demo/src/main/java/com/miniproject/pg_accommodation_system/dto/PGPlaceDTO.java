package com.miniproject.pg_accommodation_system.dto;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data                   // generates getters, setters, toString, equals, hashCode
@NoArgsConstructor      // generates no-args constructor
@AllArgsConstructor     // generates all-args constructor
public class PGPlaceDTO {
    private Long id;
    private String registrationNumber;
    private String title;
    private Double builtUpArea;
    private Double rentAmount;
    private String status;
    private String address;
    private String cityName;
    private String localityName;
    private String ownerName;
    private String ownerEmail;
    private String ownerMobile;
}
