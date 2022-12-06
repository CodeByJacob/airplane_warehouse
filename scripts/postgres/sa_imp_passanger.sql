 -- DROP TABLE SA_PASSENGER_IMPL;

CREATE TABLE SA_PASSENGER_IMPL (
    ID INTEGER,
    NAME CHAR(50),
    COUNTRY_NAME CHAR(50),
    PHONE_NUMBER CHAR(50),
    EMAIL CHAR(50),
    AGE INTEGER,
    SEX CHAR(10)
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
            NAME,
            COUNTRY_NAME,
            PHONE_NUMBER,
            EMAIL,
            AGE,
            SEX 
        )
    )
    LOCATION ('PASSENGER.csv')
)
REJECT LIMIT Unlimited
NOPARALLEL;

SELECT * FROM SA_PASSENGER_IMPL;

CREATE TABLE SA_1_PASSENGER AS 
(SELECT
    ID,
    AGE,
    SEX AS GENDER,
    COUNTRY_NAME
 FROM SA_PASSENGER_IMPL);