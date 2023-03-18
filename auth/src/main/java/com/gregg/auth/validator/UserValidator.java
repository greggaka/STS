package com.gregg.auth.validator;

import org.springframework.stereotype.Component;
import org.springframework.validation.Errors;
import org.springframework.validation.Validator;

import com.gregg.auth.models.User;

@Component
public class UserValidator implements Validator {

	@Override
	public boolean supports(Class<?> clazz) {
		return User.class.equals(clazz);
	}
	
	@Override
	public void validate(Object object, Errors errors) {
		User user = (User) object;
		
		if (!user.getConfirmPassword().equals(user.getPassword())) {
            // 3
            errors.rejectValue("confirmPassword", "Match");
        }    
		if (!user.getUsername().equals(null)) {
			errors.rejectValue("username", "Unique");
		}
	}
	public UserValidator() {
		// TODO Auto-generated constructor stub
	}

}
