package com.rubypaper;

import org.springframework.boot.Banner;
import org.springframework.boot.SpringApplication;
import org.springframework.boot.WebApplicationType;
import org.springframework.boot.autoconfigure.EnableAutoConfiguration;
import org.springframework.boot.autoconfigure.web.servlet.WebMvcAutoConfiguration;
import org.springframework.context.annotation.ComponentScan;
import org.springframework.context.annotation.Configuration;

//@SpringBootApplication
@Configuration
// @EnableAutoConfiguration은 CommonsMultipartResolver 같은 내가 만들지 않은 객체들을 
// 메모리에 생성하는 역할을 한다. 
@EnableAutoConfiguration
// @ComponentScan은 @Configuration, @Repository, @Service, @Controller, @RestController가 
// 붙은 클래스의 객체를 생성하는 역할을 한다. 
@ComponentScan(basePackages= {"com.rubypaper", "com.ruby"})   
public class SpringBooTProject01Application {
	
	public static void main(String[] args) {
//		SpringApplication.run(SpringBooTProject01Application.class, args);
		SpringApplication application = 
			new SpringApplication(SpringBooTProject01Application.class);
		application.setWebApplicationType(WebApplicationType.SERVLET);
		application.setBannerMode(Banner.Mode.OFF);
		application.run(args);
	}

}
