package net.cavitos.balance.repository;

import org.springframework.data.repository.PagingAndSortingRepository;

import net.cavitos.balance.domain.model.Provider;

public interface ProviderRepository extends PagingAndSortingRepository<Provider, Long> {
    
}
