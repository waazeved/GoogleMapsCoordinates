-- Creation of database, schema and tables

-- Database

CREATE DATABASE GOOGLE_MAPS_COORDINATES
    WITH
    OWNER = postgres
    ENCODING = 'UTF8'
    LC_COLLATE = 'en_US.UTF-8'
    LC_CTYPE = 'en_US.UTF-8'
    TABLESPACE = pg_default
    CONNECTION LIMIT = -1;

GRANT ALL ON DATABASE GOOGLE_MAPS_COORDINATES TO postgres;



-- SCHEMA: GOOGLE_MAPS_COORDINATES

CREATE SCHEMA GOOGLE_MAPS_COORDINATES;

-- CREATE TABLES

CREATE TABLE GOOGLE_MAPS_COORDINATES.GMC_SHAPE
(
    SHAPE_ID BIGINT NOT NULL,
    SHAPE_NAME CHARACTER VARYING(20),
    CONSTRAINT SHAPE_ID_PKEY PRIMARY KEY (SHAPE_ID)
);

CREATE TABLE GOOGLE_MAPS_COORDINATES.GMC_COORDINATE
(
    COORDINATE_ID BIGINT NOT NULL,
    COORDINATE_NAME CHARACTER VARYING(20),
   	COORDINATE_LATI DECIMAL,
   	COORDINATE_LONG DECIMAL,
    CONSTRAINT COORDINATE_ID_PKEY PRIMARY KEY (COORDINATE_ID)
);

CREATE TABLE GOOGLE_MAPS_COORDINATES.GCM_SHAPE_COORDINATE
(
  SHAPE_ID    int REFERENCES GOOGLE_MAPS_COORDINATES.GMC_SHAPE (SHAPE_ID) ON UPDATE CASCADE ON DELETE CASCADE,
  COORDINATE_ID int REFERENCES GOOGLE_MAPS_COORDINATES.GMC_COORDINATE (COORDINATE_ID) ON UPDATE CASCADE ON DELETE CASCADE,
  CONSTRAINT SHAPE_COORDINATE_PKEY PRIMARY KEY (SHAPE_ID, COORDINATE_ID)
);

-- CREATE SEQUENCES

CREATE SEQUENCE GOOGLE_MAPS_COORDINATES.SEQ_SHAPE_ID
    INCREMENT 1
    START 1
    MINVALUE 1
    MAXVALUE 9223372036854775807
    CACHE 1;


CREATE SEQUENCE GOOGLE_MAPS_COORDINATES.SEQ_COORDINATE_ID
    INCREMENT 1
    START 1
    MINVALUE 1
    MAXVALUE 9223372036854775807
    CACHE 1;

-- CREATING UNIQUE INDEX

   CREATE UNIQUE INDEX GMC_SHAPE_NAME_UNIQUE_INDEX ON GOOGLE_MAPS_COORDINATES.GMC_SHAPE (SHAPE_NAME);
   CREATE UNIQUE INDEX GMC_COORDINATE_NAME_UNIQUE_INDEX ON GOOGLE_MAPS_COORDINATES.GMC_COORDINATE (COORDINATE_NAME);


   
-- INSERTING SHAPE
   
INSERT INTO GOOGLE_MAPS_COORDINATES.GMC_SHAPE (SHAPE_ID, SHAPE_NAME) values (NEXTVAL('GOOGLE_MAPS_COORDINATES.SEQ_SHAPE_ID'), 'MultiPolygon');

-- INSERTING COORDINATES

INSERT INTO GOOGLE_MAPS_COORDINATES.GMC_COORDINATE 
(COORDINATE_ID, COORDINATE_NAME, COORDINATE_LATI, COORDINATE_LONG )
VALUES
(NEXTVAL('GOOGLE_MAPS_COORDINATES.SEQ_COORDINATE_ID'), 'A', 546434.780758121, 7480565.12505695);

INSERT INTO GOOGLE_MAPS_COORDINATES.GMC_COORDINATE 
(COORDINATE_ID, COORDINATE_NAME, COORDINATE_LATI, COORDINATE_LONG )
VALUES
(NEXTVAL('GOOGLE_MAPS_COORDINATES.SEQ_COORDINATE_ID'), 'B', 546430.363582357, 7480557.27268105);

INSERT INTO GOOGLE_MAPS_COORDINATES.GMC_COORDINATE 
(COORDINATE_ID, COORDINATE_NAME, COORDINATE_LATI, COORDINATE_LONG )
VALUES
(NEXTVAL('GOOGLE_MAPS_COORDINATES.SEQ_COORDINATE_ID'), 'C', 546446.91761193, 7480539.38632813);

INSERT INTO GOOGLE_MAPS_COORDINATES.GMC_COORDINATE 
(COORDINATE_ID, COORDINATE_NAME, COORDINATE_LATI, COORDINATE_LONG )
VALUES
(NEXTVAL('GOOGLE_MAPS_COORDINATES.SEQ_COORDINATE_ID'), 'D', 546466.69474399,
          7480509.00827764  );

INSERT INTO GOOGLE_MAPS_COORDINATES.GMC_COORDINATE 
(COORDINATE_ID, COORDINATE_NAME, COORDINATE_LATI, COORDINATE_LONG )
VALUES
(NEXTVAL('GOOGLE_MAPS_COORDINATES.SEQ_COORDINATE_ID'), 'E', 546479.207223846,
          7480485.31457325 );

INSERT INTO GOOGLE_MAPS_COORDINATES.GMC_COORDINATE 
(COORDINATE_ID, COORDINATE_NAME, COORDINATE_LATI, COORDINATE_LONG )
VALUES
(NEXTVAL('GOOGLE_MAPS_COORDINATES.SEQ_COORDINATE_ID'), 'F',  546471.174305319,
          7480498.18121188);

INSERT INTO GOOGLE_MAPS_COORDINATES.GMC_COORDINATE 
(COORDINATE_ID, COORDINATE_NAME, COORDINATE_LATI, COORDINATE_LONG )
VALUES
(NEXTVAL('GOOGLE_MAPS_COORDINATES.SEQ_COORDINATE_ID'), 'G',  546460.358305327,
          7480513.86521193);

INSERT INTO GOOGLE_MAPS_COORDINATES.GMC_COORDINATE 
(COORDINATE_ID, COORDINATE_NAME, COORDINATE_LATI, COORDINATE_LONG )
VALUES
(NEXTVAL('GOOGLE_MAPS_COORDINATES.SEQ_COORDINATE_ID'), 'H',  546451.076305313,
          7480527.46521189);

INSERT INTO GOOGLE_MAPS_COORDINATES.GMC_COORDINATE 
(COORDINATE_ID, COORDINATE_NAME, COORDINATE_LATI, COORDINATE_LONG )
VALUES
(NEXTVAL('GOOGLE_MAPS_COORDINATES.SEQ_COORDINATE_ID'), 'I',  546441.381305326,
          7480539.74221187);

INSERT INTO GOOGLE_MAPS_COORDINATES.GMC_COORDINATE 
(COORDINATE_ID, COORDINATE_NAME, COORDINATE_LATI, COORDINATE_LONG )
VALUES
(NEXTVAL('GOOGLE_MAPS_COORDINATES.SEQ_COORDINATE_ID'), 'J',  546432.039305249,
          7480550.81521191);

INSERT INTO GOOGLE_MAPS_COORDINATES.GMC_COORDINATE 
(COORDINATE_ID, COORDINATE_NAME, COORDINATE_LATI, COORDINATE_LONG )
VALUES
(NEXTVAL('GOOGLE_MAPS_COORDINATES.SEQ_COORDINATE_ID'), 'K',  546427.773912339,
          7480556.0404796);

INSERT INTO GOOGLE_MAPS_COORDINATES.GMC_COORDINATE 
(COORDINATE_ID, COORDINATE_NAME, COORDINATE_LATI, COORDINATE_LONG )
VALUES
(NEXTVAL('GOOGLE_MAPS_COORDINATES.SEQ_COORDINATE_ID'), 'L',  546433.87730531,
          7480564.06421189);          
          
INSERT INTO GOOGLE_MAPS_COORDINATES.GMC_COORDINATE 
(COORDINATE_ID, COORDINATE_NAME, COORDINATE_LATI, COORDINATE_LONG )
VALUES
(NEXTVAL('GOOGLE_MAPS_COORDINATES.SEQ_COORDINATE_ID'), 'M',  546434.780758121,
          7480565.12505695);
          
-- CREATING RELATION BETWEEN SHAPE AND COORDINATES
          
INSERT INTO GOOGLE_MAPS_COORDINATES.GCM_SHAPE_COORDINATE 
(SHAPE_ID, COORDINATE_ID)
VALUES
( 
	(SELECT SHAPE_ID FROM GOOGLE_MAPS_COORDINATES.GMC_SHAPE WHERE SHAPE_NAME = 'MultiPolygon'),
	(SELECT COORDINATE_ID FROM GOOGLE_MAPS_COORDINATES.GMC_COORDINATE WHERE COORDINATE_NAME = 'A')
);

INSERT INTO GOOGLE_MAPS_COORDINATES.GCM_SHAPE_COORDINATE 
(SHAPE_ID, COORDINATE_ID)
VALUES
( 
	(SELECT SHAPE_ID FROM GOOGLE_MAPS_COORDINATES.GMC_SHAPE WHERE SHAPE_NAME = 'MultiPolygon'),
	(SELECT COORDINATE_ID FROM GOOGLE_MAPS_COORDINATES.GMC_COORDINATE WHERE COORDINATE_NAME = 'B')
);

INSERT INTO GOOGLE_MAPS_COORDINATES.GCM_SHAPE_COORDINATE 
(SHAPE_ID, COORDINATE_ID)
VALUES
( 
	(SELECT SHAPE_ID FROM GOOGLE_MAPS_COORDINATES.GMC_SHAPE WHERE SHAPE_NAME = 'MultiPolygon'),
	(SELECT COORDINATE_ID FROM GOOGLE_MAPS_COORDINATES.GMC_COORDINATE WHERE COORDINATE_NAME = 'C')
);

INSERT INTO GOOGLE_MAPS_COORDINATES.GCM_SHAPE_COORDINATE 
(SHAPE_ID, COORDINATE_ID)
VALUES
( 
	(SELECT SHAPE_ID FROM GOOGLE_MAPS_COORDINATES.GMC_SHAPE WHERE SHAPE_NAME = 'MultiPolygon'),
	(SELECT COORDINATE_ID FROM GOOGLE_MAPS_COORDINATES.GMC_COORDINATE WHERE COORDINATE_NAME = 'D')
);

INSERT INTO GOOGLE_MAPS_COORDINATES.GCM_SHAPE_COORDINATE 
(SHAPE_ID, COORDINATE_ID)
VALUES
( 
	(SELECT SHAPE_ID FROM GOOGLE_MAPS_COORDINATES.GMC_SHAPE WHERE SHAPE_NAME = 'MultiPolygon'),
	(SELECT COORDINATE_ID FROM GOOGLE_MAPS_COORDINATES.GMC_COORDINATE WHERE COORDINATE_NAME = 'E')
);

INSERT INTO GOOGLE_MAPS_COORDINATES.GCM_SHAPE_COORDINATE 
(SHAPE_ID, COORDINATE_ID)
VALUES
( 
	(SELECT SHAPE_ID FROM GOOGLE_MAPS_COORDINATES.GMC_SHAPE WHERE SHAPE_NAME = 'MultiPolygon'),
	(SELECT COORDINATE_ID FROM GOOGLE_MAPS_COORDINATES.GMC_COORDINATE WHERE COORDINATE_NAME = 'F')
);

INSERT INTO GOOGLE_MAPS_COORDINATES.GCM_SHAPE_COORDINATE 
(SHAPE_ID, COORDINATE_ID)
VALUES
( 
	(SELECT SHAPE_ID FROM GOOGLE_MAPS_COORDINATES.GMC_SHAPE WHERE SHAPE_NAME = 'MultiPolygon'),
	(SELECT COORDINATE_ID FROM GOOGLE_MAPS_COORDINATES.GMC_COORDINATE WHERE COORDINATE_NAME = 'G')
);

INSERT INTO GOOGLE_MAPS_COORDINATES.GCM_SHAPE_COORDINATE 
(SHAPE_ID, COORDINATE_ID)
VALUES
( 
	(SELECT SHAPE_ID FROM GOOGLE_MAPS_COORDINATES.GMC_SHAPE WHERE SHAPE_NAME = 'MultiPolygon'),
	(SELECT COORDINATE_ID FROM GOOGLE_MAPS_COORDINATES.GMC_COORDINATE WHERE COORDINATE_NAME = 'H')
);

INSERT INTO GOOGLE_MAPS_COORDINATES.GCM_SHAPE_COORDINATE 
(SHAPE_ID, COORDINATE_ID)
VALUES
( 
	(SELECT SHAPE_ID FROM GOOGLE_MAPS_COORDINATES.GMC_SHAPE WHERE SHAPE_NAME = 'MultiPolygon'),
	(SELECT COORDINATE_ID FROM GOOGLE_MAPS_COORDINATES.GMC_COORDINATE WHERE COORDINATE_NAME = 'I')
);

INSERT INTO GOOGLE_MAPS_COORDINATES.GCM_SHAPE_COORDINATE 
(SHAPE_ID, COORDINATE_ID)
VALUES
( 
	(SELECT SHAPE_ID FROM GOOGLE_MAPS_COORDINATES.GMC_SHAPE WHERE SHAPE_NAME = 'MultiPolygon'),
	(SELECT COORDINATE_ID FROM GOOGLE_MAPS_COORDINATES.GMC_COORDINATE WHERE COORDINATE_NAME = 'J')
);

INSERT INTO GOOGLE_MAPS_COORDINATES.GCM_SHAPE_COORDINATE 
(SHAPE_ID, COORDINATE_ID)
VALUES
( 
	(SELECT SHAPE_ID FROM GOOGLE_MAPS_COORDINATES.GMC_SHAPE WHERE SHAPE_NAME = 'MultiPolygon'),
	(SELECT COORDINATE_ID FROM GOOGLE_MAPS_COORDINATES.GMC_COORDINATE WHERE COORDINATE_NAME = 'K')
);

INSERT INTO GOOGLE_MAPS_COORDINATES.GCM_SHAPE_COORDINATE 
(SHAPE_ID, COORDINATE_ID)
VALUES
( 
	(SELECT SHAPE_ID FROM GOOGLE_MAPS_COORDINATES.GMC_SHAPE WHERE SHAPE_NAME = 'MultiPolygon'),
	(SELECT COORDINATE_ID FROM GOOGLE_MAPS_COORDINATES.GMC_COORDINATE WHERE COORDINATE_NAME = 'L')
);

INSERT INTO GOOGLE_MAPS_COORDINATES.GCM_SHAPE_COORDINATE 
(SHAPE_ID, COORDINATE_ID)
VALUES
( 
	(SELECT SHAPE_ID FROM GOOGLE_MAPS_COORDINATES.GMC_SHAPE WHERE SHAPE_NAME = 'MultiPolygon'),
	(SELECT COORDINATE_ID FROM GOOGLE_MAPS_COORDINATES.GMC_COORDINATE WHERE COORDINATE_NAME = 'M')
);