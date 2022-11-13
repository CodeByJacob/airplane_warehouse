CREATE TABLE gender(
  gender_id   NUMBER PRIMARY KEY,
  gender_str  VARCHAR2(10)
);

INSERT INTO gender VALUES( 1, 'male' );
INSERT INTO gender VALUES( 2, 'famale' );

CREATE TABLE airport(
    airport_id NUMBER PRIMARY KEY,
    iata_code VARCHAR(3) UNIQUE,
    airport_name VARCHAR(30),
    country VARCHAR(60)
);

CREATE TABLE AIRPLANE(
    id NUMBER PRIMARY KEY,
    airlane_name VARCHAR(40),
    height INTEGER,
    lenght INTEGER,
    wingspan INTEGER,
    weight INTEGER,
    max_speed INTEGER,
    max_weight INTEGER,
    total_seats_eco INTEGER,
    total_seats_bus INTEGER,
    fuel_capacity INTEGER,
    production_year INTEGER
);

CREATE TABLE TICKET (
  id NUMBER PRIMARY KEY,
  passangerID INTEGER,
  flightID INTEGER,
  place VARCHAR(40),
  flight_number VARCHAR(40),
  price INTEGER
);

CREATE TABLE FLIGHT_DETAILS (
  id NUMBER PRIMARY KEY,
  airplaneID NUMBER,
  departure_time TIMESTAMP,
  arrival_time TIMESTAMP,
  departure_code NUMBER REFERENCES AIRPORT(airport_id),
  destination_code NUMBER REFERENCES AIRPORT(airport_id),
  flight_cost INTEGER,
  departure_airport_cost INTEGER,
  arriwall_airport_cost INTEGER,
  total_free_bus_seats INTEGER,
  total_free_eco_seats INTEGER,
  workers_cost INTEGER,
  distance INTEGER
);

CREATE TABLE PASSANGER (
  id NUMBER PRIMARY KEY,
  age INTEGER,
  weight INTEGER,
  id_number VARCHAR(40),
  gender NUMBER
  nationality VARCHAR
);

CREATE VIEW vw_gender
  AS 
  SELECT a.gender_id
    FROM valid_gender a,
         passanger    b
   WHERE a.gender_id = b.gender;


ALTER TABLE TICKET ADD FOREIGN KEY (id) REFERENCES PASSANGER(id);

ALTER TABLE TICKET ADD FOREIGN KEY (id) REFERENCES FLIGHT_DETAILS(id);

ALTER TABLE FLIGHT_DETAILS ADD FOREIGN KEY (id) REFERENCES AIRPLANE (id);