package com.project.an.config;

import org.apache.ibatis.session.SqlSessionFactory;
import org.apache.tomcat.util.file.ConfigurationSource;
import org.mybatis.spring.SqlSessionFactoryBean;
import org.mybatis.spring.annotation.MapperScan;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.springframework.context.annotation.Primary;
import org.springframework.core.io.Resource;
import org.springframework.core.io.support.PathMatchingResourcePatternResolver;
import org.springframework.scheduling.annotation.EnableScheduling;
import org.springframework.transaction.annotation.EnableTransactionManagement;

import javax.sql.DataSource;

@EnableScheduling
@Configuration
@MapperScan(value = "com.project.an.mapper"
,sqlSessionFactoryRef = "sqlSessionFactorBean")
@EnableTransactionManagement
public class MyBatisConfig {

    @Autowired
    @Qualifier("dataSource")
    DataSource dataSource;

    @Primary
    @Bean(name = "sqlSessionFactoryBean")
    public SqlSessionFactory sqlSessionFactoryBean() throws Exception {
        SqlSessionFactoryBean sessionFactory = new SqlSessionFactoryBean();

        sessionFactory.setDataSource(dataSource);
        Resource[] res = new PathMatchingResourcePatternResolver()
                .getResources("classpath*:/com/project/an/mapper/*Mapper.xml");
        sessionFactory.setMapperLocations(res);
        return sessionFactory.getObject();
    }
}
