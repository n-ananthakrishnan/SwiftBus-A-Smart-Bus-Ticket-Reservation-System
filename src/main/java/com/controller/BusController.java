package com.controller;

import com.model.Bus;
import com.repository.BusRepository;
import com.service.BusService;
import java.text.SimpleDateFormat;
import java.time.LocalDate;
import java.util.Arrays;
import java.util.List;
import java.util.stream.Collectors;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.propertyeditors.CustomDateEditor;
import org.springframework.format.annotation.DateTimeFormat;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.WebDataBinder;
import org.springframework.web.bind.annotation.*;

@Controller
@RequestMapping("/student")
public class BusController {
    @InitBinder
    public void initBinder(WebDataBinder binder) {
        SimpleDateFormat dateFormat = new SimpleDateFormat("yyyy-MM-dd");
        binder.registerCustomEditor(LocalDate.class, new CustomDateEditor(dateFormat, true));
    }

    @Autowired
    private BusRepository busRepository;

    @Autowired
    private BusService busService;

    // Admin Panel
    @RequestMapping("/adminlist")
    public String showAdmPanel(Model model) {
        Iterable<Bus> buses = busRepository.findAll();
        model.addAttribute("buses", buses);
        return "admin-main";
    }

    // Show Login Pages
    @RequestMapping("/user")
    public String showuserPanel() {
        return "user-login";
    }

    @RequestMapping("/admin")
    public String showAdminPanel() {
        return "admin-login";
    }

    @RequestMapping("/adminLog")
    public String showAdmin(Model model) {
        Iterable<Bus> buses = busRepository.findAll();
        model.addAttribute("buses", buses);
        return "admin-main";
    }

    // New Bus Form
    @RequestMapping("/new")
    public String showNewBusForm() {
        return "create-bus";
    }

    // Save Bus
    @RequestMapping("/save")
    public String saveBus(@ModelAttribute("bus") Bus bus) {
        busRepository.save(bus);
        return "redirect:/student/adminLog";
    }

    // List All Buses
    @RequestMapping("/list")
    public String listBuses(Model model) {
        Iterable<Bus> buses = busRepository.findAll();
        model.addAttribute("buses", buses);
        return "list-bus";
    }

    @RequestMapping("/userLog")
    public String selectSeats(Model model) {
        Iterable<Bus> buses = busRepository.findAll();
        model.addAttribute("buses", buses);
        return "busSearch";
    }

    @GetMapping("/searchBuses")
    public String searchBuses(
        @RequestParam("pickupLocation") String pickupLocation,
        @RequestParam("dropLocation") String dropLocation,
        @RequestParam("tripDate") String tripDateStr,
        Model model
    ) {
        LocalDate tripDate = LocalDate.parse(tripDateStr); // Convert the date string to LocalDate
        List<Bus> buses = busService.findAvailableBuses(pickupLocation, dropLocation, tripDate);
        model.addAttribute("buses", buses);
        return "busResults"; // JSP name to show the results
    }

    // Edit Bus Form
    @RequestMapping("/edit/{id}")
    public String showEditForm(@PathVariable("id") Long id, Model model) {
        Bus bus = busService.getBusById(id);
        model.addAttribute("bus", bus);
        return "edit-bus";
    }

    // Update Bus
    @PostMapping("/update/{id}")
    public String updateBus(@PathVariable("id") Long id, @ModelAttribute("bus") Bus bus, Model model) {
        bus.setId(id); 
        busService.saveBus(bus);  
        Iterable<Bus> buses = busRepository.findAll();
        model.addAttribute("buses", buses); 
        return "list-bus";  
    }
    
    // Delete Bus
    @RequestMapping("/delete/{id}")
    public String deleteBus(@PathVariable("id") Long id) {
        busService.deleteBus(id);
        return "redirect:/student/list";
    }

    // View Bus Details
    @RequestMapping("/view/{id}")
    public String viewBus(@PathVariable("id") Long id, Model model) {
        Bus bus = busService.getBusById(id);
        model.addAttribute("bus", bus);
        return "view-bus";
    }

    @GetMapping("/bus/details/{id}")
    @ResponseBody
    public ResponseEntity<Bus> getBusDetails(@PathVariable Long id) {
        Bus bus = busService.getBusById(id);
        if (bus == null) {
            return new ResponseEntity<>(HttpStatus.NOT_FOUND);
        }
        return new ResponseEntity<>(bus, HttpStatus.OK);
    }

    // Endpoint to update seat booking
    @PostMapping("/bus/bookSeats")
    @ResponseBody
    public ResponseEntity<String> bookSeats(@RequestParam Long busId, @RequestBody String selectedSeats) {
        try {
            List<Integer> bookedSeatNumbers = parseSeatNumbers(selectedSeats);
            busService.updateBookedSeats(busId, bookedSeatNumbers);
            return new ResponseEntity<>("Seats booked successfully!", HttpStatus.OK);
        } catch (Exception e) {
            e.printStackTrace(); // Log the error for debugging
            return new ResponseEntity<>("Failed to book seats: " + e.getMessage(), HttpStatus.BAD_REQUEST);
        }
    }

    private List<Integer> parseSeatNumbers(String seatString) {
        // Implement logic to parse the seatString into a list of integers
        // For example, you can split the string by commas and convert each part to an integer
        String[] seatNumbers = seatString.split(",");
        List<Integer> bookedSeats = Arrays.stream(seatNumbers)
                .map(Integer::parseInt)
                .collect(Collectors.toList());
        return bookedSeats;
    }

    @GetMapping("/bookTicketForm")
    public String showTicketBookingForm(@RequestParam("busId") Long busId, Model model) {
        Bus bus = busService.getBusById(busId);
        model.addAttribute("bus", bus);
        return "selectSeats";
    }

    @PostMapping("/bookSeats")
    public String bookSeats(@RequestParam Long busId, @RequestParam String selectedSeats, Model model) {
        busService.updateBookedSeats(busId, selectedSeats);
        model.addAttribute("message", "Seats booked successfully!");
        return "redirect:/student/bookTicketForm?busId=" + busId;
    }

    // Authentication for Admin Login
    @PostMapping("/adminAuthenticate")
    public String authenticateAdmin(@RequestParam("email") String email,
                                     @RequestParam("password") String password,
                                     Model model) {
        String adminEmail = "n.anand18.07.2005@gmail.com";
        String adminPassword = "Anand$2005";

        if (email.equals(adminEmail) && password.equals(adminPassword)) {
            return "redirect:/student/adminLog";
        } else {
            model.addAttribute("error", "Invalid email or password");
            return "admin-login";
        }
    }
    
    
}