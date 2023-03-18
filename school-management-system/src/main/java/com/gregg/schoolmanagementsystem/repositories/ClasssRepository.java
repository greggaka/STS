package com.gregg.schoolmanagementsystem.repositories;

import java.util.List;
import java.util.Optional;

import org.springframework.data.repository.CrudRepository;
import org.springframework.stereotype.Repository;

import com.gregg.schoolmanagementsystem.models.Classs;

@Repository
public interface ClasssRepository extends CrudRepository<Classs, Long>{
	List<Classs> findAll();
	}
