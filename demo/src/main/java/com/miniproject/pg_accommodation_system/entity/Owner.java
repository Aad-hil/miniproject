package com.miniproject.pg_accommodation_system.entity;

import jakarta.persistence.*;
import lombok.*;
import java.util.List;

@Entity
@Table(name = "owner")
@Getter
@Setter
@NoArgsConstructor
@AllArgsConstructor
@Builder
public class Owner {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long id;

    @Column(nullable = false, length = 100)
    private String name;

    @Column(nullable = false, unique = true, length = 150)
    private String email;

    @Column(nullable = false, unique = true, length = 20)
    private String mobile;

    @Column(nullable = false)
    private Integer age;

    @OneToMany(mappedBy = "owner")
    private List<PGPlace> places;
}
