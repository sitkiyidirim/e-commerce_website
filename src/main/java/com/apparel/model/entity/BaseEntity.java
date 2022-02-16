package com.apparel.model.entity;

import java.util.Date;

import javax.persistence.Column;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.MappedSuperclass;
import javax.persistence.PrePersist;
import javax.persistence.PreUpdate;
import javax.persistence.Temporal;
import javax.persistence.TemporalType;
import javax.persistence.Transient;

@MappedSuperclass
public abstract class BaseEntity implements java.io.Serializable{
	
	private static final long serialVersionUID = 6477402980386950166L;
 
	@Id
	@GeneratedValue( strategy = GenerationType.AUTO )
	@Column(name = "id")
	private Integer id;

	@Column(name="date_modified")
	@Temporal(TemporalType.TIMESTAMP)
	private Date dateModified;
	
	@Column(name="modifier")
	private String modifier;
	
	@Column(name="creation_time")
	@Temporal(TemporalType.TIMESTAMP)
    private Date creationTime;

	
	public BaseEntity() {
	}

	
	public BaseEntity(Integer id) {
		super();
		this.id = id;
	}

	public Date getCreationTime() {
		return creationTime;
	}
	public void setCreationTime(Date creationTime) {
		this.creationTime = creationTime;
	}
 
	public Date getDateModified() {
		return dateModified;
	}

	public void setDateModified(Date dateModified) {
		this.dateModified = dateModified;
	}

	public String getModifier() {
		return modifier;
	}

	public void setModifier(String modifier) {
		this.modifier = modifier;
	}

	public Integer getId() {
		return id;
	}

	public void setId(Integer id) {
		this.id = id;
	}

	@Override
	public boolean equals( Object obj ) {
		if ( this == obj ) {
			return true;
		}

		if ( this.id == null || obj == null || !( this.getClass().equals( obj.getClass() ) ) ) {
			return false;
		}

		BaseEntity that = ( BaseEntity ) obj;

		return this.id.equals( that.getId() );
	}

	@Override
	public int hashCode() {
		return id == null ? 0 : id.hashCode();
	}
	
	@Transient
	public void setModifier(){		
//		Authentication auth = SecurityContextHolder.getContext().getAuthentication();
//		if (!(auth instanceof AnonymousAuthenticationToken)) {
//			this.modifier = SecurityContextHolder.getContext().getAuthentication().getName().toString();
//		}			
	}
	
    @PrePersist
    public void prePersist() {
        Date now = new Date();
        this.creationTime = now;
        this.dateModified = now;
//        setModifier();
    }

    @PreUpdate
    public void preUpdate() {
        this.dateModified = new Date();
        setModifier();
    }

}