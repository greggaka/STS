package com.gregg.schoolmanagementsystem.models;

import java.util.Date;
import java.util.List;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.OneToMany;
import javax.persistence.PrePersist;
import javax.persistence.PreUpdate;
import javax.persistence.Table;
import javax.validation.constraints.NotEmpty;

import org.springframework.format.annotation.DateTimeFormat;

@Entity
@Table(name="schools")
public class School {

	
	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private Long id;
	
	@NotEmpty(message="School Name required, cannot be blank.")
	private String name;
	
	@NotEmpty(message="School type required, cannot be blank.")
	private String type;
	
	//One school can have many faculty members
	@OneToMany(mappedBy="organization", fetch = FetchType.LAZY)
	private List<Faculty> faculty;
	
	@OneToMany(mappedBy="administrator", fetch = FetchType.LAZY)
	private List<Admin> admin;
	
	//One school can have many students
	@OneToMany(mappedBy="pupil", fetch = FetchType.LAZY)
	private List<Student> student;
	
	//One school has many classes
	@OneToMany(mappedBy="period", fetch = FetchType.LAZY)
	private List<Classs> classes;
	
	@Column(updatable = false)
	@DateTimeFormat(pattern="yyyy-MM-dd")
	private Date createdAt;
	
	@DateTimeFormat(pattern="yyyy-MM-dd")
	private Date updatedAt;
	
	public School() {}

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



	public String getType() {
		return type;
	}



	public void setType(String type) {
		this.type = type;
	}



	public List<Faculty> getFaculty() {
		return faculty;
	}



	public void setFaculty(List<Faculty> faculty) {
		this.faculty = faculty;
	}



	public List<Student> getStudent() {
		return student;
	}



	public void setStudent(List<Student> student) {
		this.student = student;
	}



	public List<Classs> getClasses() {
		return classes;
	}



	public void setClasses(List<Classs> classes) {
		this.classes = classes;
	}



	public List<Admin> getAdmin() {
		return admin;
	}

	public void setAdmin(List<Admin> admin) {
		this.admin = admin;
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
