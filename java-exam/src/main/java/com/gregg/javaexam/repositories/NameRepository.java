package com.gregg.javaexam.repositories;

import java.util.List;

import org.springframework.data.repository.CrudRepository;
import org.springframework.stereotype.Repository;

import com.gregg.javaexam.models.Name;

@Repository
public interface NameRepository extends CrudRepository<Name, Long> {

	List<Name> findAll();
}
