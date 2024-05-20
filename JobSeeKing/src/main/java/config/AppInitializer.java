package config;

import javax.servlet.ServletContext;
import javax.servlet.ServletException;
import javax.servlet.ServletRegistration;

import org.springframework.web.context.ContextLoaderListener;
import org.springframework.web.context.support.AnnotationConfigWebApplicationContext;
import org.springframework.web.filter.DelegatingFilterProxy;
import org.springframework.web.servlet.DispatcherServlet;

import dao.UserRepository;

public class AppInitializer implements org.springframework.web.WebApplicationInitializer {
	
	
	
	@Override
    public void onStartup(ServletContext servletContext) throws ServletException {
        // Create and configure ApplicationContext
        AnnotationConfigWebApplicationContext context = new AnnotationConfigWebApplicationContext();
        context.register(WebMvcConfig.class);
        context.register(SecurityConfig.class);
        context.register(UserRepository.class);
        // Register ContextLoaderListener
        servletContext.addListener(new ContextLoaderListener(context));
        // Register springSecurityFilterChain
        servletContext.addFilter("securityFilter", new DelegatingFilterProxy("springSecurityFilterChain"))
      .addMappingForUrlPatterns(null, false, "/*");
        
//        // Configure CharacterEncodingFilter
//        CharacterEncodingFilter characterEncodingFilter = new CharacterEncodingFilter();
//        characterEncodingFilter.setEncoding("UTF-8");
//        characterEncodingFilter.setForceEncoding(true);
//
//        // Register characterEncodingFilter
//        FilterRegistration.Dynamic filterRegistration = servletContext.addFilter("characterEncodingFilter", characterEncodingFilter);
//        filterRegistration.addMappingForUrlPatterns(null, false, "/*");
//        
        // Register DispatcherServlet in Spring MVC
        ServletRegistration.Dynamic dispatcher = servletContext.addServlet("SpringDispatcher", new DispatcherServlet(context));
        dispatcher.setLoadOnStartup(1);
        dispatcher.addMapping("/");
    }
}