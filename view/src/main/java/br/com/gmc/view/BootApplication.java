package br.com.gmc.view;

import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.EnableAutoConfiguration;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.boot.autoconfigure.domain.EntityScan;
import org.springframework.boot.web.support.SpringBootServletInitializer;
import org.springframework.context.annotation.ComponentScan;
import org.springframework.data.jpa.repository.config.EnableJpaRepositories;
import org.springframework.scheduling.annotation.EnableAsync;
import org.springframework.web.WebApplicationInitializer;

@SpringBootApplication
@EnableAutoConfiguration
@ComponentScan(basePackages = "br.com.gmc")
@EntityScan(basePackages = "br.com.gmc")
@EnableJpaRepositories(basePackages = "br.com.gmc")
@EnableAsync
public class BootApplication extends SpringBootServletInitializer implements WebApplicationInitializer {

	public static void main(String[] args) {
		SpringApplication.run(BootApplication.class, args);
	}

	/*
	 * @Override public SpringApplicationBuilder
	 * configure(SpringApplicationBuilder application) { return
	 * application.sources(BootApplication.class); }
	 */
}
