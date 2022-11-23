const container = document.querySelector(".container");
const seats = document.querySelectorAll(".row .seat:not(.occupied");
const count = document.getElementById("count");
const total = document.getElementById("total");
const seatSelect = document.getElementById("seat");
const dateSelect = document.getElementById("booking-date");
var selections = [];

populateUI();



// update total and count
function updateSelectedCount() {
  const currentSelection = document.querySelectorAll(".row .seat.selected");
  const dateSelection = document.getElementById("booking-date").value;
  if (dateSelection == "" || currentSelection.length == 0) {
    return;
  }

  populateUIForADate(dateSelection);

  if (currentSelection !== null) {
    selectedSeats = [...currentSelection].map((seat) => seat.id);

    if (
      selections !== undefined &&
      selections.find((s) => s.date === dateSelection)
    ) {
      objIndex = selections.findIndex(
        (selection) => selection.date == dateSelection
      );

      var currentObject = selections[objIndex];

      currentObject.seats = selectedSeats;

      selections[objIndex] = currentObject;

      console.log("selections updated: " + JSON.stringify(selections));
    } else {
      console.log("dates not present");
      console.log(dateSelection);
      console.log(selectedSeats);
      selections.push({
        date: dateSelection,
        seats: selectedSeats,
      });

      console.log("selections inserted: " + JSON.stringify(selections));
    }
  }
}

function refresh() {
  var currentSelections = document.querySelectorAll(".row .seat");
  [].forEach.call(currentSelections, function (el) {
    el.classList.remove("selected");
    el.classList.remove("occupied");
  });
}

// get data from localstorage and populate ui
function populateUIForADate(date) {
  console.log("Hi, In pop " + date);
  // const selectedSeats = JSON.parse(localStorage.getItem("selectedSeats"));
  const allSeats = document.querySelectorAll(".row .seat");

  const getObj = selections.find((selections) => selections.date === date);
  if (getObj !== undefined) {
    allSeats.forEach((seat) => {
      if (getObj.seats.includes(seat.id)) {
        seat.classList.add("selected");
      }
    });
  }
}

// get data from localstorage and populate ui
function populateUI() {
  // const selectedSeats = JSON.parse(localStorage.getItem("selectedSeats"));
  if (selections !== null && selections.length > 0) {
    seats.forEach((seat, index) => {
      if (selectedSeats.indexOf(index) > -1) {
        seat.classList.add("selected");
      }
    });
  }

  const selectedseatIndex = localStorage.getItem("selectedseatIndex");

  if (selectedseatIndex !== null) {
    seatSelect.selectedIndex = selectedseatIndex;
  }
}

// seatSelect.addEventListener("change", (e) => {
//   ticketPrice = +e.target.value;
//   setseatData(e.target.selectedIndex, e.target.value);
//   updateSelectedCount();
// });

// seat select event
dateSelect.addEventListener("change", (e) => {
  console.log(e);
  refresh();
  populateUIForADate(e.target.value);
});

// Seat click event
container.addEventListener("click", (e) => {
  if (
    e.target.classList.contains("seat") &&
    !e.target.classList.contains("occupied")
  ) {
    e.target.classList.toggle("selected");
    updateSelectedCount();
  }
});
