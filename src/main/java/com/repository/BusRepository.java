package com.repository;

import java.time.LocalDate;
import java.util.List;

import javax.transaction.Transactional;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Modifying;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;
import org.springframework.stereotype.Repository;
import com.model.Bus;

@Repository 
public interface BusRepository extends JpaRepository<Bus,Long>{
	
	@Query("SELECT b FROM Bus b WHERE b.pickupLocation = :pickupLocation AND b.dropLocation = :dropLocation AND b.tripDate = :tripDate")
	List<Bus> findByPickupLocationAndDropLocationAndTripDate(
	    @Param("pickupLocation") String pickupLocation,
	    @Param("dropLocation") String dropLocation,
	    @Param("tripDate") LocalDate tripDate
	);


	 @Modifying
	    @Transactional
	    @Query("UPDATE Bus b SET b.bookedSeats = :bookedSeats, b.avlseats = :avlseats WHERE b.id = :busId")
	    void updateBookedSeats(Long busId, Long long1, Long avlseats);
	 }