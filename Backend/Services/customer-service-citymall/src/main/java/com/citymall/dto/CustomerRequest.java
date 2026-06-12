package com.citymall.dto;

import com.citymall.entity.Address;
import jakarta.validation.constraints.Email;
import jakarta.validation.constraints.NotBlank;

public record CustomerRequest(

        @NotBlank(message = "Firstname cannot be null")
        String firstname,

        @NotBlank(message = "Lastname cannot be null")
        String lastname,

        @NotBlank(message = "Email cannot be null")
        @Email(message = "Email should be valid")
        String email,

        Address address
) {
}

