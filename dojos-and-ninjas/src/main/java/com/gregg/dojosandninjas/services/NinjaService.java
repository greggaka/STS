package com.gregg.dojosandninjas.services;

import java.util.List;

import org.springframework.stereotype.Service;

import com.gregg.dojosandninjas.models.Ninja;
import com.gregg.dojosandninjas.repositories.NinjaRepository;

@Service
public class NinjaService {

	private final NinjaRepository ninjaRepo;
	
	public NinjaService(NinjaRepository ninjaRepo) {
		this.ninjaRepo = ninjaRepo;
	}
	
	public Ninja create(Ninja ninja) {
		return ninjaRepo.save(ninja);
	}
	
	public List<Ninja> getAll() {
		return ninjaRepo.findAll();
	}

}
