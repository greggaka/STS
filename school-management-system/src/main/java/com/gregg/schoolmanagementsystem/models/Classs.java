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
import javax.persistence.JoinTable;
import javax.persistence.ManyToMany;
import javax.persistence.ManyToOne;
import javax.persistence.PrePersist;
import javax.persistence.PreUpdate;
import javax.persistence.Table;
import javax.validation.constraints.NotEmpty;

import org.springframework.format.annotation.DateTimeFormat;

@Entity
@Table(name="classes")
public class Classs {

	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private Long id;
	
	@NotEmpty(message="Class Name required, cannot be blank.")
	private String name;
	
	@NotEmpty(message="Class Subject required, cannot be blank.")
	private String subject;
	
	@ManyToOne(fetch = FetchType.LAZY)
	@JoinColumn(name="school_id")
	private School period;
	
	@ManyToOne(fetch = FetchType.LAZY)
	@JoinColumn(name="faculty_id")
	private Faculty instructor;
	
	@ManyToMany(fetch = FetchType.LAZY)
	@JoinTable(
			name = "classes_students",
			joinColumns = @JoinColumn(name="class_id"),
			inverseJoinColumns = @JoinColumn(name = "student_id")
			)
	private List<Student> student;
	
	@Column(updatable=false)
    @DateTimeFormat(pattern="yyyy-MM-dd")
    private Date createdAt;
    
    @DateTimeFormat(pattern="yyyy-MM-dd")
    private Date updatedAt;
	
	
	public Classs() {}


	
	
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




	public String getSubject() {
		return subject;
	}




	public void setSubject(String subject) {
		this.subject = subject;
	}




	public School getPeriod() {
		return period;
	}




	public void setPeriod(School period) {
		this.period = period;
	}




	public Faculty getInstructor() {
		return instructor;
	}




	public void setInstructor(Faculty instructor) {
		this.instructor = instructor;
	}




	public List<Student> getStudent() {
		return student;
	}




	public void setStudent(List<Student> student) {
		this.student = student;
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
