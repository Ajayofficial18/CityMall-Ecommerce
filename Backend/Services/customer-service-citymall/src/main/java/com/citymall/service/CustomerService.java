package com.citymall.service;

import com.citymall.dto.CustomerRequest;
import com.citymall.dto.CustomerResponse;

import java.util.List;

public interface CustomerService {
    CustomerResponse createCustomer(CustomerRequest customerRequest);
    CustomerResponse getCustomerById(String id);
    List<CustomerResponse> getAllCustomers();
    CustomerResponse updateCustomer(String id, CustomerRequest customerRequest);
    String deleteCustomer(String id);
    Boolean isCustomerExist(String id);
}
