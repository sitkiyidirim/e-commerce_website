package com.apparel.model.dao.user;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.JpaSpecificationExecutor;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;
import org.springframework.transaction.annotation.Transactional;

import com.apparel.model.entity.user.Role;
import com.apparel.model.entity.user.User;

@Transactional(readOnly = true)
public interface UserRepository extends JpaRepository<User, Integer>, JpaSpecificationExecutor<User>{

	@Query("SELECT p FROM User p WHERE LOWER(p.username) = LOWER(:username)")
	public User findByUsername(@Param("username") String username);


	@Query("SELECT p FROM User p WHERE p.mail =:mail")
	public User findByMailData(@Param("mail") String mail);

	User findByMobilePhone(String mobilphone);

	/*
	@Query(value = "SELECT COUNT(*) FROM User u Where (u.modifier != 'generator' or u.modifier is null) and u.type=2")
	public Integer getCount();*/


	@Query(value = "SELECT d.role FROM User d  WHERE  d.id  = :id")
	public Role getRoleId(@Param("id") Integer id);
}
