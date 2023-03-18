package com.gregg.schoolmanagementsystem.repositories;

import java.util.List;

import org.springframework.data.repository.CrudRepository;
import org.springframework.stereotype.Repository;

import com.gregg.schoolmanagementsystem.models.School;

@Repository
public interface SchoolRepository extends CrudRepository<School, Long> {
	List<School> findAll();

}
