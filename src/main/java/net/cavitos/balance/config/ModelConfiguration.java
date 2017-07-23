package net.cavitos.balance.config;

import com.zaxxer.hikari.HikariDataSource;
import org.apache.ibatis.session.SqlSessionFactory;
import org.mybatis.spring.SqlSessionFactoryBean;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.springframework.jdbc.datasource.DataSourceTransactionManager;

import javax.sql.DataSource;

@Configuration
public class ModelConfiguration {

    @Bean
    public HikariDataSource dataSource() {
        final HikariDataSource hikariDataSource = new HikariDataSource() {{
            setDriverClassName("com.mysql.jdbc.Driver");
            setJdbcUrl("jdbc:mysql://localhost:3306/account_balance");
            setUsername("root");
            setPassword("r00t");
        }};
        return hikariDataSource;
    }

    @Bean
    public DataSourceTransactionManager transactionManager(@Qualifier("dataSource") final DataSource dataSource) {
        return new DataSourceTransactionManager(dataSource);
    }

    @Bean
    public SqlSessionFactoryBean sqlSessionFactory(@Qualifier("dataSource") final DataSource dataSource) throws Exception {
        final SqlSessionFactoryBean sqlSessionFactoryBean = new SqlSessionFactoryBean() {{
            setDataSource(dataSource);
        }};

        return sqlSessionFactoryBean;
    }

    @Bean
    public SqlSessionTemplate sqlSessionTemplate(@Qualifier("sqlSessionFactory") final SqlSessionFactory sqlSessionFactory) {
        return new SqlSessionTemplate(sqlSessionFactory);
    }

}
