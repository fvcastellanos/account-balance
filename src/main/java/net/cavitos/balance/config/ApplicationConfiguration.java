package net.cavitos.balance.config;

import org.springframework.context.annotation.Configuration;
import org.springframework.context.annotation.Import;

@Configuration
@Import({
    DaoConfiguration.class,
    ServiceConfiguration.class
})
public class ApplicationConfiguration {
}
