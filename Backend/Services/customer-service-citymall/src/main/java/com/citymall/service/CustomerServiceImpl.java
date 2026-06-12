package com.citymall.service;

import com.citymall.dto.CustomerRequest;
import com.citymall.dto.CustomerResponse;
import com.citymall.entity.Customer;
import com.citymall.exception.ResourceNotFound;
import com.citymall.mapper.CustomerMapper;
import com.citymall.repository.CustomerRepository;
import io.micrometer.common.util.StringUtils;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.springframework.stereotype.Service;

import java.util.List;

@Slf4j
@Service
@RequiredArgsConstructor
public class CustomerServiceImpl implements CustomerService{

    private final CustomerRepository customerRepository;
    private final CustomerMapper mapper;

    @Override
    public CustomerResponse createCustomer(CustomerRequest customerRequest) {

        Customer customer = mapper.mapToCustomer(customerRequest);
        if(customerRepository.existsByEmail(customer.getEmail())){
            log.info("Email already exists");
            throw new ResourceNotFound("Email already exists: " + customer.getEmail());
        }
        log.info("Created customer with details: {}", customer);
        return mapper.mapToCustomerResponse(customerRepository.save(customer));
    }

    @Override
    public CustomerResponse getCustomerById(String id) {
        var customer = customerRepository.findById(id).orElseThrow(()-> new ResourceNotFound("Customer not found with id: "+id));
        return mapper.mapToCustomerResponse(customer);
    }

    @Override
    public List<CustomerResponse> getAllCustomers() {
        log.info("fetching all customers");
        List<Customer> customers = customerRepository.findAll();
        return customers.stream()
                .map(mapper::mapToCustomerResponse)
                .toList();
    }

    @Override
    public CustomerResponse updateCustomer(String id, CustomerRequest customerRequest) {
        Customer existingCustomer = customerRepository.findById(id)
                .orElseThrow(()-> new ResourceNotFound(
                        "Customer not found with id : " + id
                ));
        if(StringUtils.isNotBlank(customerRequest.firstname())){
            existingCustomer.setFirstname(customerRequest.firstname());
        }
        if(StringUtils.isNotBlank(customerRequest.lastname())){
            existingCustomer.setLastname(customerRequest.lastname());
        }
        if(StringUtils.isNotBlank(customerRequest.email())){
            existingCustomer.setEmail(customerRequest.email());
        }
        if(customerRequest.address() != null){
            existingCustomer.setAddress(customerRequest.address());
        }

        Customer updatedCustomer = customerRepository.save(existingCustomer);

        return mapper.mapToCustomerResponse(updatedCustomer);
    }

    @Override
    public String deleteCustomer(String id) {
        Customer existingCustomer = customerRepository.findById(id)
                .orElseThrow(
                        ()-> new ResourceNotFound("Customer not found with id : "+id)
                );

        customerRepository.delete(existingCustomer);
        return "Customer deleted successfully";
    }

    @Override
    public Boolean isCustomerExist(String id) {
        return customerRepository.findById(id).isPresent();
    }
}
