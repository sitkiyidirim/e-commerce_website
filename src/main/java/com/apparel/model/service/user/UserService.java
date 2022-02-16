package com.apparel.model.service.user;

import java.util.Date;
import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.data.domain.Page;
import org.springframework.data.domain.PageRequest;
import org.springframework.data.jpa.domain.Specification;
import org.springframework.security.core.userdetails.UserDetailsService;

import com.apparel.model.entity.user.Role;
import com.apparel.model.entity.user.User;

public interface UserService extends UserDetailsService {

	public User save(User user);

	public User update(User user);

	public void delete(Integer id);

	public List<User> findAll();

	public User findById(Integer id);

	public void flush();

	public void update(Integer id, Date now, String lastLoginIP);

	User findByEmailUser(String mail);

	User findByMobilPhone(String mobilphoe);

	boolean patternMatches(String emailAddress, String regexPattern);

	String getIpAddr(HttpServletRequest request);

	String getRemortIP(HttpServletRequest request);

	String bcryptEncryptor(String plainText);

	Boolean doPasswordsMatch(String rawPassword, String encodedPassword);

	public User findByUsername(String username);

	public Role userRoleId(Integer id);

	public Page<User> search(PageRequest request, Specification<User> search);

	public List<User> search(Specification<User> search);

	public Page<User> search(PageRequest request);

	public void createSocialUser(User user);

	// public Integer getCount();

	void autoLogin(String username, String password, HttpServletRequest request);



}