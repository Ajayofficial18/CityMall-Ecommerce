package com.citymall.config;

import org.springframework.cache.CacheManager;
import org.springframework.cache.annotation.EnableCaching;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;

import org.springframework.data.redis.cache.RedisCacheConfiguration;
import org.springframework.data.redis.cache.RedisCacheManager;

import org.springframework.data.redis.connection.RedisConnectionFactory;
import org.springframework.data.redis.serializer.RedisSerializationContext;
import org.springframework.data.redis.serializer.GenericJackson2JsonRedisSerializer;

import java.time.Duration;
import java.util.Map;

@Configuration
public class CacheConfig {

    @Bean
    public CacheManager cacheManager(
            RedisConnectionFactory connectionFactory
    ) {

        RedisCacheConfiguration defaultCache =
                RedisCacheConfiguration.defaultCacheConfig()

                        // Default TTL
                        .entryTtl(Duration.ofMinutes(30))

                        // Don't cache null values
                        .disableCachingNullValues()

                        // JSON serialization
                        .serializeValuesWith(
                                RedisSerializationContext.SerializationPair
                                        .fromSerializer(
                                                new GenericJackson2JsonRedisSerializer()
                                        )
                        );

        return RedisCacheManager.builder(connectionFactory)

                .cacheDefaults(defaultCache)

                .withInitialCacheConfigurations(
                        Map.of(

                                "products",
                                defaultCache.entryTtl(Duration.ofMinutes(10)),

                                "productList",
                                defaultCache.entryTtl(Duration.ofMinutes(5)),

                                "productSearch",
                                defaultCache.entryTtl(Duration.ofMinutes(2))

                        )
                )

                .transactionAware()

                .build();
    }
}

