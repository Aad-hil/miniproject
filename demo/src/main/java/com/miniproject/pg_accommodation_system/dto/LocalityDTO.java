package com.miniproject.pg_accommodation_system.dto;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
@AllArgsConstructor
public class LocalityDTO {
    private Long id;
    private String name;
    private String cityName;
}
