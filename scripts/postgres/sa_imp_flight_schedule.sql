CREATE TABLE SA_FLIGHT_SCHEDULE_IMPL (
    ID INTEGER,
    STATUS VARCHAR(50),
    ARRIVAL_COST INTEGER,
    DEPARTURE_COST INTEGER,
    ARRIVAL_DATE VARCHAR(10),
    DEPARTURE_DATE VARCHAR(10),
    AIRCRAFT_ID INTEGER,
    ROUTE_ID INTEGER,
    TOTAL_FUEL_COST INTEGER
)
ORGANIZATION EXTERNAL (  
    TYPE ORACLE_LOADER    
    DEFAULT DIRECTORY imp_danych
    ACCESS PARAMETERS (       
        RECORDS DELIMITED BY NEWLINE
        BADFILE 'sa_route.bad'  
        NODISCARDFILE
        LOGFILE 'sa_route.log' 
        FIELDS TERMINATED BY ',' 
        OPTIONALLY ENCLOSED BY '"' 
        MISSING FIELD VALUES ARE NULL    
        REJECT ROWS WITH ALL NULL FIELDS        
        (
            ID, 
            STATUS, 
            ARRIVAL_COST,
            DEPARTURE_COST, 
            ARRIVAL_DATE,
            DEPARTURE_DATE,
            AIRCRAFT_ID, 
            ROUTE_ID, 
            TOTAL_FUEL_COST
        )
    )
    LOCATION ('FLIGHT_SCHEDULE.csv')
)
REJECT LIMIT Unlimited
NOPARALLEL;

select * from SA_FLIGHT_SCHEDULE_IMPL;
drop table SA_FLIGHT_SCHEDULE_IMPL;

DROP TABLE SA_1_FLIGHT_SCHEDULE;

CREATE TABLE SA_1_FLIGHT_SCHEDULE AS 
(SELECT
    ID,
    TO_CHAR(to_date(DEPARTURE_DATE,'DD/MM/YYYY'), 'YYYY-MM-DD') AS DEPARTURE_DATE,
    TO_CHAR(to_date(ARRIVAL_DATE,'DD/MM/YYYY'), 'YYYY-MM-DD') AS ARRIVAL_DATE,
    ROUTE_ID, 
    ARRIVAL_COST, 
    DEPARTURE_COST, 
    TOTAL_FUEL_COST
 FROM SA_FLIGHT_SCHEDULE_IMPL);
 
 ALTER TABLE SA_1_ROUTES ADD CONSTRAINT PK_SA1_ROUTES PRIMARY KEY (ID);
 ALTER TABLE SA_1_FLIGHT_SCHEDULE ADD CONSTRAINT FK_SA1_FLIGHT_SCHEDULE_ROUTE FOREIGN KEY (ROUTE_ID) REFERENCES SA_1_ROUTES(ID);