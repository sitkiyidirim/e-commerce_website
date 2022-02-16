package com.apparel.model.service.user;

import java.util.*;
import java.util.regex.Pattern;

import javax.servlet.http.HttpServletRequest;

import com.apparel.model.dao.role.RoleRepository;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.PageRequest;
import org.springframework.data.jpa.domain.Specification;
import org.springframework.security.authentication.UsernamePasswordAuthenticationToken;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.GrantedAuthority;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.security.core.userdetails.UsernameNotFoundException;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.security.web.authentication.WebAuthenticationDetails;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.apparel.actions.config.CustomAuthenticationProvider;
import com.apparel.model.dao.user.UserRepository;
import com.apparel.model.entity.user.EUserType;
import com.apparel.model.entity.user.Role;
import com.apparel.model.entity.user.User;

@Service("customUserDetailsService")
@Transactional(readOnly = true)
public class UserServiceImpl implements UserService {

	@Autowired
	RoleRepository roleRepository;


	@Autowired
	private UserRepository userDAO;

	@Override
	public User findByEmailUser(String mail){

		return userDAO.findByMailData(mail);

	}

	@Override
	public User findByMobilPhone(String mobilphoe){
		return userDAO.findByMobilePhone(mobilphoe);
	}

	@Override
	public boolean patternMatches(String emailAddress, String regexPattern) {
		return Pattern.compile(regexPattern)
				.matcher(emailAddress)
				.matches();
	}

	@Override
	public String getIpAddr(HttpServletRequest request) {
		String ip = request.getHeader("x-forwarded-for");
		if(ip == null || ip.length() == 0 || "unknown".equalsIgnoreCase(ip)) {
			ip = request.getHeader("Proxy-Client-IP");
		}
		if(ip == null || ip.length() == 0 || "unknown".equalsIgnoreCase(ip)) {
			ip = request.getHeader("WL-Proxy-Client-IP");
		}
		if(ip == null || ip.length() == 0 || "unknown".equalsIgnoreCase(ip)) {
			ip = request.getRemoteAddr();
		}
		return ip;
	}

	@Override
	public String getRemortIP(HttpServletRequest request) {
		if (request.getHeader("x-forwarded-for") == null) {
			return request.getRemoteAddr();
		}
		return request.getHeader("x-forwarded-for");
	}


	static Logger logger = LoggerFactory.getLogger(UserServiceImpl.class);

	private static BCryptPasswordEncoder passwordEcorder =new BCryptPasswordEncoder();

	@Override
	public String bcryptEncryptor(String plainText) {
		return passwordEcorder.encode(plainText);
	}

	@Override
	public Boolean doPasswordsMatch(String rawPassword,String encodedPassword) {
		return passwordEcorder.matches(rawPassword, encodedPassword);
	}


	@Autowired(required=true)
	private CustomAuthenticationProvider authenticationProvider;

	@Override
	public User findByUsername(String username) {
		return userDAO.findByUsername(username);
	}

	@Override
	@Transactional
	public User save(User user){
		return userDAO.save(user);
	}


	@Override
	public void delete(Integer id){
		userDAO.delete(id);
	}

	@Override
	public List<User> findAll() {
		return userDAO.findAll();
	}

	@Override
	@Transactional
	public User findById(Integer id){
		return userDAO.findOne(id);
	}

	@Override
	public void flush() {
		userDAO.flush();
	}

	@Override
	public User update(User user){
		userDAO.save(user);
		return user;
	}

	public Role userRoleId(Integer id){
		return userDAO.getRoleId(id);
	}

	@Override
	public UserDetails loadUserByUsername(String username)throws UsernameNotFoundException {
//		User user = userDAO.findByUsername(username);
//		System.out.println("User : "+user);
//		if(user==null){
//			System.out.println("User not found");
//			throw new UsernameNotFoundException("Username not found");
//		}
		return null; // new org.springframework.security.core.userdetails.User(user.getUsername(), user.getPassword(), user.isEnabled(), true, true, true, getGrantedAuthorities(user));
	}

	private List<GrantedAuthority> getGrantedAuthorities(User user){
		List<GrantedAuthority> authorities = new ArrayList<GrantedAuthority>();
		Role role = userDAO.getRoleId(user.getId());
		authorities.add(role);
		return authorities;
	}

	@Override
	public void update(Integer id, Date now, String lastLoginIP) {

	}

	@Override
	public Page<User> search(PageRequest request, Specification<User> search) {
		return userDAO.findAll(search, request);
	}


	@Override
	public Page<User> search(PageRequest request) {
		Page<User> list= userDAO.findAll(request);
		return list;
	}

	@Override
	public List<User> search(Specification<User> search) {
		return userDAO.findAll(search);
	}

	@Override
	public void createSocialUser(User user) {

		//new Role(EUserType.STANDART.getId())

		user.setRole(roleRepository.findById(2));
		System.out.println("Role : "+user.getRole());

		user.setType(EUserType.STANDART.getId());
		System.out.println("typr : "+user.getType());


		user.setEnabled(true);

		save(user);
	}


	@Override
	public void autoLogin(String username, String password, HttpServletRequest request) {
		try {
			UsernamePasswordAuthenticationToken token = new UsernamePasswordAuthenticationToken(username, password);
			token.setDetails(new WebAuthenticationDetails(request));
			Authentication authentication = this.authenticationProvider.authenticate(token);
			SecurityContextHolder.getContext().setAuthentication(authentication);
		} catch (Exception e) {
			SecurityContextHolder.getContext().setAuthentication(null);
		}

	}


//	public Integer getCount(){
//		return userDAO.getCount();
//	}

}