package com.gregg.dojosandninjas.services;

import java.util.List;
import java.util.Optional;

import org.springframework.stereotype.Service;

import com.gregg.dojosandninjas.models.Dojo;
import com.gregg.dojosandninjas.repositories.DojoRepository;

@Service
public class DojoService {
	
	private final DojoRepository dojoRepo;

	public DojoService(DojoRepository dojoRepo) {
		this.dojoRepo = dojoRepo;
	}
	
	public List<Dojo> getAll() {
		return dojoRepo.findAll();
	}

	public Dojo create(Dojo dojo) {
		return dojoRepo.save(dojo);
	}
	
	public Dojo getDojo(Long id) {
		Optional<Dojo> potentialDojo = dojoRepo.findById(id);
		return potentialDojo.isPresent() ? potentialDojo.get() : null;
	}
}
