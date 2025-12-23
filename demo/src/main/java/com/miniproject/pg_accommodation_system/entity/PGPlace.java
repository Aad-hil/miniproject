package com.miniproject.pg_accommodation_system.entity;

import jakarta.persistence.*;
import lombok.*;
import java.math.BigDecimal;

@Entity
@Table(name = "pg_place")
@Getter
@Setter
@NoArgsConstructor
@AllArgsConstructor
@Builder
public class PGPlace {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long id;

    @Column(nullable = false, unique = true, length = 50)
    private String registrationNumber;

    @Column(nullable = false, length = 150)
    private String title;

    @Column(nullable = false, precision = 10, scale = 2)
    private BigDecimal builtUpArea;

    @Column(nullable = false, precision = 10, scale = 2)
    private BigDecimal rentAmount;

    @Column(nullable = false, length = 20)
    private String status; // "AVAILABLE" or "OCCUPIED"

    @Column(nullable = false, length = 255)
    private String address;

    @ManyToOne(optional = false)
    @JoinColumn(name = "city_id")
    private City city;

    @ManyToOne(optional = false)
    @JoinColumn(name = "locality_id")
    private Locality locality;

    @ManyToOne(optional = false)
    @JoinColumn(name = "owner_id")
    private Owner owner;

    @Column(nullable = false)
    private Integer visitorCount = 0;
}
