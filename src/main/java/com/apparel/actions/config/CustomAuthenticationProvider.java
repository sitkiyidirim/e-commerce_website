package com.apparel.actions.config;

import java.io.Serializable;
import java.util.Collection;
import java.util.HashSet;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.authentication.AuthenticationProvider;
import org.springframework.security.authentication.BadCredentialsException;
import org.springframework.security.authentication.UsernamePasswordAuthenticationToken;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.AuthenticationException;
import org.springframework.security.core.GrantedAuthority;
import org.springframework.stereotype.Component;

import com.apparel.model.entity.user.Role;
import com.apparel.model.entity.user.User;
import com.apparel.model.service.user.UserService;

@Component("customAuthenticationProvider")
public class CustomAuthenticationProvider implements AuthenticationProvider, Serializable {
	private static final long serialVersionUID = 1L;

	@Autowired(required = true)
	private UserService userService;

	@Override
	public Authentication authenticate(final Authentication authentication) throws AuthenticationException {
		User userDTO = new User();
		userDTO.setUsername(authentication.getName());
		userDTO.setPassword(authentication.getCredentials().toString());

		User user = null;

		try {
			user = userService.findByUsername(userDTO.getUsername());
		} catch (Exception e) {
			String message = "Incorrect username.error";
			throw new BadCredentialsException("Unable to sign in. " + message);
		}

		if (user != null && user.getPassword().equals(userDTO.getPassword())) {

			Collection<GrantedAuthority> authorities = new HashSet<GrantedAuthority>();
			Role role = userService.userRoleId(user.getId());
			authorities.add(role);

			return new UsernamePasswordAuthenticationToken(user, authentication, authorities);
		} else {
			throw new BadCredentialsException("Unable to sign in. Incorrect credentials.");
		}
	}

	@Override
	public boolean supports(Class<?> authentication) {
		return authentication.equals(UsernamePasswordAuthenticationToken.class);
	}
}