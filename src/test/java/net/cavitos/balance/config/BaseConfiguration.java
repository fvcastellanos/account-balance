package net.cavitos.balance.config;

import org.springframework.beans.factory.config.PropertyPlaceholderConfigurer;
import org.springframework.context.annotation.Configuration;
import org.springframework.context.annotation.Import;

@Configuration
@Import({
    DaoConfiguration.class
})
public class BaseConfiguration
{
    public static class TestConfiguration {

//        public PropertyPlaceholderConfigurer propertyPlaceholderConfigurer() {
//            return
//        }
    }
}

