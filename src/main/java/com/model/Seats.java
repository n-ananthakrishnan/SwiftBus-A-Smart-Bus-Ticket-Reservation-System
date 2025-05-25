package com.model;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Table;

@Entity
@Table(name = "bus_details")
public class Seats {

	    @Id
	    @GeneratedValue(strategy = GenerationType.IDENTITY)
	    private Long id;
	    
	    @Column(name = "bus_name")
	    private String busName;
	    
	    @Column(name = "pickup_location")
	    private String pickupLocation;

	    @Column(name = "drop_location")
	    private String dropLocation;

	    @Column(name = "trip_date")
	    private String tripDate;

	    @Column(name = "trip_time")
	    private String tripTime;
	    
	    @Column(name = "total_seats")
	    private int totalSeats;

	    @Column(name = "available_seats")
	    private int availableSeats;

	    @Column(name = "booked_seats")
	    private String bookedSeats; // Stores booked seats as a comma-separated string, e.g., "1,2,5,8"

		public Long getId() {
			return id;
		}

		public void setId(Long id) {
			this.id = id;
		}

		public String getBusName() {
			return busName;
		}

		public void setBusName(String busName) {
			this.busName = busName;
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

		public String getTripDate() {
			return tripDate;
		}

		public void setTripDate(String tripDate) {
			this.tripDate = tripDate;
		}

		public String getTripTime() {
			return tripTime;
		}

		public void setTripTime(String tripTime) {
			this.tripTime = tripTime;
		}

		public int getTotalSeats() {
			return totalSeats;
		}

		public void setTotalSeats(int totalSeats) {
			this.totalSeats = totalSeats;
		}

		public int getAvailableSeats() {
			return availableSeats;
		}

		public void setAvailableSeats(int availableSeats) {
			this.availableSeats = availableSeats;
		}

		public String getBookedSeats() {
			return bookedSeats;
		}

		public void setBookedSeats(String bookedSeats) {
			this.bookedSeats = bookedSeats;
		}

	    // Getters and Setters

}
