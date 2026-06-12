package com.citymall.mapper;

import com.citymall.dto.CustomerRequest;
import com.citymall.dto.CustomerResponse;
import com.citymall.entity.Customer;
import org.springframework.stereotype.Service;

@Service
public class CustomerMapper{

    public Customer mapToCustomer(CustomerRequest customerRequest){
        if(customerRequest==null){
            return null;
        }
        return Customer.builder()
                .firstname(customerRequest.firstname())
                .lastname(customerRequest.lastname())
                .email(customerRequest.email())
                .address(customerRequest.address())
                .build();
    }

    public CustomerResponse mapToCustomerResponse(Customer customer){
        if (customer==null){
            return null;
        }
        return new CustomerResponse(
                customer.getId(),
                customer.getFirstname(),
                customer.getLastname(),
                customer.getEmail(),
                customer.getAddress()
        );
    }
}
