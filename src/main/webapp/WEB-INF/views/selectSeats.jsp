<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Bus Seat Selection</title>
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
    <style>
        .seat {
            width: 40px;
            height: 40px;
            margin: 5px;
            border-radius: 5px;
            text-align: center;
            line-height: 40px;
            cursor: pointer;
            font-weight: bold;
        }
        .available {
            background-color: green;
            color: white;
        }
        .selected {
            background-color: blue;
            color: white;
        }
        .booked {
            background-color: grey;
            color: white;
            cursor: not-allowed;
        }
        .aisle {
            width: 20px;
        }
        .driver {
            width: 90px;
            height: 40px;
            background-color: #444;
            color: white;
            line-height: 40px;
            text-align: center;
            margin-bottom: 10px;
            border-radius: 5px;
        }
        .seat-row {
            display: flex;
            justify-content: center;
            align-items: center;
            margin-bottom: 10px;
        }
    </style>
</head>
<body>
    <div class="container">
        <h2 class="my-4">Bus Seat Selection</h2>
        
        <!-- Bus Details Section -->
        <div id="busDetails" class="mb-4">
            <p><strong>Pickup Location:</strong> <span id="pickupLocation"></span></p>
            <p><strong>Drop Location:</strong> <span id="dropLocation"></span></p>
            <p><strong>Date of Trip:</strong> <span id="tripDate"></span></p>
            <p><strong>Time of Trip:</strong> <span id="tripTime"></span></p>
            <p><strong>Available Seats:</strong> <span id="availableSeats"></span></p>
        </div>

        <!-- Driver Seat -->
        <div class="driver">Driver</div>

        <!-- Seat Layout Section -->
        <div id="seatLayout"></div>

        <button id="confirmBooking" class="btn btn-primary mt-3">Confirm Booking</button>
    </div>

    <script>
        // Dummy bus data (replace with backend data)
        const busDetails = {
            pickupLocation: "Trichy",
            dropLocation: "Bangalore",
            tripDate: "2024-11-19",
            tripTime: "11:11",
            totalSeats: 40,
            bookedSeats: [2, 7, 15, 20, 25, 35] // Booked seat numbers
        };

        // Populate bus details
        document.getElementById("pickupLocation").textContent = busDetails.pickupLocation;
        document.getElementById("dropLocation").textContent = busDetails.dropLocation;
        document.getElementById("tripDate").textContent = busDetails.tripDate;
        document.getElementById("tripTime").textContent = busDetails.tripTime;
        document.getElementById("availableSeats").textContent = busDetails.totalSeats - busDetails.bookedSeats.length;

        // Generate seat layout
        const seatLayout = document.getElementById("seatLayout");
        const selectedSeats = new Set();
        const seatsPerRow = 4;
        const rows = busDetails.totalSeats / seatsPerRow;

        for (let row = 0; row < rows; row++) {
            const seatRow = document.createElement("div");
            seatRow.classList.add("seat-row");

            // Create left side seats
            for (let i = 0; i < 2; i++) {
                const seatNumber = row * seatsPerRow + i + 1;
                createSeat(seatRow, seatNumber);
            }

            // Aisle in the middle
            const aisle = document.createElement("div");
            aisle.classList.add("aisle");
            seatRow.appendChild(aisle);

            // Create right side seats
            for (let i = 2; i < 4; i++) {
                const seatNumber = row * seatsPerRow + i + 1;
                createSeat(seatRow, seatNumber);
            }

            seatLayout.appendChild(seatRow);
        }

        // Function to create a seat
        function createSeat(seatRow, seatNumber) {
            const seat = document.createElement("div");
            seat.textContent = seatNumber;
            seat.classList.add("seat");

            if (busDetails.bookedSeats.includes(seatNumber)) {
                seat.classList.add("booked");
            } else {
                seat.classList.add("available");
                seat.addEventListener("click", function () {
                    if (seat.classList.contains("selected")) {
                        seat.classList.remove("selected");
                        seat.classList.add("available");
                        selectedSeats.delete(seatNumber);
                    } else {
                        seat.classList.remove("available");
                        seat.classList.add("selected");
                        selectedSeats.add(seatNumber);
                    }
                });
            }

            seatRow.appendChild(seat);
        }

        // Confirm booking
        // Confirm booking
document.getElementById("confirmBooking").addEventListener("click", () => {
    if (selectedSeats.size === 0) {
        alert("Please select at least one seat.");
        return;
    }

    const selectedSeatsArray = Array.from(selectedSeats);
    const busId = '${bus.id}'; // Ensure this is dynamically inserted by JSP


    // AJAX call to backend
    fetch(`/springjpahiber/bus/bookSeats`, {
        method: "POST",
        headers: {
            "Content-Type": "application/json"
        },
        body: JSON.stringify({
            busId: busId,
            selectedSeats: selectedSeatsArray
        })
    })
    .then(response => response.json())
    .then(data => {
        alert(data.message || "Booking successful!");
        location.reload(); // Refresh page to update seat status
    })
    .catch(error => console.error("Error booking seats:", error));
});

        
    </script>
</body>
</html>
