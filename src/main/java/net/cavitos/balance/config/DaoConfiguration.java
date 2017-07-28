package net.cavitos.balance.config;

import org.mybatis.spring.annotation.MapperScan;
import org.springframework.context.annotation.Configuration;
import org.springframework.context.annotation.Import;

@Configuration
@MapperScan("net.cavitos.balance.model.dao")
@Import(ModelConfiguration.class)
public class DaoConfiguration {

}
