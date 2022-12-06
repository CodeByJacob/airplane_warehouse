CREATE OR REPLACE DIRECTORY imp_danych AS '/home/mounted_disk/csv/';

DROP TABLE SA_AIRPORTS_IMP;
CREATE TABLE SA_AIRPORTS_IMP (
     ID INTEGER,
    iata_code VARCHAR(3),
    name VARCHAR(40),
    country VARCHAR(40)
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
            ID ,
            iata_code, 
            name ,
            country
            )
    )    
    LOCATION ('airport.csv')
)
REJECT LIMIT Unlimited
NOPARALLEL;

CREATE TABLE SA_1_AIRPORTS AS (SELECT * FROM SA_AIRPORTS_IMP);
SELECT * FROM SA_1_AIRPORTS;