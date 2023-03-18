package com.gregg.schoolmanagementsystem.services;

import java.util.List;
import java.util.Optional;

import org.springframework.stereotype.Service;

import com.gregg.schoolmanagementsystem.models.Faculty;
import com.gregg.schoolmanagementsystem.repositories.FacultyRepository;

@Service
public class FacultyService {

	private final FacultyRepository facultyRepo;
	
	public FacultyService(FacultyRepository facultyRepo) {
		this.facultyRepo = facultyRepo;
	}
	
	public Faculty getOne(Long id) {
        Optional<Faculty> faculty = facultyRepo.findById(id);
        return faculty.isPresent() ? faculty.get() : null;
    }

    public List<Faculty> getAll() {
        return (List<Faculty>) facultyRepo.findAll();
    }

    public Faculty create(Faculty faculty) {
        return facultyRepo.save(faculty);
    }

    public Faculty update(Faculty faculty) {
        return facultyRepo.save(faculty);
    }

    public void delete(Long id) {
        facultyRepo.deleteById(id);
    }

}
