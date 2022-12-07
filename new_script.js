const fs = require('fs');
const { Z_ASCII } = require('zlib');
const createCsvWriter = require('csv-writer').createObjectCsvWriter;

var records = []
routeCount = 4000;
const FLIGHT_STATUS = ["ARRIVED", "DELAYED", "CANCELLED", "TAKEOFF", "WAITING FOR DEPARTURE"]
const departures = [1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16,17,18,19,20,21,26,27,28,29,30,31,32,33];
const arrivals = [22,23,24,25];

const csvWriter = createCsvWriter({
    path: 'FLIGHT.csv',
    header: [
        {id: "id", title: "ID"}, 
		{id: "airline_id", title: "AIRLINE_ID"},
		{id: "aircraft_id", title: "AIRPLANE_ID"},
		{id: "crew_id", title: "CREW_ID"},
		{id: "route_id", title: "ROUTE_ID"},
		{id: "flight_number", title: "FLIGHT_NUMBER"},	
		{id: "purchased_tickets", title: "PURCHASED_TICKETS"},	
        {id: "arrival_date", title: "ARRIVAL_DATE"},
        {id: "departure_date", title: "DEPARTURE_DATE"},
        {id: "arrival_cost", title: "ARRIVAL_COST"}, 
        {id: "departure_cost", title: "DEPARTURE_COST"}, 		
		{id: "flight_length", title: "FLIGHT_LENGTH"},
		{id: "place_of_departure_id", title: "PLACE_OF_DEPARTURE_ID"},
		{id: "place_of_arrival_id", title: "PLACE_OF_ARRIVAL_ID"},
        {id: "distance", title: "DISTANCE"},
		{id: "delay", title: "DELAY"},
        {id: "status", title: "STATUS"},
        {id: "total_fuel_cost", title: "TOTAL_FUEL_COST"}
    ]
})
for (let i=1; i<routeCount + 1; i++){
    arrivalCost = Math.floor(Math.random() * (100000 - 30000 + 1)) + 30000;
    departureCost = Math.floor(Math.random() * (100000 - 30000 + 1)) + 30000;
    flightStatusIndex = Math.floor(Math.random() *  FLIGHT_STATUS.length);
    aircraftIndex = Math.floor(Math.random() * (8 - 1) + 1)
    fuel_cost = Math.floor(Math.random() * (1000000 - 2000000 + 1)) + 2000000;
	airline = Math.floor(Math.random() * (2000 -  1)) + 1;
	crew = Math.floor(Math.random() * (100 -  1)) + 1;
	flight_num = Math.floor(Math.random() * (1000 -  1)) + 1;
	purchased_t = Math.floor(Math.random() * (500 -  1)) + 1;
	flight_len = Math.floor(Math.random() * (5 -  1)) + 1;
	pld = Math.floor(Math.random() * (29 -  1)) + 1;
	pla = Math.floor(Math.random() * (4 -  1)) + 1;
	dista = Math.floor(Math.random() * (5000 -  300)) + 300;
	dela = Math.floor(Math.random() * (15 -  1)) + 1;
	route = Math.floor(Math.random() * (2111 -  1)) + 1;
    if(flightStatusIndex === 2 || flightStatusIndex === 4){
        records[i - 1] = {
                        id: i,
						airline_id: airline,
						aircraft_id: aircraftIndex,
						crew_id: crew,
						route_id: route,
						flight_number: flight_num,
						purchased_tickets: purchased_t,
						arrival_date: null,
						departure_date: null,
						arrival_cost: arrivalCost,
						departure_cost: departureCost,
						flight_length: flight_len,
						place_of_departure_id: arrivals[pld],
						place_of_arrival_id: departures[pla],
						distance: dista,
						delay: dela,
						status: FLIGHT_STATUS[flightStatusIndex],
						total_fuel_cost: fuel_cost
                    }
    }
    else{
        departuteDate = new Date(new Date(2015, 0, 1).getTime() + Math.random() * ((new Date()).getTime() - (new Date(2015, 0, 1).getTime())));
        arrivalDate =  new Date(departuteDate.getTime() +  Math.floor(Math.random() * (86400000 - 7200000 + 1)) + 7200000);
        records[i - 1] = {
            id: i,
			airline_id: airline,
			aircraft_id: aircraftIndex,
			crew_id: crew,
			route_id: route,
			flight_number: flight_num,
			purchased_tickets: purchased_t,
            arrival_date: arrivalDate.toLocaleString("en-GB", {
                day: "numeric",
                month: "numeric",
                year: "numeric",
              }),
            departure_date: departuteDate.toLocaleString("en-GB", {
                day: "numeric",
                month: "numeric",
                year: "numeric",
              }),
			arrival_cost: arrivalCost,
			departure_cost: departureCost,
			flight_length: flight_len,
			place_of_departure_id: departures[pla],
			place_of_arrival_id: arrivals[pld],
			distance: dista,
			delay: dela,
			status: FLIGHT_STATUS[flightStatusIndex],
			total_fuel_cost: fuel_cost
        }
    }
}
csvWriter.writeRecords(records);
