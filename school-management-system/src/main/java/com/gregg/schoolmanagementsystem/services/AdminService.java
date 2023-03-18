package com.gregg.schoolmanagementsystem.services;

import java.util.Optional;

import org.mindrot.jbcrypt.BCrypt;
import org.springframework.stereotype.Service;
import org.springframework.validation.BindingResult;

import com.gregg.schoolmanagementsystem.models.Admin;
import com.gregg.schoolmanagementsystem.models.LoginAdmin;
import com.gregg.schoolmanagementsystem.repositories.AdminRepository;

@Service
public class AdminService {

	private final AdminRepository adminRepo;
	
	public AdminService(AdminRepository adminRepo) {
		this.adminRepo = adminRepo;
	}

	public Admin registerAdmin(Admin admin) {
		String hashed = BCrypt.hashpw(admin.getPassword(), BCrypt.gensalt());
		admin.setPassword(hashed);
		return adminRepo.save(admin);
	}
	
	public Admin login(LoginAdmin loginAdmin, BindingResult result) {
		if (result.hasErrors()) {
			return null;
		}
		Admin existingAdmin = getAdmin(loginAdmin.getEmail());
		if (existingAdmin == null) {
			result.rejectValue("email", "Unique", "Unknown Email");
			return null;
		}
		if(!BCrypt.checkpw(loginAdmin.getPassword(), existingAdmin.getPassword())) {
			result.rejectValue("password", "Match", "Incorrect Password");
			return null;
		}
		return existingAdmin;
	}
	
	public Admin getAdmin(String email) {
		Optional<Admin> potentialAdmin = adminRepo.findByEmail(email);
		return potentialAdmin.isPresent() ? potentialAdmin.get() : null;
	}
	
	public Admin getAdmin(Long id) {
		Optional<Admin> potentialAdmin = adminRepo.findById(id);
		return potentialAdmin.isPresent() ? potentialAdmin.get() : null;
	}
}
