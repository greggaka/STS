package com.gregg.schoolmanagementsystem.services;

import java.util.List;
import java.util.Optional;

import org.springframework.stereotype.Service;

import com.gregg.schoolmanagementsystem.models.Classs;
import com.gregg.schoolmanagementsystem.repositories.ClasssRepository;

@Service
public class ClasssService {

	private final ClasssRepository classsRepo;
	
	public ClasssService(ClasssRepository classsRepo) {
		this.classsRepo = classsRepo;
	}
	
	public Classs getOne(Long id) {
        Optional<Classs> classs = classsRepo.findById(id);
        return classs.isPresent() ? classs.get() : null;
    }

    public List<Classs> getAll() {
        return (List<Classs>) classsRepo.findAll();
    }


    public Classs create(Classs classs) {
        return classsRepo.save(classs);
    }

    public Classs update(Classs classs) {
        return classsRepo.save(classs);
    }

    public void delete(Long id) {
        classsRepo.deleteById(id);
    }

}
