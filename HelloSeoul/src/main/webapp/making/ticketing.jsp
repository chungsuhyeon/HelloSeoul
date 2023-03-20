<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>Insert title here</title>
<script type="text/javascript">
//assume the following seat data is received from server
const seats = [
  { id: "1A", row: 1, col: "A", isAvailable: true },
  { id: "1B", row: 1, col: "B", isAvailable: false },
  { id: "1C", row: 1, col: "C", isAvailable: true },
  { id: "2A", row: 2, col: "A", isAvailable: true },
  { id: "2B", row: 2, col: "B", isAvailable: true },
  { id: "2C", row: 2, col: "C", isAvailable: true },
  // add more seats as needed
];

// find the seat map container element
const seatMap = document.getElementById("seat-map");

// iterate through the seat data and create seat elements
seats.forEach(seat => {
  const seatElement = document.createElement("div");
  seatElement.classList.add("seat");
  seatElement.textContent = seat.id;
  if (!seat.isAvailable) {
    seatElement.classList.add("unavailable");
  } else {
   
</script>
<style type="text/css">
#seat-map {
  display: flex;
  flex-direction: column;
  align-items: center;
  margin: 20px;
}

.screen {
  font-size: 20px;
  font-weight: bold;
  margin-bottom: 10px;
}

.seat-row {
  display: flex;
  justify-content: center;
}

.seat {
  width: 50px;
  height: 50px;
  border: 2px solid black;
  margin: 5px;
  display: flex;
  justify-content: center;
  align-items: center;
  cursor: pointer;
}

.seat.selected {
  background-color: green;
  color: white;
}

.seat.unavailable {
  background-color: gray;
  cursor: not-allowed;
}
</style>
</head>
<body>
<div id="seat-map">
  <div class="screen">Screen</div>
  <div class="seat-row">
    <div class="seat">1A</div>
    <div class="seat">2A</div>
    <div class="seat">3A</div>
    <div class="seat">4A</div>
    <div class="seat">5A</div>
    <div class="seat">6A</div>
  </div>
  <div class="seat-row">
    <div class="seat">1B</div>
    <div class="seat">2B</div>
    <div class="seat">3B</div>
    <div class="seat">4B</div>
    <div class="seat">5B</div>
    <div class="seat">6B</div>
  </div>
  <!-- add more seat rows as needed -->
</div>

<form id="booking-form">
  <input type="hidden" name="selectedSeats" id="selected-seats" value="">
  <!-- add more form fields as needed -->
</form>
</body>
</html>