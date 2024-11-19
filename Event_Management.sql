-- Events Table
CREATE TABLE Event (
    event_id VARCHAR2(100) PRIMARY KEY,
    event_name VARCHAR2(100),
    event_date DATE,
    event_time TIMESTAMP,
    event_location VARCHAR2(255));
    
CREATE SEQUENCE seq_event;


-- Attendees Table
CREATE TABLE Attendees (
    attendee_id VARCHAR2(100) PRIMARY KEY,
    attendee_name VARCHAR2(100),
    contact VARCHAR2(255),
    event_id VARCHAR2(100),
    CONSTRAINT fk_event_attendees FOREIGN KEY (event_id) REFERENCES Event(event_id));
    
CREATE SEQUENCE seq_attendees;


-- Sessions/Performances Table
CREATE TABLE Sessions_Performances (
    session_id VARCHAR2(100) PRIMARY KEY,
    title VARCHAR2(200),
    sessions_description VARCHAR2(1000),
    start_time TIMESTAMP,
    end_time TIMESTAMP,
    event_id VARCHAR2(100),
    CONSTRAINT fk_event_sessions FOREIGN KEY (event_id) REFERENCES Event(event_id));

CREATE SEQUENCE seq_sessions_performances;

-- Registrations/Tickets Table
CREATE TABLE Registrations_Tickets (
    registration_id VARCHAR2(100) PRIMARY KEY,
    attendee_id VARCHAR2(100),
    event_id VARCHAR2(100),
    ticket_type VARCHAR2(100),
    price NUMBER,
    CONSTRAINT fk_attendee_registrations FOREIGN KEY (attendee_id) REFERENCES Attendees(attendee_id),
    CONSTRAINT fk_event_registrations FOREIGN KEY (event_id) REFERENCES Event(event_id));

CREATE SEQUENCE seq_registrations_tickets;

-- Sponsors Table
CREATE TABLE Sponsors (
    sponsor_id VARCHAR2(100) PRIMARY KEY,
    sponsors_name VARCHAR2(100),
    sponsors_contact VARCHAR2(255),
    sponsorship_level VARCHAR2(100),
    event_id VARCHAR2(100),
    CONSTRAINT fk_event_sponsors FOREIGN KEY (event_id) REFERENCES Event(event_id));
    
CREATE SEQUENCE seq_sponsors;

-- Tasks/Agenda Table
CREATE TABLE Tasks_Agenda (
    task_id VARCHAR2(100) PRIMARY KEY,
    agenda_description VARCHAR2(1000),
    assigned_personnel VARCHAR2(200),
    start_time TIMESTAMP,
    end_time TIMESTAMP,
    event_id VARCHAR2(100),
    CONSTRAINT fk_event_tasks FOREIGN KEY (event_id) REFERENCES Event(event_id));

CREATE SEQUENCE seq_tasks_agenda;

-- Venues Table
CREATE TABLE Venues (
    venue_id VARCHAR2(100) PRIMARY KEY,
    venue_name VARCHAR2(100),
    address VARCHAR2(255),
    capacity NUMBER,
    event_id VARCHAR2(100),
    CONSTRAINT fk_event_venues FOREIGN KEY (event_id) REFERENCES Event(event_id));
    
CREATE SEQUENCE seq_venues;
 
INSERT INTO Event VALUES ('EVT'||seq_event.NEXTVAL, 'Annual Conference', TO_DATE('2024-08-15', 'YYYY-MM-DD'), TO_TIMESTAMP('09:00:00', 'HH24:MI:SS'), 'Grand Ballroom A' );
INSERT INTO Event VALUES ('EVT'||seq_event.NEXTVAL, 'Music Festival', TO_DATE('2024-07-20', 'YYYY-MM-DD'), TO_TIMESTAMP('16:00:00', 'HH24:MI:SS'), 'Main Stage');
INSERT INTO Event VALUES ('EVT'||seq_event.NEXTVAL, 'Tech Summit', TO_DATE('2024-09-10', 'YYYY-MM-DD'), TO_TIMESTAMP('10:30:00', 'HH24:MI:SS'), 'Conference Hall');
INSERT INTO Event VALUES ('EVT'||seq_event.NEXTVAL, 'Art Exhibition', TO_DATE('2024-06-25', 'YYYY-MM-DD'), TO_TIMESTAMP('11:00:00', 'HH24:MI:SS'), 'Gallery Space');
INSERT INTO Event VALUES ('EVT'||seq_event.NEXTVAL, 'Food Expo', TO_DATE('2024-10-05', 'YYYY-MM-DD'), TO_TIMESTAMP('13:00:00', 'HH24:MI:SS'), 'Exhibition Hall');

select * from event;

 
INSERT INTO Attendees VALUES('AT'||seq_attendees.NEXTVAL,'Chamodya Ranasinghe', 'chamo@gmail.com', 'EVT1');
INSERT INTO Attendees VALUES ('AT'||seq_attendees.NEXTVAL, 'Induwara Jayarathne', 'indu@gmail.com', 'EVT1');
INSERT INTO Attendees VALUES ('AT'||seq_attendees.NEXTVAL, 'Pasindu Sahansith', 'sahansith@gmail.com', 'EVT2');
INSERT INTO Attendees VALUES ('AT'||seq_attendees.NEXTVAL, 'Senuki Dinara', 'senuki@gmail.com', 'EVT3');
INSERT INTO Attendees VALUES ('AT'||seq_attendees.NEXTVAL, 'Chathuni Himaya', 'himaya@gmail.com', 'EVT4');
INSERT INTO Attendees VALUES ('AT'||seq_attendees.NEXTVAL, 'Kavindu nirang', 'kavindu@gmail.com', 'EVT5');
INSERT INTO Attendees VALUES ('AT'||seq_attendees.NEXTVAL, 'Sheahn maduranga', 'shehan@gmail.com', 'EVT5');

select * from attendees;
  
INSERT INTO SESSIONS_PERFORMANCES VALUES ('SES'||seq_sessions_performances.NEXTVAL, 'Keynote speech', 'Opening keynote speech by industry experts', TO_TIMESTAMP('09:30:00', 'HH24:MI:SS'), TO_TIMESTAMP('10:30:00', 'HH24:MI:SS'), 'EVT1');
INSERT INTO SESSIONS_PERFORMANCES VALUES ('SES'||seq_sessions_performances.NEXTVAL, 'Concert', 'Live performance by popular band', TO_TIMESTAMP('18:00:00', 'HH24:MI:SS'), TO_TIMESTAMP('20:00:00', 'HH24:MI:SS'), 'EVT2');
INSERT INTO SESSIONS_PERFORMANCES VALUES ('SES'||seq_sessions_performances.NEXTVAL, 'Panel Discussion', 'Discussion on emerging technologies', TO_TIMESTAMP('11:00:00', 'HH24:MI:SS'), TO_TIMESTAMP('12:30:00', 'HH24:MI:SS'), 'EVT3');
INSERT INTO SESSIONS_PERFORMANCES VALUES ('SES'||seq_sessions_performances.NEXTVAL, 'Art Workshop', 'Interactive workshop on painting techniques', TO_TIMESTAMP('11:30:00', 'HH24:MI:SS'), TO_TIMESTAMP('13:00:00', 'HH24:MI:SS'), 'EVT4');
INSERT INTO SESSIONS_PERFORMANCES VALUES ('SES'||seq_sessions_performances.NEXTVAL, 'Cooking Demo', 'Live cooking demonstration by celebrity chef', TO_TIMESTAMP('14:30:00', 'HH24:MI:SS'), TO_TIMESTAMP('16:00:00', 'HH24:MI:SS'), 'EVT5');

select * from SESSIONS_PERFORMANCES;

  
INSERT INTO Registrations_Tickets VALUES ('REG'||seq_registrations_tickets.NEXTVAL, 'AT1', 'EVT1', 'Standard', 100);
INSERT INTO Registrations_Tickets VALUES ('REG'||seq_registrations_tickets.NEXTVAL, 'AT2', 'EVT1', 'Standard', 100);
INSERT INTO Registrations_Tickets VALUES ('REG'||seq_registrations_tickets.NEXTVAL, 'AT3', 'EVT2', 'VIP', 150);
INSERT INTO Registrations_Tickets VALUES ('REG'||seq_registrations_tickets.NEXTVAL, 'AT4', 'EVT3', 'General Admission', 50);
INSERT INTO Registrations_Tickets VALUES ('REG'||seq_registrations_tickets.NEXTVAL, 'AT5', 'EVT4', 'Early Bird', 70);
INSERT INTO Registrations_Tickets VALUES ('REG'||seq_registrations_tickets.NEXTVAL, 'AT6', 'EVT5', 'Regular', 80);
INSERT INTO Registrations_Tickets VALUES ('REG'||seq_registrations_tickets.NEXTVAL, 'AT7', 'EVT5', 'Regular', 80);

Select * from Registrations_Tickets;

INSERT INTO Sponsors VALUES ('SP'||seq_sponsors.NEXTVAL, 'Tech Corp', 'info@techcorp.com', 'Platinum', 'EVT1');
INSERT INTO Sponsors VALUES ('SP'||seq_sponsors.NEXTVAL, 'Music Store', 'contact@musicstore.com', 'Gold', 'EVT2');
INSERT INTO Sponsors VALUES  ('SP'||seq_sponsors.NEXTVAL, 'Software Solutions', 'sales@softwaresolutions.com', 'Silver', 'EVT3');
INSERT INTO Sponsors VALUES  ('SP'||seq_sponsors.NEXTVAL, 'Art Supplies Ltd', 'info@artsuppliesltd.com', 'Bronze', 'EVT4');
INSERT INTO Sponsors VALUES  ('SP'||seq_sponsors.NEXTVAL, 'Food Distributors Inc', 'orders@fooddistributorsinc.com', 'Bronze', 'EVT5');

SELECT * FROM Sponsors;


INSERT INTO Tasks_Agenda VALUES('TAS'||SEQ_TASKS_AGENDA.NEXTVAL, 'Setup booths and signage', 'Event Management Team', TO_TIMESTAMP('08:00:00', 'HH24:MI:SS'), TO_TIMESTAMP('09:30:00', 'HH24:MI:SS'), 'EVT1');
INSERT INTO Tasks_Agenda VALUES('TAS'||SEQ_TASKS_AGENDA.NEXTVAL, 'Soundcheck and stage preparation', 'Audio Visual Team', TO_TIMESTAMP('16:00:00', 'HH24:MI:SS'), TO_TIMESTAMP('17:30:00', 'HH24:MI:SS'), 'EVT2');
INSERT INTO Tasks_Agenda VALUES('TAS'||SEQ_TASKS_AGENDA.NEXTVAL, 'Tech demo setup', 'Tech Support Team', TO_TIMESTAMP('09:00:00', 'HH24:MI:SS'), TO_TIMESTAMP('10:00:00', 'HH24:MI:SS'), 'EVT3');
INSERT INTO Tasks_Agenda VALUES('TAS'||SEQ_TASKS_AGENDA.NEXTVAL, 'Artwork installation', 'Gallery Curator', TO_TIMESTAMP('10:00:00', 'HH24:MI:SS'), TO_TIMESTAMP('11:30:00', 'HH24:MI:SS'), 'EVT4');
INSERT INTO Tasks_Agenda VALUES('TAS'||SEQ_TASKS_AGENDA.NEXTVAL, 'Food sampling stations setup', 'Catering Team', TO_TIMESTAMP('12:00:00', 'HH24:MI:SS'), TO_TIMESTAMP('13:30:00', 'HH24:MI:SS'), 'EVT5');

SELECT * FROM Tasks_Agenda;


INSERT INTO Venues VALUES ('VEN'||SEQ_VENUES.NEXTVAL, 'Conference Co', 'Walukarama Rd', 1000, 'EVT1');
INSERT INTO Venues VALUES ('VEN'||SEQ_VENUES.NEXTVAL, 'Nelum pokuna', 'Colombo 007', 5000, 'EVT2');
INSERT INTO Venues VALUES ('VEN'||SEQ_VENUES.NEXTVAL, 'The Atrium', 'Janadhipathi Mawatha', 800, 'EVT3');
INSERT INTO Venues VALUES ('VEN'||SEQ_VENUES.NEXTVAL, 'Gallery FourLife', 'Colombo 005', 200, 'EVT4');
INSERT INTO Venues VALUES ('VEN'||SEQ_VENUES.NEXTVAL, 'BMICH', 'Bauddhaloka Mawatha', 1500, 'EVT5');

SELECT * FROM Venues;


--where
SELECT * FROM Event WHERE event_date > TO_DATE('2024-07-01', 'YYYY-MM-DD');
select * from event where event_time < TO_TIMESTAMP('12:00:00', 'HH24:MI:SS');

--group by
SELECT event_id, COUNT(*) AS registration_count FROM Registrations_Tickets GROUP BY event_id;

--having
SELECT event_id, COUNT(*) AS attendee_count FROM Attendees GROUP BY event_id HAVING COUNT(*)< 100;


--order by
SELECT * FROM Event ORDER BY event_date ASC;

-- Single row subquery 
SELECT attendee_name,event_id,(SELECT event_name FROM Event WHERE Event.event_id = Attendees.event_id) AS event_name
FROM Attendees
WHERE attendee_id = 'AT1';


-- Multiple row subquery to 
SELECT event_name,event_date,(SELECT COUNT(*) FROM Attendees WHERE Attendees.event_id = Event.event_id) AS num_attendees
FROM Event
WHERE event_id = 'EVT1';

--left join
SELECT e.event_id, e.event_name, a.attendee_id, a.attendee_name
FROM Event e LEFT JOIN Attendees a ON e.event_id = a.event_id;

--right join
SELECT v.venue_name, v.address,e.event_id, e.event_name
FROM Venues v RIGHT JOIN Event e ON e.event_id = v.event_id;



-- full outer join
SELECT e.event_id, e.event_name, a.attendee_id, a.attendee_name, r.registration_id, r.ticket_type, r.price
FROM Event e FULL OUTER JOIN Attendees a ON e.event_id = a.event_id FULL OUTER JOIN Registrations_Tickets r ON e.event_id = r.event_id AND a.attendee_id = r.attendee_id;

--view
CREATE VIEW Event_View AS SELECT * FROM Event;
SELECT * FROM Event_View;


CREATE VIEW Event_Venue_View AS SELECT e.event_id, e.event_name, e.event_date, e.event_time, e.event_location,v.venue_name, v.address, v.capacity
FROM Event e JOIN Venues v ON e.event_id = v.event_id;
SELECT * FROM Event_Venue_View;

--pl/sql part

---update recode

declare
a_contact  VARCHAR2(255) := 'KavinduNiranga@gmail.com';

BEGIN
 UPDATE Attendees set contact = a_contact where attendee_id = 'AT6';
 dbms_output.put_line('Attendees contact updated to '||a_contact);
 end;
 /
 
SET SERVEROUTPUT ON;
declare
a_name VARCHAR2(100) := 'lila';

BEGIN
    UPDATE Attendees set ATTENDEE_NAME = a_name where attendee_id = 'AT7';
    dbms_output.put_line('Attendees name updated to '||a_name);
    end;
    /

---Retrieve Data
SET SERVEROUTPUT ON;
DECLARE
    v_sp_name Sponsors.sponsors_name%TYPE;
BEGIN
    SELECT sponsors_name INTO v_sp_name
    FROM sponsors
    WHERE sponsor_id = 'SP3'; 

    DBMS_OUTPUT.PUT_LINE('Sponsor Name: ' || v_sp_name);
EXCEPTION
    WHEN NO_DATA_FOUND THEN
        DBMS_OUTPUT.PUT_LINE('No record found for the specified sponsor ID.');
END;




--- delete recorde
DECLARE
    v_deleted_rows NUMBER;
BEGIN
    DELETE FROM sponsors WHERE sponsor_id = 'SP6'; -- Specify the sponsor ID you want to delete

    v_deleted_rows := SQL%ROWCOUNT;
    DBMS_OUTPUT.PUT_LINE('Number of rows deleted: ' || v_deleted_rows);
EXCEPTION
    WHEN OTHERS THEN
        DBMS_OUTPUT.PUT_LINE('An error occurred while deleting the record.');
END;















--one unoth bavithayata
SELECT * FROM Event;
SELECT * FROM Attendees;
SELECT * FROM Sessions_Performances;
SELECT * FROM Registrations_Tickets;
SELECT * FROM Sponsors;
SELECT * FROM Tasks_Agenda;
SELECT * FROM Venues;


DROP TABLE Venues;
DROP TABLE Tasks_Agenda;
DROP TABLE Sponsors;
DROP TABLE Registrations_Tickets;
DROP TABLE Sessions_Performances;
DROP TABLE Attendees;
DROP TABLE Event;

DROP SEQUENCE seq_event;
DROP SEQUENCE seq_attendees;
DROP SEQUENCE seq_sessions_performances;
DROP SEQUENCE seq_registrations_tickets;
DROP SEQUENCE seq_sponsors;
DROP SEQUENCE seq_tasks_agenda;
DROP SEQUENCE seq_venues;

