package com.miniproject.pg_accommodation_system.entity;

import jakarta.persistence.*;
import lombok.*;

@Entity
@Table(name = "locality",
       uniqueConstraints = @UniqueConstraint(columnNames = {"name", "city_id"}))
@Getter
@Setter
@NoArgsConstructor
@AllArgsConstructor
@Builder
public class Locality {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long id;

    @Column(nullable = false, length = 120)
    private String name;

    @ManyToOne(optional = false)
    @JoinColumn(name = "city_id")
    private City city;
}
