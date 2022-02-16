package com.apparel.actions.config;

import javax.sql.DataSource;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.ComponentScan;
import org.springframework.security.config.annotation.authentication.builders.AuthenticationManagerBuilder;
import org.springframework.security.config.annotation.method.configuration.EnableGlobalMethodSecurity;
import org.springframework.security.config.annotation.web.builders.HttpSecurity;
import org.springframework.security.config.annotation.web.configuration.EnableWebSecurity;
import org.springframework.security.config.annotation.web.configuration.WebSecurityConfigurerAdapter;
import org.springframework.security.core.userdetails.UserDetailsService;
import org.springframework.security.web.authentication.rememberme.JdbcTokenRepositoryImpl;
import org.springframework.security.web.authentication.rememberme.PersistentTokenRepository;
import org.springframework.security.web.csrf.CsrfFilter;
import org.springframework.web.filter.CharacterEncodingFilter;

@EnableWebSecurity
@ComponentScan(basePackageClasses={com.apparel.model.service.user.UserServiceImpl.class, com.apparel.actions.config.CustomAuthenticationProvider.class} )
@EnableGlobalMethodSecurity(prePostEnabled = true)
public class SecurityConfig extends WebSecurityConfigurerAdapter {

	@Autowired(required=true)
	private CustomAuthenticationProvider authenticationProvider;
	
	@Autowired
	@Qualifier("customUserDetailsService")
	UserDetailsService userDetailsService;
	
	@Autowired
	DataSource dataSource;
 
	
	@Autowired
	public void configureGlobal(UserDetailsService userDetailsService, AuthenticationManagerBuilder auth) throws Exception {
		auth.userDetailsService(userDetailsService);
		auth.authenticationProvider(authenticationProvider).eraseCredentials(false);
	} 

	@Override
	protected void configure(HttpSecurity http) throws Exception {
		
		http.headers().disable();
		
		CharacterEncodingFilter filter = new CharacterEncodingFilter();
		filter.setEncoding("UTF-8");
		filter.setForceEncoding(true);
		http.addFilterBefore(filter,CsrfFilter.class);
		 
		http.
		authorizeRequests().
		antMatchers("/resources/**").permitAll();
		
		
		http.
		formLogin().
		usernameParameter("username").
		passwordParameter("password").
		loginPage("/login").
		failureUrl("/login/error").
		successForwardUrl("/index").
		defaultSuccessUrl("/index").
		permitAll();
		
		http.logout().
		logoutUrl("/logout").
		deleteCookies("JSESSIONID").
		invalidateHttpSession(true).
		logoutSuccessUrl("/").
		permitAll();
		
		http.rememberMe(). 
        key("remember-me").
        rememberMeParameter("remember-me-param").
        rememberMeCookieName("my-remember-me").
        tokenValiditySeconds(86400);
	}

	@Bean
	public PersistentTokenRepository persistentTokenRepository() {
		JdbcTokenRepositoryImpl tokenRepositoryImpl = new JdbcTokenRepositoryImpl();
		tokenRepositoryImpl.setDataSource(dataSource);
		return tokenRepositoryImpl;
	}

}