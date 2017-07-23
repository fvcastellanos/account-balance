package net.cavitos.balance;

import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.boot.builder.SpringApplicationBuilder;
import org.springframework.boot.context.web.SpringBootServletInitializer;

@SpringBootApplication
public class ApplicationInitializer extends SpringBootServletInitializer {

    public static void main(String[] args) {
        final Object[] configurationList = new Object[] {
                ApplicationInitializer.class
        };
        SpringApplication.run(ApplicationInitializer.class, args);
    }

    @Override
    protected SpringApplicationBuilder configure(final SpringApplicationBuilder application) {
        return application.sources(ApplicationInitializer.class);
    }

}
