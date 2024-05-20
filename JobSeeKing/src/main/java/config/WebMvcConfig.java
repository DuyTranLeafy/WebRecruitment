package config;

import java.nio.charset.StandardCharsets;
import java.util.List;

import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.ComponentScan;
import org.springframework.context.annotation.Configuration;
import org.springframework.http.converter.HttpMessageConverter;
import org.springframework.http.converter.StringHttpMessageConverter;
import org.springframework.web.multipart.commons.CommonsMultipartResolver;
import org.springframework.web.servlet.config.annotation.EnableWebMvc;
import org.springframework.web.servlet.config.annotation.ResourceHandlerRegistry;
import org.springframework.web.servlet.config.annotation.WebMvcConfigurer;
import org.springframework.web.servlet.view.InternalResourceViewResolver;
//alter viewResolver and resources mapping configuration in JobSeeking-servlet.xml
@Configuration
@EnableWebMvc
@ComponentScan(basePackages = "controller") //alter <context:component-scan base-package="controller" />
public class WebMvcConfig implements WebMvcConfigurer{
	@Bean(name = "viewResolver")
	public InternalResourceViewResolver getViewResolver() {
	    InternalResourceViewResolver viewResolver = new InternalResourceViewResolver();
	    viewResolver.setPrefix("/jsp/");
	    viewResolver.setSuffix(".jsp");
	    return viewResolver;
	}
	
	@Bean(name = "multipartResolver")
	public CommonsMultipartResolver filterMultipartResolver() {
	CommonsMultipartResolver multipartResolver = new CommonsMultipartResolver();
	multipartResolver.setDefaultEncoding("utf-8");
	multipartResolver.setMaxUploadSize(1000000);
	return multipartResolver;
	}
	
	@Override
    public void configureMessageConverters(List<HttpMessageConverter<?>> converters) {
        StringHttpMessageConverter converter = new StringHttpMessageConverter(StandardCharsets.UTF_8);
        converters.add(converter);
    }
	
//	@Bean(name = "multipartResolver")
//	public CommonsMultipartResolver multipartResolver() 
//	{
//	    CommonsMultipartResolver multipartResolver = new CommonsMultipartResolver();
//	    multipartResolver.setMaxUploadSize(20848820);
//	    return multipartResolver;
//	}
	
	@Override
    public void addResourceHandlers(ResourceHandlerRegistry registry) {

        registry.addResourceHandler("/resources/**").addResourceLocations("/resources/");
    }
}