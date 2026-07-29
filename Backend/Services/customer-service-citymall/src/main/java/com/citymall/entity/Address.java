package com.citymall.entity;

import jakarta.persistence.Embeddable;
import jakarta.validation.constraints.NotBlank;
import lombok.*;
import org.springframework.validation.annotation.Validated;

@AllArgsConstructor
@NoArgsConstructor
@Builder
@Setter
@Getter
@Validated
//@Embeddable
public class Address {

    @NotBlank
    private String street;
    private String houseNumber;
    @NotBlank
    private String zipCode;
}
