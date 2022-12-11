/*
SELECT * FROM x_sa_passengers;

SELECT MAX(ID) FROM X_SA_PASSENGERS;

SELECT * FROM a_sa_msql_passenger;
SELECT COUNT(*) FROM a_sa_msql_passenger;

CREATE TABLE Z_SA_PASSENGER AS (
SELECT ID, AGE, GENDER, COUNTRY FROM X_SA_PASSENGERS
UNION
SELECT (ID + 26000) AS ID, AGE, UPPER(GENDER) AS GENDER, UPPER(NATIONALITY) AS COUNTRY FROM a_sa_msql_passenger
);


SELECT * FROM x2_sa_flight_schedule;
SELECT * FROM x_sa_tickets;
SELECT * FROM a_sa_msql_ticket;
SELECT * FROM a_sa_msql_flight_details;

SELECT (ID + 3800000) AS ID, (PASSENGER_ID + 26000) AS PASSENGER_ID, (FLIGHT_SCHEDULE_ID + 202000) AS FLIGHT_SCHEDULE_ID, PRICE, UPPER(TRAVEL_CLASS) AS TRAVEL_CLASS FROM a_sa_msql_ticket;

CREATE TABLE Z_SA_TICKET AS (
SELECT ID, PASSENGER_ID, FLIGHT_SCHEDULE_ID, PRICE, TRAVEL_CLASS FROM X_SA_TICKETS
UNION
SELECT (ID + 3800000) AS ID, (PASSENGER_ID + 26000) AS PASSENGER_ID, (FLIGHT_SCHEDULE_ID + 202000) AS FLIGHT_SCHEDULE_ID, PRICE, UPPER(TRAVEL_CLASS) AS TRAVEL_CLASS  FROM a_sa_msql_ticket
);

DELETE FROM a_sa_msql_flight_details WHERE DEPARTURE_DATE IS NULL OR ARRIVAL_DATE IS NULL OR ROUTE_ID IS NULL OR ARRIVAL_COST IS NULL OR DEPARTURE_COST IS NULL OR TOTAL_FUEL_COST IS NULL;
*/

SELECT * FROM A3_SA_FS;

DROP TABLE A3_SA_FS;
CREATE TABLE A3_SA_FS AS (
SELECT SF.* FROM A2_SA_FS SF JOIN X_SA_ROUTES SR ON SF.ROUTE_ID = SR.ID
);

CREATE TABLE A2_SA_FS AS (
SELECT (ID + 202000) AS ID, to_char(to_date(DEPARTURE_DATE, 'DD/MM/YYYY'), 'RRRR-MM-DD') AS DEPARTURE_DATE, 
to_char(to_date(ARRIVAL_DATE, 'DD/MM/YYYY'), 'RRRR-MM-DD') AS ARRIVAL_DAT, ROUTE_ID, ARRIVAL_COST, DEPARTURE_COST,
TOTAL_FUEL_COST AS TOTAL_FLIGHT_COST FROM a_sa_msql_flight_details);


SELECT * FROM X2_SA_FLIGHT_SCHEDULE;


CREATE TABLE Z_SA_FLIGHT_SCHEDULE AS (
SELECT ID, DEPARTURE_DATE, ARRIVAL_DATE, DEPARTURE_COST, ARRIVAL_COST, TOTAL_FLIGHT_COST, ROUTE_ID FROM X2_SA_FLIGHT_SCHEDULE
UNION
SELECT ID, DEPARTURE_DATE, ARRIVAL_DAT AS ARRIVAL_DATE, DEPARTURE_COST, ARRIVAL_COST, TOTAL_FLIGHT_COST, ROUTE_ID FROM A3_SA_FS
);


