package com.service;

import java.time.LocalDate;
import java.util.Arrays;
import java.util.HashSet;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.model.Bus;
import com.repository.BusRepository;
@Service
public class BusService {
	
	
	@Autowired
    private BusRepository busRepository;

    public List<Bus> getAllBuses() {
        return busRepository.findAll();
    }

    public Bus saveBus(Bus bus) {
        return busRepository.save(bus);
    }

    public void deleteBus(Long id) {
        busRepository.deleteById(id);
    }

    public Bus getBusById(Long id) {
        return busRepository.findById(id).orElse(null);
    }
    public List<Bus> searchBuses(String pickupLocation, String dropLocation, LocalDate tripDate) {
        return busRepository.findByPickupLocationAndDropLocationAndTripDate(pickupLocation, dropLocation, tripDate);
    }
    public List<Bus> findAvailableBuses(String pickupLocation, String dropLocation, LocalDate tripDate) {
        return busRepository.findByPickupLocationAndDropLocationAndTripDate(pickupLocation, dropLocation, tripDate);
    }
 // Update booked seats and available seats
    public void updateBookedSeats(Long busId, String seatsToBook) {
        Bus bus = getBusById(busId);
        if (bus != null) {
            bus.bookSeats(seatsToBook);
            busRepository.updateBookedSeats(busId, bus.getAvlseats(), bus.getAvlseats());
        }
    }
}
