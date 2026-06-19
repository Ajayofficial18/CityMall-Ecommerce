package com.citymall.repository;

import com.citymall.entity.Product;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;
import jakarta.persistence.LockModeType;
import org.springframework.data.jpa.repository.Lock;

import java.util.List;

@Repository
public interface ProductRepository extends JpaRepository<Product, Integer> {
    List<Product> findAllByIdInOrderById(List<Integer> ids);
    @Query("""
    SELECT p
    FROM Product p
    JOIN p.category c
    WHERE LOWER(p.name) LIKE LOWER(CONCAT('%', :keyword, '%'))
       OR LOWER(c.name) LIKE LOWER(CONCAT('%', :keyword, '%'))
""")
    Page<Product> searchProducts(
            @Param("keyword") String keyword,
            Pageable pageable
    );

    @Lock(LockModeType.PESSIMISTIC_WRITE)
    @Query("""
        SELECT p
        FROM Product p
        WHERE p.id IN :ids
        ORDER BY p.id
       """)
    List<Product> findAllByIdInForUpdate(
            @Param("ids")
            List<Integer> ids
    );
}
