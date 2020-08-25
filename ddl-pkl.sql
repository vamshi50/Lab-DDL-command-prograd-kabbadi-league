-- PROGRESSION - 1


-- 1. **Create table city**
     CREATE TABLE CITY 
     (
     id INT NOT NULL,
     name VARCHAR(50) NOT NULL,
     CONSTRAINT CITY_PK PRIMARY KEY(id)
     );
     
-- 2. **Create table referee**
     CREATE TABLE REFEREE 
     (
     id INT NOT NULL,
     name VARCHAR(50) NOT NULL,
     CONSTRAINT REFEREE_PK PRIMARY KEY(id)
     );
--  3. **Create table innings**
     CREATE TABLE INNINGS
     (
     id INT NOT NULL,
     innings_number INT NOT NULL,
     CONSTRAINT INNINGS_PK PRIMARY KEY(id)
     );
     
-- 4. **Create table extra_type**
     CREATE TABLE EXTRA_TYPE 
     (
     id INT NOT NULL,
     name VARCHAR(50) NOT NULL,
     CONSTRAINT EXTRA_TYPE_PK PRIMARY KEY(id)
     );

-- 5. **Create table skill**
    CREATE TABLE SKILL 
     (
     id INT NOT NULL,
     name VARCHAR(50) NOT NULL,
     CONSTRAINT SKILL_PK PRIMARY KEY(id)
     );
-- 6. **Create table team**
    CREATE TABLE TEAM 
     (
     id INT NOT NULL,
     name VARCHAR(50) NOT NULL,
     coach VARCHAR(50) NOT NULL,
     home_city INT NOT NULL,
     captain INT NOT NULL,
     CONSTRAINT TEAM_PK PRIMARY KEY(id),
     CONSTRAINT TEAM_FK FOREIGN KEY(home_city) REFERENCES city(id)
     );  
-- 7. **Create table player**
     CREATE TABLE PLAYER
     (
     id INT NOT NULL,
     name VARCHAR(50) NOT NULL,
     country VARCHAR(50) NOT NULL,
     skill_id INT NOT NULL,
     team_id  INT NOT NULL,id),
     CONSTRAINT PLAYER_PK PRIMARY KEY(id),
     CONSTRAINT PLAYER_FK FOREIGN KEY(skill_id) REFERENCES skill(id),
     CONSTRAINT PLAYER_FK1 FOREIGN KEY(team_id) REFERENCES team(id)
     );  
    
-- 8. **Create table venue**
    CREATE TABLE VENUE
    (
    id INT,
    stadium_name varchar(50) NOT NULL,
    city_id INT NOT NULL,
    CONSTRAINT venue_PK PRIMARY KEY(ID),
    CONSTRAINT venue_FK FOREIGN KEY(city_id) REFERENCES city(id)
    );
    
-- 9. **Create table event**
  CREATE TABLE EVENT
  (
  id INT,
  innings_id INT NOT NULL,
  event_no INT NOT NULL,
  raider_id INT NOT NULL,
  raid_points INT NOT NULL,
  defending_points INT NOT NULL,
  clock_in_seconds INT NOT NULL,
  team_one_score INT NOT NULL,
  team_two_score INT NOT NULL,
  CONSTRAINT EVENT_PK PRIMARY KEY(id),
  CONSTRAINT EVENT_FK FOREIGN KEY(innings_id) REFERENCES innings(id),
  CONSTRAINT EVENT_FK1 FOREIGN KEY(raider_id) REFERENCES player(id)
  );
-- 10. **Create table extra_event**
 CREATE TABLE EXTRA_EVENT
 (
 id INT,
 event_id INT NOT NULL,
 extra_type_id INT NOT NULL,
 points INT NOT NULL,
 scoring_team_id INT NOT NULL,
 CONSTRAINT EXTRA_EVENT_PK PRIMARY KEY(id),
 CONSTRAINT EXTRA_EVENT_FK FOREIGN KEY(event_id) REFERENCES event(id),
 CONSTRAINT EXTRA_EVENT_FK1 FOREIGN KEY(extra_type_id) REFERENCES extra_type(id),
 CONSTRAINT EXTRA_EVENT_FK2 FOREIGN KEY(scoring_team_id) REFERENCES team(id)
 );
-- 11. **Create table outcome**
 CREATE TABLE OUTCOME
 (
 id INT,
 status VARCHAR(100) NOT NULL,
 winner_team_id INT,
 score INT,
 player_of_match INT,
 CONSTRAINT OUTCOME_PK PRIMARY KEY(id),
 CONSTRAINT OUTCOME_FK FOREIGN KEY(winner_team_id) REFERENCES team(id),
 CONSTRAINT OUTCOME_FK1 FOREIGN KEY(player_of_match) REFERENCES player(id)
 );
-- 12. **Create table game**
CREATE TABLE GAME
(
 id INT,
 game_date DATE NOT NULL,
 team_id_1 INT NOT NULL,
 team_id_2 INT NOT NULL,
 venue_id  INT NOT NULL,
 outcome_id INT NOT NULL,
 referee_id_1 INT NOT NULL,
 referee_id_2 INT NOT NULL,
 first_innings_id INT NOT NULL,
 second_innings_id INT NOT NULL,
 CONSTRAINT GAME_PK PRIMARY KEY(id),
 CONSTRAINT GAME_FK FOREIGN KEY(team_id_1) REFERENCES team(id),
 CONSTRAINT GAME_FK1 FOREIGN KEY(team_id_2) REFERENCES team(id),
 CONSTRAINT GAME_FK2 FOREIGN KEY(venue_id) REFERENCES venue(id),
 CONSTRAINT GAME_FK3 FOREIGN KEY(outcome_id) REFERENCES outcome(id),
 CONSTRAINT GAME_FK4 FOREIGN KEY(referee_id_1,) REFERENCES referee(id),
 CONSTRAINT GAME_FK5 FOREIGN KEY(referee_id_2) REFERENCES referee(id),
 CONSTRAINT GAME_FK6 FOREIGN KEY(first_innings_id) REFERENCES innings(id),
 CONSTRAINT GAME_FK7 FOREIGN KEY(second_innings_id) REFERENCES innings(id)
 );
-- 13. **Drop table city**
  ALTER TABLE TEAM DROP CONSTRAINT TEAM_FK;
  DROP TABLE CITY;
-- 14. **Drop table innings**
       DROP TABLE INNINGS
-- 15. **Drop table skill**
        DROP TABLE SKILL;
-- 16. **Drop table extra_type**
       DROP TABLE EXTRA_TYPE;