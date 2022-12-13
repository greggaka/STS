package com.gregg.mvcdemo.services;

import java.util.List;
import java.util.Optional;

import org.springframework.stereotype.Service;

import com.gregg.mvcdemo.models.User;
import com.gregg.mvcdemo.repositories.UserRepository;

@Service
public class UserService {

	private final UserRepository userRepo;
	
	public UserService(UserRepository userRepo) {
		this.userRepo = userRepo;
	}
	
	public List<User> findAll(){
		return userRepo.findAll();
	}
	
	public User create(User user) {
		return userRepo.save(user);
	}
	
	public User getUser(Long id) {
		Optional<User> potentialUser = userRepo.findById(id);
		return potentialUser.isPresent() ? potentialUser.get() : null;
	}
	
	public User getUser(String email) {
		Optional<User> potentialUser = userRepo.findByEmail(email);
		return potentialUser.isPresent() ? potentialUser.get() : null;
	}

	
}