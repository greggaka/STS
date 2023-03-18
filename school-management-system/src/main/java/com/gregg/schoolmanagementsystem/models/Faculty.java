package com.gregg.schoolmanagementsystem.models;

import java.util.Date;
import java.util.List;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.OneToMany;
import javax.persistence.PrePersist;
import javax.persistence.PreUpdate;
import javax.persistence.Table;
import javax.validation.constraints.Email;
import javax.validation.constraints.NotEmpty;

import org.springframework.format.annotation.DateTimeFormat;

@Entity
@Table(name="faculty")
public class Faculty {

	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private Long id;
	
	@NotEmpty(message="Name required, cannot be blank.")
	private String name;
	
	
	@NotEmpty(message="First Name required, cannot be blank.")
	private String firstName;
	
	@NotEmpty(message="Last Name required, cannot be blank.")
	private String lastName;
	
	@NotEmpty(message="Email required, cannot be blank.")
	@Email(message="Invalid Email. Enter a valid email.")
	private String email;
	
	@NotEmpty(message="position required, cannot be blank.")
	private String position;
	
	//A faculty member can have many classes/A class can only have one instructor
	@OneToMany(mappedBy="instructor", fetch = FetchType.LAZY)
	private List<Classs> classes;
	
	@ManyToOne(fetch = FetchType.LAZY)
	@JoinColumn(name="school_id")
	private School organization;
	
	@Column(updatable = false)
	@DateTimeFormat(pattern="yyyy-MM-dd")
	private Date createdAt;
	
	@DateTimeFormat(pattern="yyyy-MM-dd")
	private Date updatedAt;
	
	public Faculty() {}

	
	
	public Long getId() {
		return id;
	}



	public void setId(Long id) {
		this.id = id;
	}



	public String getName() {
		return name;
	}



	public void setName(String name) {
		this.name = name;
	}



	public String getFirstName() {
		return firstName;
	}



	public void setFirstName(String firstName) {
		this.firstName = firstName;
	}



	public String getLastName() {
		return lastName;
	}



	public void setLastName(String lastName) {
		this.lastName = lastName;
	}



	public String getEmail() {
		return email;
	}



	public void setEmail(String email) {
		this.email = email;
	}



	public String getPosition() {
		return position;
	}



	public void setPosition(String position) {
		this.position = position;
	}



	public List<Classs> getClasses() {
		return classes;
	}



	public void setClasses(List<Classs> classes) {
		this.classes = classes;
	}



	public School getOrganization() {
		return organization;
	}



	public void setOrganization(School organization) {
		this.organization = organization;
	}



	public Date getCreatedAt() {
		return createdAt;
	}



	public Date getUpdatedAt() {
		return updatedAt;
	}



	@PrePersist
    protected void onCreate(){
        this.createdAt = new Date();
    }
	
    @PreUpdate
    protected void onUpdate(){
        this.updatedAt = new Date();
    }
}
