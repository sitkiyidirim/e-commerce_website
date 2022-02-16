package com.apparel.model.entity.user;

import java.util.*;

import javax.persistence.*;
import javax.validation.constraints.NotNull;

import org.codehaus.jackson.annotate.JsonBackReference;
import org.hibernate.validator.constraints.Email;
import org.hibernate.validator.constraints.Length;
import org.hibernate.validator.constraints.NotEmpty;
import org.springframework.security.core.GrantedAuthority;
import org.springframework.security.core.userdetails.UserDetails;

import com.apparel.model.entity.BaseEntity;

@Entity
@Table(name = "user")
public class User extends BaseEntity  implements UserDetails, java.io.Serializable{
 
	@Column(name = "username", unique = true, nullable = false, length = 30)
	@NotNull(message = "{error.username.null}")
	@Length(max = 60,message = "{error.username.max}")
	private String username; 

	
	@Column(name = "password", nullable = false)
	@NotNull(message = "{error.password.null}")
	@NotEmpty(message = "{error.password.notempty}")
	@Length(min=6,message="{error.password.length}")
	private String password;
	
	
	@Column(name = "name", length = 50)
	@NotNull(message = "{error.name.null}")
	@NotEmpty(message = "{error.name.notempty}")
//	@NotBlank(message = "{error.name.notblank}")
	@Length(max = 50,message = "{error.name.max}")
	private String name;

	@Column(name = "surname", length = 150)
	@NotNull(message = "{error.surname.null}")
	@NotEmpty(message = "{error.surname.notempty}")
	@Length(max = 150,message = "{error.surname.max}")
	private String surname;

	@Column(name = "sex", length = 6)
	@Length(max = 6)
	private String sex;

	
	@Column(name = "e_mail", length = 60)
	@NotNull(message = "{error.e_mail.null}")
	@NotEmpty(message = "{error.e_mail.notempty}")
	@Length(max = 60,message = "{error.e_mail.max}")
	@Email(message = "{error.e_mail.email}")
	private String mail;
	
	@Column(name = "mobile_phone", length = 20)
	private String mobilePhone;

	
	@Column(name = "static_phone", length = 20)
	private String staticPhone;

	@Column(name = "address", length = 150)
	private String address;	

	@Column(name = "last_login_date")
	@Temporal(TemporalType.TIMESTAMP)
	private Date lastLogin;

	@Column(name = "last_ip")
	private String lastIp;

	@Column(name = "last_session_id")
	private String lastSesionId;

	//deafault true
	@Column(name = "enabled")
	private boolean enabled;
 
	// 0 no , 1 Yes , defualut 0
	@Column(name = "banned")
	private Integer banned;

	 
	//Notnull - EUserType
	@Column(name = "type")
	private Integer type;
	
	@Column(name = "token")
	private String token;

	@Column(name = "token_expiration")
	@Temporal(TemporalType.TIMESTAMP)
	private Date tokenExpiration;
	
	@Transient
	private Set<GrantedAuthority> authorities;

	@Transient
	private boolean accountNonExpired;

	@Transient
	private boolean accountNonLocked;

	@Transient
	private boolean credentialsNonExpired;
 

	@ManyToOne(fetch = FetchType.LAZY)
	@JoinColumn(name = "role_id")
	private Role role;

	@OneToMany(cascade = CascadeType.ALL, fetch = FetchType.LAZY, mappedBy = "user")
	@JsonBackReference(value="address-user")
	private List<Address> addresses = new ArrayList<Address>();
	
	public User() {
	}


	//	@Unique(entityName ="User",fieldName = "username",message="Alrady Exits!")
	public String getUsername() {
		return username;
	}

	public void setUsername(String username) {
		this.username = username;
	}

	//@Type(type="encryptedString") 
	public String getPassword() {
		return password;
	}

	public void setPassword(String password) {
		this.password = password;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public String getSurname() {
		return surname;
	}

	public void setSurname(String surname) {
		this.surname = surname;
	}

	public String getMail() {
		return mail;
	}

	public void setMail(String mail) {
		this.mail = mail;
	}

	public String getMobilePhone() {
		return mobilePhone;
	}

	public void setMobilePhone(String mobilePhone) {
		this.mobilePhone = mobilePhone;
	}

	public String getSex() {
		return sex;
	}

	public void setSex(String sex) {
		this.sex = sex;
	}

	public Date getLastLogin() {
		return lastLogin;
	}

	public void setLastLogin(Date lastLogin) {
		this.lastLogin = lastLogin;
	}

	public Role getRole() {
		return role;
	}

	public void setRole(Role role) {
		this.role = role;
	}

	public String getAddress() {
		return address;
	}

	public void setAddress(String address) {
		this.address = address;
	}

	@Transient
	public String getTitle() {
		return this.getName() + " " + this.getSurname();
	}

	public String getLastIp() {
		return lastIp;
	}

	public void setLastIp(String lastIp) {
		this.lastIp = lastIp;
	}

	public String getLastSesionId() {
		return lastSesionId;
	}

	public void setLastSesionId(String lastSesionId) {
		this.lastSesionId = lastSesionId;
	}

	public Integer getType() {
		return type;
	}

	public void setType(Integer type) {
		this.type = type;
	}

	public String getStaticPhone() {
		return staticPhone;
	}

	public void setStaticPhone(String staticPhone) {
		this.staticPhone = staticPhone;
	}

	public boolean isEnabled() {
		return enabled;
	}
	public void setEnabled(boolean enabled) {
		this.enabled = enabled;
	}
 
	@Override
	public Collection<GrantedAuthority> getAuthorities() {
		authorities = new HashSet<GrantedAuthority>();
		authorities.add(getRole());
		return authorities;
	}

	@Override
	public boolean isAccountNonExpired() {
		// TODO Auto-generated method stub
		return accountNonExpired;
	}

	@Override
	public boolean isAccountNonLocked() {
		// TODO Auto-generated method stub
		return accountNonLocked;
	}

	@Override
	public boolean isCredentialsNonExpired() {
		// TODO Auto-generated method stub
		return credentialsNonExpired;
	}
 
	public Integer getBanned() {
		return banned;
	}


	public void setBanned(Integer banned) {
		this.banned = banned;
	}

	public String getToken() {
		return token;
	}

	public void setToken(String token) {
		this.token = token;
	}

	public Date getTokenExpiration() {
		return tokenExpiration;
	}

	public void setTokenExpiration(Date tokenExpiration) {
		this.tokenExpiration = tokenExpiration;
	}
 
}