package com.gregg.schoolmanagementsystem.services;

import java.util.List;
import java.util.Optional;

import org.springframework.stereotype.Service;

import com.gregg.schoolmanagementsystem.models.School;
import com.gregg.schoolmanagementsystem.repositories.SchoolRepository;

@Service
public class SchoolService {

	private final SchoolRepository schoolRepo;
	
	public SchoolService(SchoolRepository schoolRepo) {
		this.schoolRepo = schoolRepo;
	}
	
	public School getOne(Long id) {
        Optional<School> school = schoolRepo.findById(id);
        return school.isPresent() ? school.get() : null;
    }

    public List<School> getAll() {
        return (List<School>) schoolRepo.findAll();
    }
    
//    public List<School> getAllClasses() {
//    	List<School> existingSchool = schoolRepo.findAllClasses();
//    	e
//        return existingSchool.g
//    }

    public School create(School school) {
        return schoolRepo.save(school);
    }

    public School update(School school) {
        return schoolRepo.save(school);
    }

    public void delete(Long id) {
        schoolRepo.deleteById(id);
    }

}
