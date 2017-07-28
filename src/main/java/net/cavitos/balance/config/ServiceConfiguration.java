package net.cavitos.balance.config;

import net.cavitos.balance.service.TransactionTypeService;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;

@Configuration
public class ServiceConfiguration {

    @Bean
    public TransactionTypeService transactionTypeService() {
        return new TransactionTypeService();
    }
}
