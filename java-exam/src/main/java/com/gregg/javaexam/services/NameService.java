package com.gregg.javaexam.services;

import java.util.List;
import java.util.Optional;

import org.springframework.stereotype.Service;

import com.gregg.javaexam.models.Name;
import com.gregg.javaexam.repositories.NameRepository;

@Service
public class NameService {

private final NameRepository nameRepo;
	
	public NameService(NameRepository nameRepo) {
		this.nameRepo = nameRepo;
	}
	
	public Name getOne(Long id) {
        Optional<Name> name = nameRepo.findById(id);
        return name.isPresent() ? name.get() : null;
    }

    public List<Name> getAll() {
        return (List<Name>) nameRepo.findAll();
    }

    public Name create(Name name) {
        return nameRepo.save(name);
    }

    public Name update(Name name) {
        return nameRepo.save(name);
    }

    public void delete(Long id) {
        nameRepo.deleteById(id);
    }

}
