package com.gregg.schoolmanagementsystem.repositories;

import java.util.List;
import java.util.Optional;

import org.springframework.data.repository.CrudRepository;
import org.springframework.stereotype.Repository;

import com.gregg.schoolmanagementsystem.models.Faculty;

@Repository
public interface FacultyRepository extends CrudRepository<Faculty, Long> {
	List<Faculty> findAll();
	
	Optional<Faculty> findByEmail(String email);

}
