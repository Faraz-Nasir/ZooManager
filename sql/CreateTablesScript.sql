CREATE TABLE EMPLOYEE(
    id INT NOT NULL,
    startdate DATE,
    jobType VARCHAR(25),
    first VARCHAR(15) NOT NULL,
    minit CHAR,
    last VARCHAR(15) NOT NULL,
    street VARCHAR(20),
    city VARCHAR(15),
    state VARCHAR(15),
    zip INT,
    hourlyrateID INT,
    supervisorID INT,
    concessionRevenueID INT,
    zooAdmissionRevenueID INT,
    PRIMARY KEY (id),
    CONSTRAINT sup_id FOREIGN KEY(supervisorID) REFERENCES EMPLOYEE(id)
);

CREATE TABLE HourlyRate(
    id INT NOT NULL,
    rate DOUBLE PRECISION NOT NULL,
    PRIMARY KEY (id)
);

ALTER TABLE EMPLOYEE
ADD CONSTRAINT emp_HR_ID FOREIGN KEY (hourlyrateID) REFERENCES HourlyRate(id) 
ON DELETE CASCADE;

CREATE TABLE SPECIES(
    id INT NOT NULL,
    name VARCHAR(15) NOT NULL,
    foodCost DOUBLE PRECISION NOT NULL,
    PRIMARY KEY(id)
);

CREATE TABLE ENCLOSURE(
    id INT NOT NULL,
    buildingId INT,
    sqft DOUBLE PRECISION NOT NULL,
    PRIMARY KEY(id)
);

CREATE TABLE ANIMAL(
    id INT NOT NULL,
    buildingId INT,
    speciesId INT,
    status VARCHAR(15),
    birthYear DATE,
    enclosureId INT,
    PRIMARY KEY (id),
    CONSTRAINT sp_id FOREIGN KEY (speciesId) REFERENCES SPECIES(id),
    CONSTRAINT en_id FOREIGN KEY (enclosureId) REFERENCES ENCLOSURE(id)
);

CREATE TABLE BUILDING(
    id INT NOT NULL,
    name VARCHAR(10),
    type VARCHAR(10),
    PRIMARY KEY (id)
);

ALTER TABLE ENCLOSURE ADD CONSTRAINT enc_bld_ID FOREIGN KEY (buildingId) REFERENCES BUILDING (id) ON DELETE CASCADE;

CREATE TABLE Revenue_Types(
    revenueTypeId INT NOT NULL,
    name VARCHAR(15),
    type VARCHAR(15),
    buildingId INT,
    PRIMARY KEY(revenueTypeId),
    CONSTRAINT bldn_id FOREIGN KEY (buildingId) REFERENCES BUILDING(id)
);

CREATE TABLE Revenue_Events(
    dateTime DATE NOT NULL,
    revenueId INT NOT NULL,
    ticketsSold DOUBLE PRECISION,
    revenue DOUBLE PRECISION,
    PRIMARY KEY (dateTime, revenueId),
    CONSTRAINT rvn_ID FOREIGN KEY (revenueId) REFERENCES Revenue_Types(revenueTypeId)
);

CREATE TABLE Animal_Show(
    revenueId INT PRIMARY KEY NOT NULL,
    seniorPrice DOUBLE PRECISION,
    adultPrice DOUBLE PRECISION,
    childPrice DOUBLE PRECISION,
    numberPerDay DOUBLE PRECISION,
    CONSTRAINT as_rvn_id FOREIGN KEY(revenueId) REFERENCES Revenue_Types(revenueTypeId)
);

CREATE TABLE CONCESSION(
    revenueId INT PRIMARY KEY NOT NULL,
    product VARCHAR(10),
    CONSTRAINT Crvn_ID FOREIGN KEY (revenueId) REFERENCES Revenue_Types(revenueTypeId)
);

ALTER TABLE EMPLOYEE 
ADD CONSTRAINT cncs_ID FOREIGN KEY (concessionRevenueID) REFERENCES CONCESSION(revenueID) 
ON DELETE CASCADE;


CREATE TABLE Zoo_Admission(
    revenueId INT PRIMARY KEY NOT NULL,
    seniorPrice DOUBLE PRECISION,
    adultPrice DOUBLE PRECISION,
    childPrice DOUBLE PRECISION,
    CONSTRAINT Za_rvn_ID FOREIGN KEY (revenueId) REFERENCES Revenue_Types(revenueTypeId)
);

ALTER TABLE EMPLOYEE 
ADD CONSTRAINT zar_ID FOREIGN KEY (zooAdmissionRevenueID) REFERENCES Zoo_Admission(revenueID) 
ON DELETE CASCADE;

CREATE TABLE Participates_In(
    speciesId INT NOT NULL,
    animalShowRevenueId INT NOT NULL,
    numberRequired INT,
    PRIMARY KEY (speciesId, animalShowRevenueId),
    CONSTRAINT sps_ID FOREIGN KEY (speciesId) REFERENCES SPECIES(id),
    CONSTRAINT ASrev_ID FOREIGN KEY (animalShowRevenueId) REFERENCES Animal_Show(revenueId)
);

CREATE TABLE Cares_For(
    speciesId INT NOT NULL,
    employeeId INT NOT NULL,
    PRIMARY KEY (speciesId,employeeId),
    CONSTRAINT spcs_id FOREIGN KEY (speciesId) REFERENCES SPECIES(id),
    CONSTRAINT emp_id FOREIGN KEY (employeeId) REFERENCES EMPLOYEE(id)
);