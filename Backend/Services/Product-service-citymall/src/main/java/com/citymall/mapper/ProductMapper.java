package com.citymall.mapper;

import com.citymall.dto.ProductRequest;
import com.citymall.dto.ProductResponse;
import com.citymall.dto.PurchaseResponse;
import com.citymall.entity.Category;
import com.citymall.entity.Product;

public class ProductMapper {
    public Product mapToProduct(ProductRequest productRequest){
        if(productRequest==null){
            return null;
        }

        return Product.builder()
                .id(productRequest.id())
                .name(productRequest.name())
                .description(productRequest.description())
                .availableQuantity(productRequest.availableQuantity())
                .price(productRequest.price())
                .category(
                        Category.builder()
                                .id(productRequest.categoryId())
                                .build()
                )
                .build();
    }

    public ProductResponse mapToProductResponse(Product product){
        if(product==null){
            return null;
        }

        return new ProductResponse(
                product.getId(),
                product.getName(),
                product.getDescription(),
                product.getAvailableQuantity(),
                product.getPrice(),
                product.getCategory().getId(),
                product.getCategory().getName(),
                product.getCategory().getDescription()
        );
    }

    public PurchaseResponse mapToproductPurchaseResponse(Product product, double quantity) {
        if(product==null){
            return null;
        }
        return new PurchaseResponse(
                product.getId(),
                product.getName(),
                product.getDescription(),
                product.getPrice(),
                quantity
        );
    }
}
