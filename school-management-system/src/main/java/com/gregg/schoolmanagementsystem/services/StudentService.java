package com.gregg.schoolmanagementsystem.services;

import java.util.List;
import java.util.Optional;

import org.springframework.stereotype.Service;

import com.gregg.schoolmanagementsystem.models.Student;
import com.gregg.schoolmanagementsystem.repositories.StudentRepository;

@Service
public class StudentService {

	private final StudentRepository studentRepo;
	
	public StudentService(StudentRepository studentRepo) {
		this.studentRepo = studentRepo;
	}
	
	public Student getOne(Long id) {
        Optional<Student> student = studentRepo.findById(id);
        return student.isPresent() ? student.get() : null;
    }

    public List<Student> getAll() {
        return (List<Student>) studentRepo.findAll();
    }

    public Student create(Student student) {
        return studentRepo.save(student);
    }

    public Student update(Student student) {
        return studentRepo.save(student);
    }

    public void delete(Long id) {
        studentRepo.deleteById(id);
    }

}
