package com.gregg.mvcdemo.models;

import java.util.Date;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.PrePersist;
import javax.persistence.PreUpdate;
import javax.persistence.Table;
import javax.validation.constraints.Min;
import javax.validation.constraints.NotEmpty;
import javax.validation.constraints.NotNull;
import javax.validation.constraints.Size;

import org.springframework.format.annotation.DateTimeFormat;

@Entity
@Table(name="donations")
public class Donation {

	//attributes, quantity, donor, donationName
	@Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long id;
	
	@ManyToOne(fetch = FetchType.LAZY)
	@JoinColumn(name="user_id")
	private User donor;
	
	@NotEmpty
    @Size(min = 3, max = 255, message="donation name needs to be more than 3 characters less than 255")
    private String donationName;
	
	@Min(value=0, message="quanity needs to be more than 0")
	@NotNull
//	@Max (4)
	private Integer quantity;
	
	// This will not allow the createdAt column to be updated after creation
    @Column(updatable=false)
    @DateTimeFormat(pattern="yyyy-MM-dd")
    private Date createdAt;
    
    @DateTimeFormat(pattern="yyyy-MM-dd")
    private Date updatedAt;
	
	//constructors
	public Donation() {}

	public Donation(
			@NotNull @Size(min = 3, max = 255, message = "donation name needs to be more than 3 characters less than 255") String donationName,
			@Min(value = 0, message = "quanity needs to be more than 0") @NotNull Integer quantity) {
		this.donationName = donationName;
		this.quantity = quantity;
	}
	
	public Donation(Long id,
			@NotNull @Size(min = 3, max = 255, message = "donation name needs to be more than 3 characters less than 255") String donationName,
			@Min(value = 0, message = "quanity needs to be more than 0") @NotNull Integer quantity) {
		this.id = id;
		this.donationName = donationName;
		this.quantity = quantity;
	}

	//methods

	//getters and setters
	public Long getId() {
		return id;
	}

	public void setId(Long id) {
		this.id = id;
	}

	public User getDonor() {
		return donor;
	}

	public void setDonor(User donor) {
		this.donor = donor;
	}

	public String getDonationName() {
		return donationName;
	}


	public void setDonationName(String donationName) {
		this.donationName = donationName;
	}


	public Integer getQuantity() {
		return quantity;
	}


	public void setQuantity(Integer quantity) {
		this.quantity = quantity;
	}


	public Date getCreatedAt() {
		return createdAt;
	}


	public Date getUpdatedAt() {
		return updatedAt;
	}

	
	// other getters and setters removed for brevity
    @PrePersist
    protected void onCreate(){
        this.createdAt = new Date();
    }
    @PreUpdate
    protected void onUpdate(){
        this.updatedAt = new Date();
    }
	
}
