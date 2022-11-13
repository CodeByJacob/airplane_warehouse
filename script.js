// INSERT TABLE NAME
const recognitionCount = 100;
const technicalCount = 100;
const aircraftCount = 200;
const seatsCount =  800;
const routeCount = 2000;
const maxDistance = 5000;
const minDistance = 300;
const flightSchedulesCount = 2000;
const clientCount = 8000;
const countries = 33;
// AIR_CRAFT_RECOGNITION
const WING_POSITION = ['Low wing', 'High wing'];
const ENGINE_POSITION = ["Underwing mounted", "Both sides of rear fuselage", "Above cabin"]
const TAIL_CONFIGURATION = ["Regular tail, low set", "Double fin, low set", "Regular tail, mid set", "Two-blade tail rotor"]

// TECHNICAL
const WING_SPAN = [73.3, 36.8, 35.8, 88.4, 44.84, 44.8, 43.9, 34.1]
const LENGTH = [69.1, 33.84, 44.51, 84, 54.1, 53.6, 46.66, 31.45]
const HEIGHT = [21.1, 11.76, 11.76, 18.2, 16.54, 16.5, 16.5, 12.56]
const FUEL_CONSUMPTION = [0.931, 1.085, 1.243, 1.42, 0.965, 0.932, 0.984, 0.993, 1.12, 1.09];

// AIRCRAFT
const NAME = ["A10", "A109", "A124", "A129", "A20N", "A19N", "A20N", "A225", "A306", "A30B", "A310", "A319", "A320", "A321", "A332", "A333", "A338", "A339", "A342", "A343"]
const TYPE = ["L4J", "L2J", "L1J", "L3J"]

// AIRCRAFT-SEAT
const TRAVEL_CLASS = ["ECONOMIC", "BUSINESS"]
const SEAT_PRICE_ECONOMIC = [50, 100, 150, 200, 250, 300, 350, 400, 450, 500, 550, 600, 650, 700, 750, 800, 850, 900, 950, 1000]

// FLIGHT_SCHEDULE
const FLIGHT_STATUS = ["ARRIVED", "DELAYED", "CANCELLED", "TAKEOFF", "WAITING FOR DEPARTURE"]

// TRANSACTION
const TRANSACTION_STATUS = ['CANCELED', "ACCEPTED", "RESIGNATION"];

const fs = require('fs');
const { Z_ASCII } = require('zlib');
const createCsvWriter = require('csv-writer').createObjectCsvWriter;
//------------------------------------------------------------------------------------------------------------------------------------------------
// const csvWriter = createCsvWriter({
//     path: 'AIR_CRAFT_RECOGNITION.csv',
//     header: [
//         {id: "id", title: "ID"}, 
//         {id: "wing_position", title: "WING_POSITION"}, 
//         {id: "engine_position", title: "ENGINE_POSITION"}, 
//         {id: "tail_configuration", title: "TAIL_CONFIGURATION"}
//     ]
// })

// var records = []

// for (let i=1; i<recognitionCount + 1; i++){
//     wingIndex = Math.floor(Math.random() * WING_POSITION.length);
//     engineIndex = Math.floor(Math.random() * ENGINE_POSITION.length);
//     tailIndex = Math.floor(Math.random() * TAIL_CONFIGURATION.length);
//     records[i - 1] = {
//         id: i,
//         wing_position: WING_POSITION[wingIndex],
//         engine_position: ENGINE_POSITION[engineIndex],
//         tail_configuration: TAIL_CONFIGURATION[tailIndex]
//     }
// }

// csvWriter.writeRecords(records);
//------------------------------------------------------------------------------------------------------------------------------------------------
// const csvWriter = createCsvWriter({
//     path: 'TECHNICAL.csv',
//     header: [
//         {id: "id", title: "ID"}, 
//         {id: "wing_span", title: "WING_SPAN"}, 
//         {id: "aircraft_length", title: "AIRCRAFT_LENGTH"}, 
//         {id: "aircraft_height", title: "AIRCRAFT_HEIGHT"},
//         {id: "fuel_consumption", title: "FUEL_CONSUMPTION"}
//     ]
// })

// var records = []
// for (let i=1; i<technicalCount + 1; i++){
//     wingspanindex = Math.floor(Math.random() * WING_SPAN .length);
//     lengthIndex = Math.floor(Math.random() * LENGTH.length);
//     heightIndex = Math.floor(Math.random() * HEIGHT.length);
//     fuelIndex = Math.floor(Math.random() * FUEL_CONSUMPTION .length);
//     records[i - 1] = {
//         id: i,
//         wing_span: WING_SPAN[wingspanindex],
//         aircraft_length: LENGTH[lengthIndex],
//         aircraft_height: HEIGHT[heightIndex],
//         fuel_consumption: FUEL_CONSUMPTION[fuelIndex]
//     }
//     csvWriter.writeRecords(records);
// }
// //------------------------------------------------------------------------------------------------------------------------------------------------
// const csvWriter = createCsvWriter({
//     path: 'AIRCRAFT.csv',
//     header: [
//         {id: "id", title: "ID"}, 
//         {id: "aircraft_name", title: "AIRCRAFT_NAME"}, 
//         {id: "aircraft_type", title: "AIRCRAFT_TYPE"}, 
//         {id: "aircraft_recognition_id", title: "AIRCRAFT_RECOGNITION_ID"},
//         {id: "technical_id", title: "TECHNICAL_ID"}
//     ]
// })
// var records = []
// for (let i=1; i<aircraftCount + 1; i++){
//     nameIndex = Math.floor(Math.random() * NAME.length);
//     typeIndex = Math.floor(Math.random() * TYPE.length);
//     foreignRecognition = Math.floor(Math.random() * recognitionCount) + 1;
//     foreignTechnical = Math.floor(Math.random() * technicalCount) + 1;
//     records[i - 1] = {
//                 id: i,
//                 aircraft_name: NAME[nameIndex],
//                 aircraft_type: TYPE[typeIndex],
//                 aircraft_recognition_id: foreignRecognition,
//                 technical_id: foreignTechnical
//             }
// }
// csvWriter.writeRecords(records);
// //------------------------------------------------------------------------------------------------------------------------------------------------
// var records = []
// var outt = 1;

// const csvWriter = createCsvWriter({
//     path: 'ROUTE.csv',
//     header: [
//         {id: "id", title: "ID"}, 
//         {id: "distance", title: "DISTANCE"}, 
//         {id: "destination_aircraft_id", title: "DESTINATION_AIRCRAFT_ID"}, 
//         {id: "arrival_aircraft_id", title: "ARRIVAL_AIRCRAFT_ID"}
//     ]
// })
// for (let i=1; i<countries+ 1; i++){
//     for(let p=1; p<countries; p++){
//         distance = Math.floor(Math.random() * (maxDistance - minDistance + 1)) + minDistance;
//         records[outt - 1] = {
//             id: outt,
//             distance: distance,
//             destination_aircraft_id: i,
//             arrival_aircraft_id: p
//         }
//         outt++;
//     }
//     for(let p=1; p<countries; p++){
//         distance = Math.floor(Math.random() * (maxDistance - minDistance + 1)) + minDistance;
//         records[outt - 1] = {
//             id: outt,
//             distance: distance,
//             destination_aircraft_id: p,
//             arrival_aircraft_id: i
//         }
//         outt++;
//     }
// }
// csvWriter.writeRecords(records);
// //------------------------------------------------------------------------------------------------------------------------------------------------
var records = []
var aircrafts = [];

const csvWriter = createCsvWriter({
    path: 'FLIGHT_SCHEDULE.csv',
    header: [
        {id: "id", title: "ID"}, 
        {id: "status", title: "STATUS"},
        {id: "arrival_cost", title: "ARRIVAL_COST"}, 
        {id: "departure_cost", title: "DEPARTURE_COST"}, 
        {id: "arrival_date", title: "ARRIVAL_DATE"},
        {id: "departure_date", title: "DEPARTURE_DATE"},
        {id: "aircraft_id", title: "AIRCRAFT_ID"},
        {id: "route_id", title: "ROUTE_ID"}
    ]
})
for (let i=1; i<routeCount + 1; i++){
    arrivalCost = Math.floor(Math.random() * (100000 - 30000 + 1)) + 30000;
    departureCost = Math.floor(Math.random() * (100000 - 30000 + 1)) + 30000;
    flightStatusIndex = Math.floor(Math.random() *  FLIGHT_STATUS.length);
    aircraftIndex = Math.floor(Math.random() * (aircraftCount - 10))
    routeIndex = Math.floor(Math.random() * (2112) + 1)
    if(flightStatusIndex === 2 || flightStatusIndex === 4){
        records[i - 1] = {
                        id: i,
                        status: FLIGHT_STATUS[flightStatusIndex],
                        arrival_cost: arrivalCost,
                        departure_cost: departureCost,
                        arrival_date: null,
                        departure_date: null,
                        aircraft_id: aircraftIndex,
                        route_id: routeIndex
                    }
        aircrafts[i - 1] = aircraftIndex;
    }
    else{
        departuteDate = new Date(new Date(2015, 0, 1).getTime() + Math.random() * ((new Date()).getTime() - (new Date(2015, 0, 1).getTime())));
        arrivalDate =  new Date(departuteDate.getTime() +  Math.floor(Math.random() * (86400000 - 7200000 + 1)) + 7200000);
        records[i - 1] = {
            id: i,
            status: FLIGHT_STATUS[flightStatusIndex],
            arrival_cost: arrivalCost,
            departure_cost: departureCost,
            arrival_date: arrivalDate.toLocaleString("en-GB", {
                day: "numeric",
                month: "short",
                year: "numeric",
                hour: "numeric",
                minute: "2-digit"
              }),
            departure_date: departuteDate.toLocaleString("en-GB", {
                day: "numeric",
                month: "short",
                year: "numeric",
                hour: "numeric",
                minute: "2-digit"
              }),
            aircraft_id: aircraftIndex,
            route_id: routeIndex
        }
        aircrafts[i - 1] = aircraftIndex;
    }
}
csvWriter.writeRecords(records);
// //------------------------------------------------------------------------------------------------------------------------------------------------
// const csvWriter = createCsvWriter({
//     path: 'AIRCRAFT_SEAT.csv',
//     header: [
//         {id: "id", title: "ID"}, 
//         {id: "place_id", title: "PLACE_ID"}, 
//         {id: "price", title: "PRICE"}, 
//         {id: "travel_class", title: "TRAVEL_CLASS"},
//         {id: "aircraft_id", title: "AIRCRAFT_ID"}
//     ]
// });
// var records = []
// var seatID = 0;
// for (let i=1; i<aircraftCount + 1; i++){
//     for(let x=1; x<51; x++){
//         placeName = "BS" + x;
//         priceIndex = Math.floor(Math.random() * SEAT_PRICE_ECONOMIC.length);
//             records[seatID] = {
//                 id: (++seatID),
//                 place_id: placeName,
//                 price: SEAT_PRICE_ECONOMIC[priceIndex] * (Math.floor(Math.random() * 3) + 1),
//                 travel_class: "BUSINESS",
//                 aircraft_id: i
//             }
//     }
//     for(let x=1; x<seatsCount - 49; x++){
//         placeName = "ES" + x;
//         priceIndex = Math.floor(Math.random() * SEAT_PRICE_ECONOMIC.length);
//         records[seatID] = {
//             id: (++seatID),
//             place_id: placeName,
//             price: SEAT_PRICE_ECONOMIC[priceIndex],
//             travel_class: "ECONOMIC",
//             aircraft_id: i
//         }
//     }
// }
// csvWriter.writeRecords(records);
// //------------------------------------------------------------------------------------------------------------------------------------------------
const csvWriter2 = createCsvWriter({
    path: 'AIRLINE_TRANSACTION.csv',
    header: [
        {id: "id", title: "ID"}, 
        {id: "flight_schedule_id", title: "FLIGHT_SCHEDULE_ID"}, 
        {id: "passanger_id", title: "PASSANGER_ID"}, 
        {id: "aircraft_seat_id", title: "AIRCRAFT_SEAT_ID"}
    ]
});
var records2 = []
var transactionID = 0;
flight_shedule_id = 1;
for (let i=1; i<flightSchedulesCount + 1; i++){
    buyedseats = (Math.random() * 0.4) + 0.6;
    for(let p=1; p<Math.floor(seatsCount * buyedseats) + 1; p++){
        pasenngerIndex = Math.floor(Math.random() * (clientCount)) + 1;
        records2[transactionID] = {
            id: transactionID + 1,
            flight_schedule_id: i,
            passanger_id: pasenngerIndex,
            aircraft_seat_id: (aircrafts[i - 1] * seatsCount) + p
        }
        transactionID++;
    }
}
csvWriter2.writeRecords(records2);