package com.gregg.travelers.repositories;

import java.util.List;

import org.springframework.data.repository.CrudRepository;
import org.springframework.stereotype.Repository;

import com.gregg.travelers.models.Destination;

@Repository
public interface DestinationRepository extends CrudRepository <Destination, Long> {
	List<Destination> findAll();

}
