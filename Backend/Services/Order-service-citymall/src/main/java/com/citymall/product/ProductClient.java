package com.citymall.product;

import com.citymall.exception.BusinessException;
import com.citymall.orderService.response.ApiResponse;
import lombok.RequiredArgsConstructor;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.core.ParameterizedTypeReference;
import org.springframework.http.HttpEntity;
import org.springframework.http.HttpHeaders;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Service;
import org.springframework.web.client.RestTemplate;

import java.util.List;

import static org.springframework.http.HttpHeaders.CONTENT_TYPE;
import static org.springframework.http.HttpMethod.POST;
import static org.springframework.http.MediaType.APPLICATION_JSON_VALUE;

@Service
@RequiredArgsConstructor
public class ProductClient {

    @Value("${application.config.product-url}")
    private String productUrl;
    private final RestTemplate restTemplate;

    public List<PurchaseResponse> purchaseProducts(List<PurchaseRequest> requestBody) {

        HttpHeaders headers = new HttpHeaders();
        headers.set(CONTENT_TYPE, APPLICATION_JSON_VALUE);

        HttpEntity<List<PurchaseRequest>> requestEntity = new HttpEntity<>(requestBody, headers);

        ParameterizedTypeReference<ApiResponse<List<PurchaseResponse>>> responseType =
                new ParameterizedTypeReference<>() {
                };

        ResponseEntity<ApiResponse<List<PurchaseResponse>>> responseEntity =
                restTemplate.exchange(
                        productUrl + "/purchase",
                        POST,
                        requestEntity,
                        responseType
                );

        if (responseEntity.getStatusCode().isError()) {
            throw new BusinessException(
                    "An error occurred while processing the products purchase: "
                            + responseEntity.getStatusCode()
            );
        }

        ApiResponse<List<PurchaseResponse>> response = responseEntity.getBody();

        return response.getData();
    }

    public List<PurchaseResponse> validateProducts(List<PurchaseRequest> requestBody) {

        HttpHeaders headers = new HttpHeaders();
        headers.set(CONTENT_TYPE, APPLICATION_JSON_VALUE);

        HttpEntity<List<PurchaseRequest>> requestEntity =
                new HttpEntity<>(requestBody, headers);

        ParameterizedTypeReference<ApiResponse<List<PurchaseResponse>>> responseType =
                new ParameterizedTypeReference<>() {};

        ResponseEntity<ApiResponse<List<PurchaseResponse>>> responseEntity =
                restTemplate.exchange(
                        productUrl + "/validate",
                        POST,
                        requestEntity,
                        responseType
                );

        if (responseEntity.getStatusCode().isError()) {
            throw new BusinessException(
                    "An error occurred while validating products: "
                            + responseEntity.getStatusCode()
            );
        }

        ApiResponse<List<PurchaseResponse>> response = responseEntity.getBody();

        if (response == null || response.getData() == null) {
            throw new BusinessException("Product validation failed");
        }

        return response.getData();
    }
}
