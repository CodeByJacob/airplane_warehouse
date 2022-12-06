create or replace PROCEDURE AUTOMATE_TO_UPDATE_ROTES AS 
BEGIN
    DELETE_CONFLICTS;
    FOR id IN 1 .. 32
    LOOP
        FOR id2 IN 1 .. 32  
        LOOP
            IF id = id2 THEN
                CONTINUE; 
            END IF;
            update_distance_procedure(id,id2);
            UPDATE_ROUTES_ID_PROCEDURE(id,id2);
            DELETE_DUPLICATED_ROUTES(id,id2);
        END LOOP;
    END LOOP;
END;

create or replace PROCEDURE DELETE_DUPLICATED_ROUTES (
    start_id in integer,
    end_id in integer
)
AS 
BEGIN
    DELETE FROM SA_TEMP_ROUTES WHERE ID > (
        SELECT MAX(NEW_ID) FROM ( 
            SELECT NEW_ID FROM SA_TEMP_ROUTES 
            WHERE
                DESTINATION_AIRCRAFT_ID = start_id AND 
                ARRIVAL_AIRCRAFT_ID = end_id
            )) AND DESTINATION_AIRCRAFT_ID = start_id AND 
                ARRIVAL_AIRCRAFT_ID = end_id;
    COMMIT;
END;

create or replace PROCEDURE DELETE_CONFLICTS AS 
BEGIN
    DELETE FROM SA_TEMP_ROUTES WHERE DESTINATION_AIRCRAFT_ID = ARRIVAL_AIRCRAFT_ID ;
    COMMIT;
END ;

create or replace PROCEDURE update_distance_procedure 
    (dept in integer,
    arr in integer) 
AS
    BEGIN
        UPDATE SA_TEMP_ROUTES 
        SET NEW_DISTANCE = (
            SELECT AVG(DISTANCE) 
            FROM SA_TEMP_ROUTES
            WHERE (DESTINATION_AIRCRAFT_ID = DEPT AND ARRIVAL_AIRCRAFT_ID = ARR) 
            OR (DESTINATION_AIRCRAFT_ID = ARR AND ARRIVAL_AIRCRAFT_ID = DEPT)
        ) WHERE (DESTINATION_AIRCRAFT_ID = DEPT AND ARRIVAL_AIRCRAFT_ID = ARR) 
            OR (DESTINATION_AIRCRAFT_ID = ARR AND ARRIVAL_AIRCRAFT_ID = DEPT);
    COMMIT;
    END;
    
create or replace PROCEDURE UPDATE_ROUTES_ID_PROCEDURE ( 
        start_id in integer,
        end_id in integer )
AS 
BEGIN
    UPDATE SA_TEMP_ROUTES 
    SET NEW_ID = (
        SELECT min(ID) AS MINID FROM SA_TEMP_ROUTES WHERE (DESTINATION_AIRCRAFT_ID = start_id AND ARRIVAL_AIRCRAFT_ID = end_id)
    ) WHERE (DESTINATION_AIRCRAFT_ID = start_id AND ARRIVAL_AIRCRAFT_ID = end_id);
    
    
    UPDATE SA_TEMP_ROUTES 
    SET NEW_ID = (
        SELECT min(ID) AS MINID FROM SA_TEMP_ROUTES WHERE (DESTINATION_AIRCRAFT_ID = end_id AND ARRIVAL_AIRCRAFT_ID = start_id)
    ) WHERE (DESTINATION_AIRCRAFT_ID = end_id AND ARRIVAL_AIRCRAFT_ID = start_id);
    
    COMMIT;
END UPDATE_ROUTES_ID_PROCEDURE;