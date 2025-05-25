package com.model;

import java.time.LocalDate;

import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Lob;
import javax.persistence.Table;

@Entity
@Table(name="Bus")
public class Bus {
	@Id
	@GeneratedValue(strategy= GenerationType.IDENTITY)
	private Long id;
	private Long avlseats;
    private String name;
    private String pickupLocation;
    private String dropLocation;
    private LocalDate tripDate;
    private String tripTime;
 
    private String bookedSeats = "";

	public Long getAvlseats() {
		return avlseats;
	}
	public void setAvlseats(Long avlseats) {
		this.avlseats = avlseats;
	}
	public Long getId() {
		return id;
	}
	public void setId(Long id) {
		this.id = id;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getPickupLocation() {
		return pickupLocation;
	}
	public void setPickupLocation(String pickupLocation) {
		this.pickupLocation = pickupLocation;
	}
	public String getDropLocation() {
		return dropLocation;
	}
	public void setDropLocation(String dropLocation) {
		this.dropLocation = dropLocation;
	}
	public LocalDate getTripDate() {
		return tripDate;
	}
	public void setTripDate(LocalDate tripDate) {
		this.tripDate = tripDate;
	}
	public String getTripTime() {
		return tripTime;
	}
	public void setTripTime(String tripTime) {
		this.tripTime = tripTime;
	}
	 public void bookSeats(String seatsToBook) {
	        if (bookedSeats.isEmpty()) {
	            bookedSeats = seatsToBook;
	        } else {
	            bookedSeats += "," + seatsToBook;
	        }
	        // Decrease available seats count based on booked seats
	        int bookedCount = seatsToBook.split(",").length;
	        this.avlseats -= bookedCount;
	    }
	
}

