-- Dimension: Routes
CREATE TABLE Dim_Routes (
    RouteID INT PRIMARY KEY,
    RouteName VARCHAR(100),
    StartLocation VARCHAR(100),
    EndLocation VARCHAR(100),
    TripFee INT,
    TakeOffTime TIME,
    ArrivalTime TIME
);

-- Dimension: Buses
CREATE TABLE Dim_Buses (
    BusID INT PRIMARY KEY,
    RouteID INT,
    BusNumber VARCHAR(50),
    Capacity INT,
    FOREIGN KEY (RouteID)
        REFERENCES Dim_Routes(RouteID)
);

-- Dimension: Demographics
CREATE TABLE Dim_Demographics (
    RiderID INT PRIMARY KEY,
    Age INT,
    Gender VARCHAR(20),
    Occupation VARCHAR(100)
);

-- Fact Table
CREATE TABLE Fact_Ridership (
    RecordID INT PRIMARY KEY,
    BusID INT,
    RideDate DATE,
    RideTime TIME,
    NumberOfRiders INT,
    RiderID INT,
    FOREIGN KEY (BusID)
        REFERENCES Dim_Buses(BusID),
    FOREIGN KEY (RiderID)
        REFERENCES Dim_Demographics(RiderID)
);



ALTER TABLE Fact_Ridership
ADD RideTime_AMPM VARCHAR(10);



UPDATE Fact_Ridership
SET RideTime_AMPM =
    FORMAT(CAST(RideTime AS TIME), 'hh:mm tt');



-- Dim_Routes
INSERT INTO Dim_Routes (RouteID, RouteName, StartLocation, EndLocation, TripFee, TakeOffTime, ArrivalTime) VALUES (1, 'Central Line', 'Downtown', 'Uptown', 50, '16:00:00', '18:30:00');
INSERT INTO Dim_Routes (RouteID, RouteName, StartLocation, EndLocation, TripFee, TakeOffTime, ArrivalTime) VALUES (2, 'East-West Express', 'Eastside', 'Westside', 13, '22:00:00', '12:30:00');
INSERT INTO Dim_Routes (RouteID, RouteName, StartLocation, EndLocation, TripFee, TakeOffTime, ArrivalTime) VALUES (3, 'North Circular', 'North Station', 'Circular Quay', 31, '18:00:00', '16:30:00');
INSERT INTO Dim_Routes (RouteID, RouteName, StartLocation, EndLocation, TripFee, TakeOffTime, ArrivalTime) VALUES (4, 'South Line', 'South Park', 'Old Town', 29, '08:00:00', '22:30:00');
INSERT INTO Dim_Routes (RouteID, RouteName, StartLocation, EndLocation, TripFee, TakeOffTime, ArrivalTime) VALUES (5, 'City Shuttle', 'City Center', 'City Hall', 19, '14:00:00', '20:30:00');
INSERT INTO Dim_Routes (RouteID, RouteName, StartLocation, EndLocation, TripFee, TakeOffTime, ArrivalTime) VALUES (6, 'Airport Express', 'Airport', 'Downtown', 37, '14:00:00', '08:30:00');
INSERT INTO Dim_Routes (RouteID, RouteName, StartLocation, EndLocation, TripFee, TakeOffTime, ArrivalTime) VALUES (7, 'University Line', 'University', 'Tech Park', 19, '14:00:00', '08:30:00');
INSERT INTO Dim_Routes (RouteID, RouteName, StartLocation, EndLocation, TripFee, TakeOffTime, ArrivalTime) VALUES (8, 'Market Line', 'Central Market', 'Farmers Market', 18, '22:00:00', '16:30:00');
INSERT INTO Dim_Routes (RouteID, RouteName, StartLocation, EndLocation, TripFee, TakeOffTime, ArrivalTime) VALUES (9, 'Beachfront Route', 'Beachside', 'Harbor Point', 19, '10:00:00', '12:30:00');
INSERT INTO Dim_Routes (RouteID, RouteName, StartLocation, EndLocation, TripFee, TakeOffTime, ArrivalTime) VALUES (10, 'Suburban Line', 'Suburbia', 'Downtown', 33, '14:00:00', '10:30:00');

-- Dim_Buses
INSERT INTO Dim_Buses (BusID, RouteID, BusNumber, Capacity) VALUES (1, 7, 'Bus 1', 30);
INSERT INTO Dim_Buses (BusID, RouteID, BusNumber, Capacity) VALUES (2, 1, 'Bus 2', 60);
INSERT INTO Dim_Buses (BusID, RouteID, BusNumber, Capacity) VALUES (3, 2, 'Bus 3', 40);
INSERT INTO Dim_Buses (BusID, RouteID, BusNumber, Capacity) VALUES (4, 1, 'Bus 4', 50);
INSERT INTO Dim_Buses (BusID, RouteID, BusNumber, Capacity) VALUES (5, 2, 'Bus 5', 60);
INSERT INTO Dim_Buses (BusID, RouteID, BusNumber, Capacity) VALUES (6, 10, 'Bus 6', 50);
INSERT INTO Dim_Buses (BusID, RouteID, BusNumber, Capacity) VALUES (7, 8, 'Bus 7', 30);
INSERT INTO Dim_Buses (BusID, RouteID, BusNumber, Capacity) VALUES (8, 7, 'Bus 8', 50);
INSERT INTO Dim_Buses (BusID, RouteID, BusNumber, Capacity) VALUES (9, 2, 'Bus 9', 30);
INSERT INTO Dim_Buses (BusID, RouteID, BusNumber, Capacity) VALUES (10, 6, 'Bus 10', 60);
INSERT INTO Dim_Buses (BusID, RouteID, BusNumber, Capacity) VALUES (11, 8, 'Bus 11', 50);
INSERT INTO Dim_Buses (BusID, RouteID, BusNumber, Capacity) VALUES (12, 3, 'Bus 12', 50);
INSERT INTO Dim_Buses (BusID, RouteID, BusNumber, Capacity) VALUES (13, 1, 'Bus 13', 50);
INSERT INTO Dim_Buses (BusID, RouteID, BusNumber, Capacity) VALUES (14, 2, 'Bus 14', 40);
INSERT INTO Dim_Buses (BusID, RouteID, BusNumber, Capacity) VALUES (15, 7, 'Bus 15', 40);
INSERT INTO Dim_Buses (BusID, RouteID, BusNumber, Capacity) VALUES (16, 7, 'Bus 16', 60);
INSERT INTO Dim_Buses (BusID, RouteID, BusNumber, Capacity) VALUES (17, 1, 'Bus 17', 40);
INSERT INTO Dim_Buses (BusID, RouteID, BusNumber, Capacity) VALUES (18, 9, 'Bus 18', 60);
INSERT INTO Dim_Buses (BusID, RouteID, BusNumber, Capacity) VALUES (19, 9, 'Bus 19', 50);
INSERT INTO Dim_Buses (BusID, RouteID, BusNumber, Capacity) VALUES (20, 2, 'Bus 20', 30);
INSERT INTO Dim_Buses (BusID, RouteID, BusNumber, Capacity) VALUES (21, 2, 'Bus 21', 40);
INSERT INTO Dim_Buses (BusID, RouteID, BusNumber, Capacity) VALUES (22, 10, 'Bus 22', 30);
INSERT INTO Dim_Buses (BusID, RouteID, BusNumber, Capacity) VALUES (23, 7, 'Bus 23', 50);
INSERT INTO Dim_Buses (BusID, RouteID, BusNumber, Capacity) VALUES (24, 2, 'Bus 24', 40);
INSERT INTO Dim_Buses (BusID, RouteID, BusNumber, Capacity) VALUES (25, 6, 'Bus 25', 40);
INSERT INTO Dim_Buses (BusID, RouteID, BusNumber, Capacity) VALUES (26, 3, 'Bus 26', 40);
INSERT INTO Dim_Buses (BusID, RouteID, BusNumber, Capacity) VALUES (27, 5, 'Bus 27', 40);
INSERT INTO Dim_Buses (BusID, RouteID, BusNumber, Capacity) VALUES (28, 6, 'Bus 28', 30);
INSERT INTO Dim_Buses (BusID, RouteID, BusNumber, Capacity) VALUES (29, 8, 'Bus 29', 40);
INSERT INTO Dim_Buses (BusID, RouteID, BusNumber, Capacity) VALUES (30, 4, 'Bus 30', 50);
INSERT INTO Dim_Buses (BusID, RouteID, BusNumber, Capacity) VALUES (31, 1, 'Bus 31', 30);
INSERT INTO Dim_Buses (BusID, RouteID, BusNumber, Capacity) VALUES (32, 8, 'Bus 32', 30);
INSERT INTO Dim_Buses (BusID, RouteID, BusNumber, Capacity) VALUES (33, 10, 'Bus 33', 60);
INSERT INTO Dim_Buses (BusID, RouteID, BusNumber, Capacity) VALUES (34, 1, 'Bus 34', 40);
INSERT INTO Dim_Buses (BusID, RouteID, BusNumber, Capacity) VALUES (35, 2, 'Bus 35', 50);
INSERT INTO Dim_Buses (BusID, RouteID, BusNumber, Capacity) VALUES (36, 10, 'Bus 36', 30);
INSERT INTO Dim_Buses (BusID, RouteID, BusNumber, Capacity) VALUES (37, 5, 'Bus 37', 50);
INSERT INTO Dim_Buses (BusID, RouteID, BusNumber, Capacity) VALUES (38, 1, 'Bus 38', 50);
INSERT INTO Dim_Buses (BusID, RouteID, BusNumber, Capacity) VALUES (39, 9, 'Bus 39', 40);
INSERT INTO Dim_Buses (BusID, RouteID, BusNumber, Capacity) VALUES (40, 7, 'Bus 40', 40);

-- Dim_Demographics
INSERT INTO Dim_Demographics (RiderID, Age, Gender, Occupation) VALUES (1, 27, 'Other', 'Self-Employed');
INSERT INTO Dim_Demographics (RiderID, Age, Gender, Occupation) VALUES (2, 39, 'Female', 'Self-Employed');
INSERT INTO Dim_Demographics (RiderID, Age, Gender, Occupation) VALUES (3, 48, 'Female', 'Professional');
INSERT INTO Dim_Demographics (RiderID, Age, Gender, Occupation) VALUES (4, 34, 'Male', 'Other');
INSERT INTO Dim_Demographics (RiderID, Age, Gender, Occupation) VALUES (5, 33, 'Male', 'Self-Employed');
INSERT INTO Dim_Demographics (RiderID, Age, Gender, Occupation) VALUES (6, 51, 'Male', 'Unemployed');
INSERT INTO Dim_Demographics (RiderID, Age, Gender, Occupation) VALUES (7, 54, 'Male', 'Self-Employed');
INSERT INTO Dim_Demographics (RiderID, Age, Gender, Occupation) VALUES (8, 67, 'Male', 'Retired');
INSERT INTO Dim_Demographics (RiderID, Age, Gender, Occupation) VALUES (9, 56, 'Male', 'Self-Employed');
INSERT INTO Dim_Demographics (RiderID, Age, Gender, Occupation) VALUES (10, 34, 'Male', 'Other');
INSERT INTO Dim_Demographics (RiderID, Age, Gender, Occupation) VALUES (11, 50, 'Male', 'Professional');
INSERT INTO Dim_Demographics (RiderID, Age, Gender, Occupation) VALUES (12, 40, 'Male', 'Other');
INSERT INTO Dim_Demographics (RiderID, Age, Gender, Occupation) VALUES (13, 70, 'Male', 'Professional');
INSERT INTO Dim_Demographics (RiderID, Age, Gender, Occupation) VALUES (14, 65, 'Male', 'Self-Employed');
INSERT INTO Dim_Demographics (RiderID, Age, Gender, Occupation) VALUES (15, 55, 'Male', 'Professional');
INSERT INTO Dim_Demographics (RiderID, Age, Gender, Occupation) VALUES (16, 56, 'Male', 'Retired');
INSERT INTO Dim_Demographics (RiderID, Age, Gender, Occupation) VALUES (17, 37, 'Male', 'Unemployed');
INSERT INTO Dim_Demographics (RiderID, Age, Gender, Occupation) VALUES (18, 46, 'Male', 'Other');
INSERT INTO Dim_Demographics (RiderID, Age, Gender, Occupation) VALUES (19, 41, 'Male', 'Other');
INSERT INTO Dim_Demographics (RiderID, Age, Gender, Occupation) VALUES (20, 29, 'Male', 'Unemployed');
INSERT INTO Dim_Demographics (RiderID, Age, Gender, Occupation) VALUES (21, 68, 'Male', 'Other');
INSERT INTO Dim_Demographics (RiderID, Age, Gender, Occupation) VALUES (22, 58, 'Male', 'Unemployed');
INSERT INTO Dim_Demographics (RiderID, Age, Gender, Occupation) VALUES (23, 60, 'Male', 'Professional');
INSERT INTO Dim_Demographics (RiderID, Age, Gender, Occupation) VALUES (24, 30, 'Male', 'Unemployed');
INSERT INTO Dim_Demographics (RiderID, Age, Gender, Occupation) VALUES (25, 42, 'Male', 'Professional');
INSERT INTO Dim_Demographics (RiderID, Age, Gender, Occupation) VALUES (26, 49, 'Male', 'Student');
INSERT INTO Dim_Demographics (RiderID, Age, Gender, Occupation) VALUES (27, 42, 'Male', 'Professional');
INSERT INTO Dim_Demographics (RiderID, Age, Gender, Occupation) VALUES (28, 31, 'Male', 'Self-Employed');
INSERT INTO Dim_Demographics (RiderID, Age, Gender, Occupation) VALUES (29, 43, 'Male', 'Retired');
INSERT INTO Dim_Demographics (RiderID, Age, Gender, Occupation) VALUES (30, 62, 'Other', 'Professional');
INSERT INTO Dim_Demographics (RiderID, Age, Gender, Occupation) VALUES (31, 18, 'Female', 'Professional');
INSERT INTO Dim_Demographics (RiderID, Age, Gender, Occupation) VALUES (32, 44, 'Male', 'Self-Employed');
INSERT INTO Dim_Demographics (RiderID, Age, Gender, Occupation) VALUES (33, 34, 'Male', 'Professional');
INSERT INTO Dim_Demographics (RiderID, Age, Gender, Occupation) VALUES (34, 60, 'Male', 'Professional');
INSERT INTO Dim_Demographics (RiderID, Age, Gender, Occupation) VALUES (35, 57, 'Male', 'Professional');
INSERT INTO Dim_Demographics (RiderID, Age, Gender, Occupation) VALUES (36, 33, 'Male', 'Unemployed');
INSERT INTO Dim_Demographics (RiderID, Age, Gender, Occupation) VALUES (37, 54, 'Male', 'Other');
INSERT INTO Dim_Demographics (RiderID, Age, Gender, Occupation) VALUES (38, 42, 'Male', 'Student');
INSERT INTO Dim_Demographics (RiderID, Age, Gender, Occupation) VALUES (39, 57, 'Male', 'Other');
INSERT INTO Dim_Demographics (RiderID, Age, Gender, Occupation) VALUES (40, 44, 'Male', 'Student');
INSERT INTO Dim_Demographics (RiderID, Age, Gender, Occupation) VALUES (41, 32, 'Male', 'Other');
INSERT INTO Dim_Demographics (RiderID, Age, Gender, Occupation) VALUES (42, 18, 'Male', 'Self-Employed');
INSERT INTO Dim_Demographics (RiderID, Age, Gender, Occupation) VALUES (43, 32, 'Male', 'Other');
INSERT INTO Dim_Demographics (RiderID, Age, Gender, Occupation) VALUES (44, 30, 'Male', 'Unemployed');
INSERT INTO Dim_Demographics (RiderID, Age, Gender, Occupation) VALUES (45, 52, 'Male', 'Retired');
INSERT INTO Dim_Demographics (RiderID, Age, Gender, Occupation) VALUES (46, 26, 'Male', 'Other');
INSERT INTO Dim_Demographics (RiderID, Age, Gender, Occupation) VALUES (47, 37, 'Male', 'Retired');
INSERT INTO Dim_Demographics (RiderID, Age, Gender, Occupation) VALUES (48, 51, 'Male', 'Professional');
INSERT INTO Dim_Demographics (RiderID, Age, Gender, Occupation) VALUES (49, 29, 'Male', 'Unemployed');
INSERT INTO Dim_Demographics (RiderID, Age, Gender, Occupation) VALUES (50, 58, 'Male', 'Professional');
INSERT INTO Dim_Demographics (RiderID, Age, Gender, Occupation) VALUES (51, 32, 'Male', 'Other');
INSERT INTO Dim_Demographics (RiderID, Age, Gender, Occupation) VALUES (52, 65, 'Male', 'Unemployed');
INSERT INTO Dim_Demographics (RiderID, Age, Gender, Occupation) VALUES (53, 16, 'Male', 'Self-Employed');
INSERT INTO Dim_Demographics (RiderID, Age, Gender, Occupation) VALUES (54, 69, 'Male', 'Professional');
INSERT INTO Dim_Demographics (RiderID, Age, Gender, Occupation) VALUES (55, 29, 'Male', 'Professional');
INSERT INTO Dim_Demographics (RiderID, Age, Gender, Occupation) VALUES (56, 65, 'Female', 'Other');
INSERT INTO Dim_Demographics (RiderID, Age, Gender, Occupation) VALUES (57, 19, 'Female', 'Other');
INSERT INTO Dim_Demographics (RiderID, Age, Gender, Occupation) VALUES (58, 43, 'Other', 'Self-Employed');
INSERT INTO Dim_Demographics (RiderID, Age, Gender, Occupation) VALUES (59, 21, 'Male', 'Professional');
INSERT INTO Dim_Demographics (RiderID, Age, Gender, Occupation) VALUES (60, 16, 'Male', 'Self-Employed');
INSERT INTO Dim_Demographics (RiderID, Age, Gender, Occupation) VALUES (61, 40, 'Male', 'Other');
INSERT INTO Dim_Demographics (RiderID, Age, Gender, Occupation) VALUES (62, 31, 'Male', 'Other');
INSERT INTO Dim_Demographics (RiderID, Age, Gender, Occupation) VALUES (63, 52, 'Male', 'Retired');
INSERT INTO Dim_Demographics (RiderID, Age, Gender, Occupation) VALUES (64, 32, 'Male', 'Other');
INSERT INTO Dim_Demographics (RiderID, Age, Gender, Occupation) VALUES (65, 19, 'Male', 'Unemployed');
INSERT INTO Dim_Demographics (RiderID, Age, Gender, Occupation) VALUES (66, 55, 'Male', 'Self-Employed');
INSERT INTO Dim_Demographics (RiderID, Age, Gender, Occupation) VALUES (67, 45, 'Male', 'Professional');
INSERT INTO Dim_Demographics (RiderID, Age, Gender, Occupation) VALUES (68, 61, 'Male', 'Self-Employed');
INSERT INTO Dim_Demographics (RiderID, Age, Gender, Occupation) VALUES (69, 46, 'Male', 'Student');
INSERT INTO Dim_Demographics (RiderID, Age, Gender, Occupation) VALUES (70, 41, 'Male', 'Self-Employed');
INSERT INTO Dim_Demographics (RiderID, Age, Gender, Occupation) VALUES (71, 50, 'Male', 'Professional');
INSERT INTO Dim_Demographics (RiderID, Age, Gender, Occupation) VALUES (72, 36, 'Female', 'Retired');
INSERT INTO Dim_Demographics (RiderID, Age, Gender, Occupation) VALUES (73, 16, 'Female', 'Unemployed');
INSERT INTO Dim_Demographics (RiderID, Age, Gender, Occupation) VALUES (74, 22, 'Male', 'Professional');
INSERT INTO Dim_Demographics (RiderID, Age, Gender, Occupation) VALUES (75, 22, 'Other', 'Student');
INSERT INTO Dim_Demographics (RiderID, Age, Gender, Occupation) VALUES (76, 70, 'Male', 'Self-Employed');
INSERT INTO Dim_Demographics (RiderID, Age, Gender, Occupation) VALUES (77, 67, 'Female', 'Other');
INSERT INTO Dim_Demographics (RiderID, Age, Gender, Occupation) VALUES (78, 40, 'Other', 'Professional');
INSERT INTO Dim_Demographics (RiderID, Age, Gender, Occupation) VALUES (79, 33, 'Female', 'Self-Employed');
INSERT INTO Dim_Demographics (RiderID, Age, Gender, Occupation) VALUES (80, 20, 'Female', 'Unemployed');
INSERT INTO Dim_Demographics (RiderID, Age, Gender, Occupation) VALUES (81, 64, 'Male', 'Professional');
INSERT INTO Dim_Demographics (RiderID, Age, Gender, Occupation) VALUES (82, 61, 'Other', 'Student');
INSERT INTO Dim_Demographics (RiderID, Age, Gender, Occupation) VALUES (83, 50, 'Female', 'Student');
INSERT INTO Dim_Demographics (RiderID, Age, Gender, Occupation) VALUES (84, 21, 'Male', 'Unemployed');
INSERT INTO Dim_Demographics (RiderID, Age, Gender, Occupation) VALUES (85, 39, 'Male', 'Unemployed');
INSERT INTO Dim_Demographics (RiderID, Age, Gender, Occupation) VALUES (86, 28, 'Other', 'Other');
INSERT INTO Dim_Demographics (RiderID, Age, Gender, Occupation) VALUES (87, 51, 'Other', 'Retired');
INSERT INTO Dim_Demographics (RiderID, Age, Gender, Occupation) VALUES (88, 38, 'Male', 'Professional');
INSERT INTO Dim_Demographics (RiderID, Age, Gender, Occupation) VALUES (89, 62, 'Female', 'Other');
INSERT INTO Dim_Demographics (RiderID, Age, Gender, Occupation) VALUES (90, 55, 'Male', 'Student');
INSERT INTO Dim_Demographics (RiderID, Age, Gender, Occupation) VALUES (91, 46, 'Female', 'Professional');
INSERT INTO Dim_Demographics (RiderID, Age, Gender, Occupation) VALUES (92, 28, 'Female', 'Self-Employed');
INSERT INTO Dim_Demographics (RiderID, Age, Gender, Occupation) VALUES (93, 37, 'Male', 'Other');
INSERT INTO Dim_Demographics (RiderID, Age, Gender, Occupation) VALUES (94, 21, 'Other', 'Other');
INSERT INTO Dim_Demographics (RiderID, Age, Gender, Occupation) VALUES (95, 46, 'Other', 'Other');
INSERT INTO Dim_Demographics (RiderID, Age, Gender, Occupation) VALUES (96, 37, 'Male', 'Self-Employed');
INSERT INTO Dim_Demographics (RiderID, Age, Gender, Occupation) VALUES (97, 53, 'Female', 'Other');
INSERT INTO Dim_Demographics (RiderID, Age, Gender, Occupation) VALUES (98, 19, 'Other', 'Other');
INSERT INTO Dim_Demographics (RiderID, Age, Gender, Occupation) VALUES (99, 61, 'Male', 'Self-Employed');
INSERT INTO Dim_Demographics (RiderID, Age, Gender, Occupation) VALUES (100, 54, 'Female', 'Unemployed');

-- Fact_Ridership
INSERT INTO Fact_Ridership (RecordID, BusID, RideDate, RideTime, NumberOfRiders, RiderID) VALUES (1, 18, '2023-12-17', '05:00 PM', 34, 1);
INSERT INTO Fact_Ridership (RecordID, BusID, RideDate, RideTime, NumberOfRiders, RiderID) VALUES (2, 40, '2023-12-31', '09:41 AM', 40, 2);
INSERT INTO Fact_Ridership (RecordID, BusID, RideDate, RideTime, NumberOfRiders, RiderID) VALUES (3, 10, '2024-01-05', '03:57 PM', 40, 3);
INSERT INTO Fact_Ridership (RecordID, BusID, RideDate, RideTime, NumberOfRiders, RiderID) VALUES (4, 26, '2023-12-11', '11:40 PM', 18, 4);
INSERT INTO Fact_Ridership (RecordID, BusID, RideDate, RideTime, NumberOfRiders, RiderID) VALUES (5, 27, '2023-12-20', '09:04 PM', 48, 5);
INSERT INTO Fact_Ridership (RecordID, BusID, RideDate, RideTime, NumberOfRiders, RiderID) VALUES (6, 15, '2023-12-10', '07:26 PM', 25, 6);
INSERT INTO Fact_Ridership (RecordID, BusID, RideDate, RideTime, NumberOfRiders, RiderID) VALUES (7, 8, '2023-12-28', '01:50 PM', 45, 7);
INSERT INTO Fact_Ridership (RecordID, BusID, RideDate, RideTime, NumberOfRiders, RiderID) VALUES (8, 20, '2023-12-31', '01:42 PM', 59, 8);
INSERT INTO Fact_Ridership (RecordID, BusID, RideDate, RideTime, NumberOfRiders, RiderID) VALUES (9, 11, '2023-12-19', '05:56 PM', 36, 9);
INSERT INTO Fact_Ridership (RecordID, BusID, RideDate, RideTime, NumberOfRiders, RiderID) VALUES (10, 16, '2023-12-31', '08:29 PM', 20, 10);
INSERT INTO Fact_Ridership (RecordID, BusID, RideDate, RideTime, NumberOfRiders, RiderID) VALUES (11, 32, '2023-12-29', '08:45 PM', 46, 11);
INSERT INTO Fact_Ridership (RecordID, BusID, RideDate, RideTime, NumberOfRiders, RiderID) VALUES (12, 17, '2023-12-18', '10:23 AM', 46, 12);
INSERT INTO Fact_Ridership (RecordID, BusID, RideDate, RideTime, NumberOfRiders, RiderID) VALUES (13, 37, '2023-12-16', '07:25 AM', 30, 13);
INSERT INTO Fact_Ridership (RecordID, BusID, RideDate, RideTime, NumberOfRiders, RiderID) VALUES (14, 3, '2023-12-26', '01:37 PM', 19, 14);
INSERT INTO Fact_Ridership (RecordID, BusID, RideDate, RideTime, NumberOfRiders, RiderID) VALUES (15, 13, '2023-12-31', '10:31 AM', 33, 15);
INSERT INTO Fact_Ridership (RecordID, BusID, RideDate, RideTime, NumberOfRiders, RiderID) VALUES (16, 40, '2023-12-15', '07:36 AM', 32, 16);
INSERT INTO Fact_Ridership (RecordID, BusID, RideDate, RideTime, NumberOfRiders, RiderID) VALUES (17, 32, '2023-12-12', '06:33 AM', 42, 17);
INSERT INTO Fact_Ridership (RecordID, BusID, RideDate, RideTime, NumberOfRiders, RiderID) VALUES (18, 2, '2023-12-28', '08:45 PM', 19, 18);
INSERT INTO Fact_Ridership (RecordID, BusID, RideDate, RideTime, NumberOfRiders, RiderID) VALUES (19, 27, '2023-12-07', '12:56 PM', 60, 19);
INSERT INTO Fact_Ridership (RecordID, BusID, RideDate, RideTime, NumberOfRiders, RiderID) VALUES (20, 18, '2023-12-16', '12:31 PM', 29, 20);
INSERT INTO Fact_Ridership (RecordID, BusID, RideDate, RideTime, NumberOfRiders, RiderID) VALUES (21, 22, '2023-12-07', '11:24 PM', 30, 21);
INSERT INTO Fact_Ridership (RecordID, BusID, RideDate, RideTime, NumberOfRiders, RiderID) VALUES (22, 10, '2023-12-13', '07:39 AM', 35, 22);
INSERT INTO Fact_Ridership (RecordID, BusID, RideDate, RideTime, NumberOfRiders, RiderID) VALUES (23, 7, '2023-12-16', '07:53 AM', 53, 23);
INSERT INTO Fact_Ridership (RecordID, BusID, RideDate, RideTime, NumberOfRiders, RiderID) VALUES (24, 14, '2024-01-03', '02:43 PM', 24, 24);
INSERT INTO Fact_Ridership (RecordID, BusID, RideDate, RideTime, NumberOfRiders, RiderID) VALUES (25, 31, '2023-12-17', '04:40 PM', 44, 25);
INSERT INTO Fact_Ridership (RecordID, BusID, RideDate, RideTime, NumberOfRiders, RiderID) VALUES (26, 30, '2023-12-11', '10:52 AM', 23, 26);
INSERT INTO Fact_Ridership (RecordID, BusID, RideDate, RideTime, NumberOfRiders, RiderID) VALUES (27, 33, '2023-12-14', '03:17 PM', 37, 27);
INSERT INTO Fact_Ridership (RecordID, BusID, RideDate, RideTime, NumberOfRiders, RiderID) VALUES (28, 4, '2023-12-22', '02:13 PM', 16, 28);
INSERT INTO Fact_Ridership (RecordID, BusID, RideDate, RideTime, NumberOfRiders, RiderID) VALUES (29, 33, '2023-12-27', '12:38 PM', 46, 29);
INSERT INTO Fact_Ridership (RecordID, BusID, RideDate, RideTime, NumberOfRiders, RiderID) VALUES (30, 2, '2023-12-29', '02:06 PM', 16, 30);
INSERT INTO Fact_Ridership (RecordID, BusID, RideDate, RideTime, NumberOfRiders, RiderID) VALUES (31, 33, '2024-01-06', '09:59 AM', 25, 31);
INSERT INTO Fact_Ridership (RecordID, BusID, RideDate, RideTime, NumberOfRiders, RiderID) VALUES (32, 38, '2023-12-31', '10:27 AM', 40, 32);
INSERT INTO Fact_Ridership (RecordID, BusID, RideDate, RideTime, NumberOfRiders, RiderID) VALUES (33, 17, '2023-12-10', '08:41 AM', 47, 33);
INSERT INTO Fact_Ridership (RecordID, BusID, RideDate, RideTime, NumberOfRiders, RiderID) VALUES (34, 10, '2023-12-23', '09:37 PM', 16, 34);
INSERT INTO Fact_Ridership (RecordID, BusID, RideDate, RideTime, NumberOfRiders, RiderID) VALUES (35, 28, '2023-12-14', '11:52 AM', 23, 35);
INSERT INTO Fact_Ridership (RecordID, BusID, RideDate, RideTime, NumberOfRiders, RiderID) VALUES (36, 35, '2024-01-03', '02:05 PM', 25, 36);
INSERT INTO Fact_Ridership (RecordID, BusID, RideDate, RideTime, NumberOfRiders, RiderID) VALUES (37, 38, '2024-01-03', '08:22 PM', 30, 37);
INSERT INTO Fact_Ridership (RecordID, BusID, RideDate, RideTime, NumberOfRiders, RiderID) VALUES (38, 6, '2023-12-10', '04:50 PM', 29, 38);
INSERT INTO Fact_Ridership (RecordID, BusID, RideDate, RideTime, NumberOfRiders, RiderID) VALUES (39, 22, '2023-12-10', '03:29 PM', 23, 39);
INSERT INTO Fact_Ridership (RecordID, BusID, RideDate, RideTime, NumberOfRiders, RiderID) VALUES (40, 5, '2023-12-16', '03:25 PM', 36, 40);
INSERT INTO Fact_Ridership (RecordID, BusID, RideDate, RideTime, NumberOfRiders, RiderID) VALUES (41, 10, '2023-12-11', '01:01 PM', 19, 41);
INSERT INTO Fact_Ridership (RecordID, BusID, RideDate, RideTime, NumberOfRiders, RiderID) VALUES (42, 3, '2023-12-12', '04:55 PM', 52, 42);
INSERT INTO Fact_Ridership (RecordID, BusID, RideDate, RideTime, NumberOfRiders, RiderID) VALUES (43, 28, '2023-12-29', '01:34 PM', 56, 43);
INSERT INTO Fact_Ridership (RecordID, BusID, RideDate, RideTime, NumberOfRiders, RiderID) VALUES (44, 26, '2023-12-26', '02:47 PM', 39, 44);
INSERT INTO Fact_Ridership (RecordID, BusID, RideDate, RideTime, NumberOfRiders, RiderID) VALUES (45, 20, '2023-12-27', '09:06 PM', 34, 45);
INSERT INTO Fact_Ridership (RecordID, BusID, RideDate, RideTime, NumberOfRiders, RiderID) VALUES (46, 14, '2023-12-31', '10:15 AM', 16, 46);
INSERT INTO Fact_Ridership (RecordID, BusID, RideDate, RideTime, NumberOfRiders, RiderID) VALUES (47, 24, '2023-12-24', '05:48 PM', 46, 47);
INSERT INTO Fact_Ridership (RecordID, BusID, RideDate, RideTime, NumberOfRiders, RiderID) VALUES (48, 27, '2023-12-11', '09:45 AM', 47, 48);
INSERT INTO Fact_Ridership (RecordID, BusID, RideDate, RideTime, NumberOfRiders, RiderID) VALUES (49, 6, '2023-12-22', '11:44 AM', 53, 49);
INSERT INTO Fact_Ridership (RecordID, BusID, RideDate, RideTime, NumberOfRiders, RiderID) VALUES (50, 4, '2023-12-21', '08:10 PM', 22, 50);
INSERT INTO Fact_Ridership (RecordID, BusID, RideDate, RideTime, NumberOfRiders, RiderID) VALUES (51, 10, '2023-12-15', '07:50 PM', 15, 51);
INSERT INTO Fact_Ridership (RecordID, BusID, RideDate, RideTime, NumberOfRiders, RiderID) VALUES (52, 29, '2023-12-25', '12:05 PM', 49, 52);
INSERT INTO Fact_Ridership (RecordID, BusID, RideDate, RideTime, NumberOfRiders, RiderID) VALUES (53, 10, '2023-12-24', '10:58 PM', 28, 53);
INSERT INTO Fact_Ridership (RecordID, BusID, RideDate, RideTime, NumberOfRiders, RiderID) VALUES (54, 9, '2023-12-16', '10:02 AM', 16, 54);
INSERT INTO Fact_Ridership (RecordID, BusID, RideDate, RideTime, NumberOfRiders, RiderID) VALUES (55, 28, '2024-01-02', '05:09 PM', 23, 55);
INSERT INTO Fact_Ridership (RecordID, BusID, RideDate, RideTime, NumberOfRiders, RiderID) VALUES (56, 20, '2023-12-25', '08:02 PM', 39, 56);
INSERT INTO Fact_Ridership (RecordID, BusID, RideDate, RideTime, NumberOfRiders, RiderID) VALUES (57, 34, '2023-12-20', '08:49 AM', 26, 57);
INSERT INTO Fact_Ridership (RecordID, BusID, RideDate, RideTime, NumberOfRiders, RiderID) VALUES (58, 12, '2024-01-04', '07:23 AM', 18, 58);
INSERT INTO Fact_Ridership (RecordID, BusID, RideDate, RideTime, NumberOfRiders, RiderID) VALUES (59, 30, '2023-12-07', '02:52 PM', 31, 59);
INSERT INTO Fact_Ridership (RecordID, BusID, RideDate, RideTime, NumberOfRiders, RiderID) VALUES (60, 27, '2023-12-15', '04:46 PM', 28, 60);
INSERT INTO Fact_Ridership (RecordID, BusID, RideDate, RideTime, NumberOfRiders, RiderID) VALUES (61, 28, '2023-12-09', '01:06 PM', 29, 61);
INSERT INTO Fact_Ridership (RecordID, BusID, RideDate, RideTime, NumberOfRiders, RiderID) VALUES (62, 4, '2023-12-17', '11:48 AM', 15, 62);
INSERT INTO Fact_Ridership (RecordID, BusID, RideDate, RideTime, NumberOfRiders, RiderID) VALUES (63, 21, '2023-12-12', '10:44 AM', 30, 63);
INSERT INTO Fact_Ridership (RecordID, BusID, RideDate, RideTime, NumberOfRiders, RiderID) VALUES (64, 12, '2023-12-14', '02:10 PM', 41, 64);
INSERT INTO Fact_Ridership (RecordID, BusID, RideDate, RideTime, NumberOfRiders, RiderID) VALUES (65, 4, '2023-12-25', '11:31 AM', 46, 65);
INSERT INTO Fact_Ridership (RecordID, BusID, RideDate, RideTime, NumberOfRiders, RiderID) VALUES (66, 35, '2023-12-17', '08:26 PM', 20, 66);
INSERT INTO Fact_Ridership (RecordID, BusID, RideDate, RideTime, NumberOfRiders, RiderID) VALUES (67, 22, '2023-12-09', '12:47 PM', 42, 67);
INSERT INTO Fact_Ridership (RecordID, BusID, RideDate, RideTime, NumberOfRiders, RiderID) VALUES (68, 30, '2023-12-12', '09:28 AM', 37, 68);
INSERT INTO Fact_Ridership (RecordID, BusID, RideDate, RideTime, NumberOfRiders, RiderID) VALUES (69, 33, '2023-12-28', '01:18 PM', 33, 69);
INSERT INTO Fact_Ridership (RecordID, BusID, RideDate, RideTime, NumberOfRiders, RiderID) VALUES (70, 4, '2024-01-05', '05:30 PM', 24, 70);
INSERT INTO Fact_Ridership (RecordID, BusID, RideDate, RideTime, NumberOfRiders, RiderID) VALUES (71, 9, '2024-01-01', '07:16 AM', 32, 71);
INSERT INTO Fact_Ridership (RecordID, BusID, RideDate, RideTime, NumberOfRiders, RiderID) VALUES (72, 30, '2023-12-17', '10:27 PM', 25, 72);
INSERT INTO Fact_Ridership (RecordID, BusID, RideDate, RideTime, NumberOfRiders, RiderID) VALUES (73, 6, '2023-12-28', '11:55 AM', 24, 73);
INSERT INTO Fact_Ridership (RecordID, BusID, RideDate, RideTime, NumberOfRiders, RiderID) VALUES (74, 1, '2023-12-14', '11:41 AM', 25, 74);
INSERT INTO Fact_Ridership (RecordID, BusID, RideDate, RideTime, NumberOfRiders, RiderID) VALUES (75, 19, '2023-12-31', '08:53 PM', 23, 75);
INSERT INTO Fact_Ridership (RecordID, BusID, RideDate, RideTime, NumberOfRiders, RiderID) VALUES (76, 11, '2023-12-20', '12:40 PM', 26, 76);
INSERT INTO Fact_Ridership (RecordID, BusID, RideDate, RideTime, NumberOfRiders, RiderID) VALUES (77, 25, '2023-12-23', '08:06 PM', 32, 77);
INSERT INTO Fact_Ridership (RecordID, BusID, RideDate, RideTime, NumberOfRiders, RiderID) VALUES (78, 16, '2023-12-09', '08:07 PM', 26, 78);
INSERT INTO Fact_Ridership (RecordID, BusID, RideDate, RideTime, NumberOfRiders, RiderID) VALUES (79, 4, '2023-12-20', '10:58 AM', 35, 79);
INSERT INTO Fact_Ridership (RecordID, BusID, RideDate, RideTime, NumberOfRiders, RiderID) VALUES (80, 37, '2024-01-03', '04:49 PM', 16, 80);
INSERT INTO Fact_Ridership (RecordID, BusID, RideDate, RideTime, NumberOfRiders, RiderID) VALUES (81, 17, '2023-12-25', '10:06 AM', 38, 81);
INSERT INTO Fact_Ridership (RecordID, BusID, RideDate, RideTime, NumberOfRiders, RiderID) VALUES (82, 12, '2023-12-12', '10:24 PM', 38, 82);
INSERT INTO Fact_Ridership (RecordID, BusID, RideDate, RideTime, NumberOfRiders, RiderID) VALUES (83, 13, '2023-12-22', '10:19 AM', 26, 83);
INSERT INTO Fact_Ridership (RecordID, BusID, RideDate, RideTime, NumberOfRiders, RiderID) VALUES (84, 8, '2023-12-18', '07:43 AM', 25, 84);
INSERT INTO Fact_Ridership (RecordID, BusID, RideDate, RideTime, NumberOfRiders, RiderID) VALUES (85, 17, '2023-12-20', '07:26 PM', 21, 85);
INSERT INTO Fact_Ridership (RecordID, BusID, RideDate, RideTime, NumberOfRiders, RiderID) VALUES (86, 38, '2024-01-05', '11:33 PM', 25, 86);
INSERT INTO Fact_Ridership (RecordID, BusID, RideDate, RideTime, NumberOfRiders, RiderID) VALUES (87, 20, '2023-12-12', '08:50 AM', 60, 87);
INSERT INTO Fact_Ridership (RecordID, BusID, RideDate, RideTime, NumberOfRiders, RiderID) VALUES (88, 33, '2023-12-31', '06:00 PM', 30, 88);
INSERT INTO Fact_Ridership (RecordID, BusID, RideDate, RideTime, NumberOfRiders, RiderID) VALUES (89, 18, '2023-12-07', '04:49 PM', 27, 89);
INSERT INTO Fact_Ridership (RecordID, BusID, RideDate, RideTime, NumberOfRiders, RiderID) VALUES (90, 27, '2023-12-19', '07:29 PM', 28, 90);
INSERT INTO Fact_Ridership (RecordID, BusID, RideDate, RideTime, NumberOfRiders, RiderID) VALUES (91, 23, '2024-01-02', '01:27 PM', 48, 91);
INSERT INTO Fact_Ridership (RecordID, BusID, RideDate, RideTime, NumberOfRiders, RiderID) VALUES (92, 18, '2023-12-31', '08:33 AM', 34, 92);
INSERT INTO Fact_Ridership (RecordID, BusID, RideDate, RideTime, NumberOfRiders, RiderID) VALUES (93, 24, '2023-12-13', '05:47 PM', 35, 93);
INSERT INTO Fact_Ridership (RecordID, BusID, RideDate, RideTime, NumberOfRiders, RiderID) VALUES (94, 9, '2023-12-14', '03:56 PM', 30, 94);
INSERT INTO Fact_Ridership (RecordID, BusID, RideDate, RideTime, NumberOfRiders, RiderID) VALUES (95, 30, '2023-12-24', '08:14 AM', 40, 95);
INSERT INTO Fact_Ridership (RecordID, BusID, RideDate, RideTime, NumberOfRiders, RiderID) VALUES (96, 28, '2023-12-14', '06:40 PM', 43, 96);
INSERT INTO Fact_Ridership (RecordID, BusID, RideDate, RideTime, NumberOfRiders, RiderID) VALUES (97, 30, '2024-01-01', '10:48 PM', 29, 97);
INSERT INTO Fact_Ridership (RecordID, BusID, RideDate, RideTime, NumberOfRiders, RiderID) VALUES (98, 15, '2023-12-08', '08:44 PM', 45, 98);
INSERT INTO Fact_Ridership (RecordID, BusID, RideDate, RideTime, NumberOfRiders, RiderID) VALUES (99, 10, '2023-12-10', '02:47 PM', 30, 99);
INSERT INTO Fact_Ridership (RecordID, BusID, RideDate, RideTime, NumberOfRiders, RiderID) VALUES (100, 4, '2023-12-26', '12:34 PM', 15, 100);
INSERT INTO Fact_Ridership (RecordID, BusID, RideDate, RideTime, NumberOfRiders, RiderID) VALUES (101, 25, '2023-12-26', '09:21 AM', 18, 1);
INSERT INTO Fact_Ridership (RecordID, BusID, RideDate, RideTime, NumberOfRiders, RiderID) VALUES (102, 20, '2023-12-14', '10:18 AM', 29, 2);
INSERT INTO Fact_Ridership (RecordID, BusID, RideDate, RideTime, NumberOfRiders, RiderID) VALUES (103, 25, '2023-12-23', '02:54 PM', 29, 3);
INSERT INTO Fact_Ridership (RecordID, BusID, RideDate, RideTime, NumberOfRiders, RiderID) VALUES (104, 9, '2023-12-19', '06:46 PM', 34, 4);
INSERT INTO Fact_Ridership (RecordID, BusID, RideDate, RideTime, NumberOfRiders, RiderID) VALUES (105, 38, '2023-12-08', '06:53 AM', 33, 5);
INSERT INTO Fact_Ridership (RecordID, BusID, RideDate, RideTime, NumberOfRiders, RiderID) VALUES (106, 39, '2023-12-13', '12:54 PM', 27, 6);
INSERT INTO Fact_Ridership (RecordID, BusID, RideDate, RideTime, NumberOfRiders, RiderID) VALUES (107, 37, '2023-12-12', '01:59 PM', 50, 7);
INSERT INTO Fact_Ridership (RecordID, BusID, RideDate, RideTime, NumberOfRiders, RiderID) VALUES (108, 38, '2023-12-17', '12:24 PM', 25, 8);
INSERT INTO Fact_Ridership (RecordID, BusID, RideDate, RideTime, NumberOfRiders, RiderID) VALUES (109, 22, '2023-12-22', '05:12 PM', 38, 9);
INSERT INTO Fact_Ridership (RecordID, BusID, RideDate, RideTime, NumberOfRiders, RiderID) VALUES (110, 10, '2023-12-13', '10:23 PM', 26, 10);
INSERT INTO Fact_Ridership (RecordID, BusID, RideDate, RideTime, NumberOfRiders, RiderID) VALUES (111, 1, '2023-12-11', '06:36 PM', 45, 11);
INSERT INTO Fact_Ridership (RecordID, BusID, RideDate, RideTime, NumberOfRiders, RiderID) VALUES (112, 19, '2023-12-27', '07:37 AM', 46, 12);
INSERT INTO Fact_Ridership (RecordID, BusID, RideDate, RideTime, NumberOfRiders, RiderID) VALUES (113, 33, '2023-12-25', '03:38 PM', 21, 13);
INSERT INTO Fact_Ridership (RecordID, BusID, RideDate, RideTime, NumberOfRiders, RiderID) VALUES (114, 7, '2023-12-30', '09:56 PM', 41, 14);
INSERT INTO Fact_Ridership (RecordID, BusID, RideDate, RideTime, NumberOfRiders, RiderID) VALUES (115, 31, '2023-12-26', '06:08 AM', 24, 15);
INSERT INTO Fact_Ridership (RecordID, BusID, RideDate, RideTime, NumberOfRiders, RiderID) VALUES (116, 2, '2023-12-30', '10:57 AM', 42, 16);
INSERT INTO Fact_Ridership (RecordID, BusID, RideDate, RideTime, NumberOfRiders, RiderID) VALUES (117, 37, '2023-12-07', '03:30 PM', 15, 17);
INSERT INTO Fact_Ridership (RecordID, BusID, RideDate, RideTime, NumberOfRiders, RiderID) VALUES (118, 37, '2023-12-18', '11:22 AM', 29, 18);
INSERT INTO Fact_Ridership (RecordID, BusID, RideDate, RideTime, NumberOfRiders, RiderID) VALUES (119, 27, '2024-01-03', '09:57 AM', 25, 19);
INSERT INTO Fact_Ridership (RecordID, BusID, RideDate, RideTime, NumberOfRiders, RiderID) VALUES (120, 1, '2023-12-14', '09:13 PM', 29, 20);
INSERT INTO Fact_Ridership (RecordID, BusID, RideDate, RideTime, NumberOfRiders, RiderID) VALUES (121, 4, '2023-12-27', '11:01 AM', 29, 21);
INSERT INTO Fact_Ridership (RecordID, BusID, RideDate, RideTime, NumberOfRiders, RiderID) VALUES (122, 34, '2023-12-28', '10:38 PM', 20, 22);
INSERT INTO Fact_Ridership (RecordID, BusID, RideDate, RideTime, NumberOfRiders, RiderID) VALUES (123, 12, '2023-12-27', '06:43 PM', 52, 23);
INSERT INTO Fact_Ridership (RecordID, BusID, RideDate, RideTime, NumberOfRiders, RiderID) VALUES (124, 27, '2023-12-11', '10:26 PM', 40, 24);
INSERT INTO Fact_Ridership (RecordID, BusID, RideDate, RideTime, NumberOfRiders, RiderID) VALUES (125, 21, '2023-12-08', '02:06 PM', 38, 25);
INSERT INTO Fact_Ridership (RecordID, BusID, RideDate, RideTime, NumberOfRiders, RiderID) VALUES (126, 37, '2023-12-10', '06:40 PM', 31, 26);
INSERT INTO Fact_Ridership (RecordID, BusID, RideDate, RideTime, NumberOfRiders, RiderID) VALUES (127, 28, '2023-12-11', '08:25 PM', 22, 27);
INSERT INTO Fact_Ridership (RecordID, BusID, RideDate, RideTime, NumberOfRiders, RiderID) VALUES (128, 16, '2023-12-07', '10:10 PM', 48, 28);
INSERT INTO Fact_Ridership (RecordID, BusID, RideDate, RideTime, NumberOfRiders, RiderID) VALUES (129, 36, '2023-12-30', '08:52 PM', 47, 29);
INSERT INTO Fact_Ridership (RecordID, BusID, RideDate, RideTime, NumberOfRiders, RiderID) VALUES (130, 11, '2024-01-02', '02:29 PM', 37, 30);
INSERT INTO Fact_Ridership (RecordID, BusID, RideDate, RideTime, NumberOfRiders, RiderID) VALUES (131, 23, '2023-12-11', '08:38 AM', 26, 31);
INSERT INTO Fact_Ridership (RecordID, BusID, RideDate, RideTime, NumberOfRiders, RiderID) VALUES (132, 9, '2024-01-02', '09:23 PM', 25, 32);
INSERT INTO Fact_Ridership (RecordID, BusID, RideDate, RideTime, NumberOfRiders, RiderID) VALUES (133, 21, '2023-12-15', '05:08 PM', 31, 33);
INSERT INTO Fact_Ridership (RecordID, BusID, RideDate, RideTime, NumberOfRiders, RiderID) VALUES (134, 17, '2023-12-19', '06:00 PM', 24, 34);
INSERT INTO Fact_Ridership (RecordID, BusID, RideDate, RideTime, NumberOfRiders, RiderID) VALUES (135, 22, '2024-01-06', '09:18 PM', 36, 35);
INSERT INTO Fact_Ridership (RecordID, BusID, RideDate, RideTime, NumberOfRiders, RiderID) VALUES (136, 3, '2024-01-04', '03:04 PM', 41, 36);
INSERT INTO Fact_Ridership (RecordID, BusID, RideDate, RideTime, NumberOfRiders, RiderID) VALUES (137, 15, '2023-12-22', '12:15 PM', 40, 37);
INSERT INTO Fact_Ridership (RecordID, BusID, RideDate, RideTime, NumberOfRiders, RiderID) VALUES (138, 21, '2023-12-11', '08:49 PM', 35, 38);
INSERT INTO Fact_Ridership (RecordID, BusID, RideDate, RideTime, NumberOfRiders, RiderID) VALUES (139, 20, '2023-12-25', '02:22 PM', 21, 39);
INSERT INTO Fact_Ridership (RecordID, BusID, RideDate, RideTime, NumberOfRiders, RiderID) VALUES (140, 35, '2023-12-17', '10:12 PM', 27, 40);
INSERT INTO Fact_Ridership (RecordID, BusID, RideDate, RideTime, NumberOfRiders, RiderID) VALUES (141, 38, '2023-12-28', '11:45 PM', 45, 41);
INSERT INTO Fact_Ridership (RecordID, BusID, RideDate, RideTime, NumberOfRiders, RiderID) VALUES (142, 24, '2023-12-24', '06:25 AM', 47, 42);
INSERT INTO Fact_Ridership (RecordID, BusID, RideDate, RideTime, NumberOfRiders, RiderID) VALUES (143, 38, '2023-12-11', '07:48 PM', 28, 43);
INSERT INTO Fact_Ridership (RecordID, BusID, RideDate, RideTime, NumberOfRiders, RiderID) VALUES (144, 5, '2023-12-09', '09:54 PM', 47, 44);
INSERT INTO Fact_Ridership (RecordID, BusID, RideDate, RideTime, NumberOfRiders, RiderID) VALUES (145, 23, '2023-12-27', '08:38 AM', 22, 45);
INSERT INTO Fact_Ridership (RecordID, BusID, RideDate, RideTime, NumberOfRiders, RiderID) VALUES (146, 35, '2024-01-02', '09:50 PM', 48, 46);
INSERT INTO Fact_Ridership (RecordID, BusID, RideDate, RideTime, NumberOfRiders, RiderID) VALUES (147, 3, '2023-12-28', '09:48 AM', 22, 47);
INSERT INTO Fact_Ridership (RecordID, BusID, RideDate, RideTime, NumberOfRiders, RiderID) VALUES (148, 4, '2023-12-13', '08:02 AM', 38, 48);
INSERT INTO Fact_Ridership (RecordID, BusID, RideDate, RideTime, NumberOfRiders, RiderID) VALUES (149, 8, '2024-01-02', '03:38 PM', 42, 49);
INSERT INTO Fact_Ridership (RecordID, BusID, RideDate, RideTime, NumberOfRiders, RiderID) VALUES (150, 28, '2023-12-30', '11:41 AM', 40, 50);
INSERT INTO Fact_Ridership (RecordID, BusID, RideDate, RideTime, NumberOfRiders, RiderID) VALUES (151, 28, '2023-12-16', '01:52 PM', 23, 51);
INSERT INTO Fact_Ridership (RecordID, BusID, RideDate, RideTime, NumberOfRiders, RiderID) VALUES (152, 3, '2023-12-24', '05:07 PM', 39, 52);
INSERT INTO Fact_Ridership (RecordID, BusID, RideDate, RideTime, NumberOfRiders, RiderID) VALUES (153, 33, '2023-12-10', '02:46 PM', 47, 53);
INSERT INTO Fact_Ridership (RecordID, BusID, RideDate, RideTime, NumberOfRiders, RiderID) VALUES (154, 25, '2024-01-02', '11:01 AM', 27, 54);
INSERT INTO Fact_Ridership (RecordID, BusID, RideDate, RideTime, NumberOfRiders, RiderID) VALUES (155, 31, '2023-12-27', '10:19 AM', 45, 55);
INSERT INTO Fact_Ridership (RecordID, BusID, RideDate, RideTime, NumberOfRiders, RiderID) VALUES (156, 37, '2024-01-03', '11:23 AM', 27, 56);
INSERT INTO Fact_Ridership (RecordID, BusID, RideDate, RideTime, NumberOfRiders, RiderID) VALUES (157, 38, '2023-12-10', '08:19 AM', 37, 57);
INSERT INTO Fact_Ridership (RecordID, BusID, RideDate, RideTime, NumberOfRiders, RiderID) VALUES (158, 29, '2023-12-08', '09:08 AM', 30, 58);
INSERT INTO Fact_Ridership (RecordID, BusID, RideDate, RideTime, NumberOfRiders, RiderID) VALUES (159, 23, '2023-12-17', '10:28 AM', 22, 59);
INSERT INTO Fact_Ridership (RecordID, BusID, RideDate, RideTime, NumberOfRiders, RiderID) VALUES (160, 5, '2023-12-19', '09:31 AM', 24, 60);
INSERT INTO Fact_Ridership (RecordID, BusID, RideDate, RideTime, NumberOfRiders, RiderID) VALUES (161, 10, '2024-01-02', '10:14 AM', 53, 61);
INSERT INTO Fact_Ridership (RecordID, BusID, RideDate, RideTime, NumberOfRiders, RiderID) VALUES (162, 39, '2023-12-20', '11:42 AM', 30, 62);
INSERT INTO Fact_Ridership (RecordID, BusID, RideDate, RideTime, NumberOfRiders, RiderID) VALUES (163, 36, '2023-12-09', '07:08 AM', 37, 63);
INSERT INTO Fact_Ridership (RecordID, BusID, RideDate, RideTime, NumberOfRiders, RiderID) VALUES (164, 34, '2023-12-25', '11:48 PM', 59, 64);
INSERT INTO Fact_Ridership (RecordID, BusID, RideDate, RideTime, NumberOfRiders, RiderID) VALUES (165, 14, '2023-12-18', '11:46 PM', 32, 65);
INSERT INTO Fact_Ridership (RecordID, BusID, RideDate, RideTime, NumberOfRiders, RiderID) VALUES (166, 25, '2023-12-17', '10:06 PM', 37, 66);
INSERT INTO Fact_Ridership (RecordID, BusID, RideDate, RideTime, NumberOfRiders, RiderID) VALUES (167, 2, '2023-12-29', '12:23 PM', 29, 67);
INSERT INTO Fact_Ridership (RecordID, BusID, RideDate, RideTime, NumberOfRiders, RiderID) VALUES (168, 25, '2023-12-29', '06:52 PM', 27, 68);
INSERT INTO Fact_Ridership (RecordID, BusID, RideDate, RideTime, NumberOfRiders, RiderID) VALUES (169, 7, '2023-12-14', '06:15 PM', 23, 69);
INSERT INTO Fact_Ridership (RecordID, BusID, RideDate, RideTime, NumberOfRiders, RiderID) VALUES (170, 7, '2023-12-10', '11:40 PM', 22, 70);
INSERT INTO Fact_Ridership (RecordID, BusID, RideDate, RideTime, NumberOfRiders, RiderID) VALUES (171, 7, '2023-12-24', '01:28 PM', 30, 71);
INSERT INTO Fact_Ridership (RecordID, BusID, RideDate, RideTime, NumberOfRiders, RiderID) VALUES (172, 11, '2023-12-18', '06:08 AM', 35, 72);
INSERT INTO Fact_Ridership (RecordID, BusID, RideDate, RideTime, NumberOfRiders, RiderID) VALUES (173, 3, '2023-12-30', '11:41 PM', 43, 73);
INSERT INTO Fact_Ridership (RecordID, BusID, RideDate, RideTime, NumberOfRiders, RiderID) VALUES (174, 37, '2023-12-15', '09:03 PM', 18, 74);
INSERT INTO Fact_Ridership (RecordID, BusID, RideDate, RideTime, NumberOfRiders, RiderID) VALUES (175, 18, '2023-12-31', '06:50 AM', 25, 75);
INSERT INTO Fact_Ridership (RecordID, BusID, RideDate, RideTime, NumberOfRiders, RiderID) VALUES (176, 13, '2023-12-19', '04:44 PM', 30, 76);
INSERT INTO Fact_Ridership (RecordID, BusID, RideDate, RideTime, NumberOfRiders, RiderID) VALUES (177, 27, '2023-12-26', '11:16 PM', 17, 77);
INSERT INTO Fact_Ridership (RecordID, BusID, RideDate, RideTime, NumberOfRiders, RiderID) VALUES (178, 40, '2023-12-17', '01:21 PM', 38, 78);
INSERT INTO Fact_Ridership (RecordID, BusID, RideDate, RideTime, NumberOfRiders, RiderID) VALUES (179, 7, '2023-12-14', '11:09 AM', 31, 79);
INSERT INTO Fact_Ridership (RecordID, BusID, RideDate, RideTime, NumberOfRiders, RiderID) VALUES (180, 21, '2024-01-01', '03:43 PM', 42, 80);
INSERT INTO Fact_Ridership (RecordID, BusID, RideDate, RideTime, NumberOfRiders, RiderID) VALUES (181, 16, '2023-12-25', '10:10 AM', 36, 81);
INSERT INTO Fact_Ridership (RecordID, BusID, RideDate, RideTime, NumberOfRiders, RiderID) VALUES (182, 2, '2024-01-03', '08:57 PM', 44, 82);
INSERT INTO Fact_Ridership (RecordID, BusID, RideDate, RideTime, NumberOfRiders, RiderID) VALUES (183, 9, '2023-12-11', '08:57 PM', 36, 83);
INSERT INTO Fact_Ridership (RecordID, BusID, RideDate, RideTime, NumberOfRiders, RiderID) VALUES (184, 21, '2023-12-11', '08:16 AM', 42, 84);
INSERT INTO Fact_Ridership (RecordID, BusID, RideDate, RideTime, NumberOfRiders, RiderID) VALUES (185, 4, '2024-01-06', '10:06 PM', 31, 85);
INSERT INTO Fact_Ridership (RecordID, BusID, RideDate, RideTime, NumberOfRiders, RiderID) VALUES (186, 31, '2023-12-11', '02:39 PM', 26, 86);
INSERT INTO Fact_Ridership (RecordID, BusID, RideDate, RideTime, NumberOfRiders, RiderID) VALUES (187, 25, '2023-12-26', '11:14 AM', 27, 87);
INSERT INTO Fact_Ridership (RecordID, BusID, RideDate, RideTime, NumberOfRiders, RiderID) VALUES (188, 28, '2023-12-07', '09:46 AM', 36, 88);
INSERT INTO Fact_Ridership (RecordID, BusID, RideDate, RideTime, NumberOfRiders, RiderID) VALUES (189, 18, '2024-01-02', '06:56 PM', 36, 89);
INSERT INTO Fact_Ridership (RecordID, BusID, RideDate, RideTime, NumberOfRiders, RiderID) VALUES (190, 29, '2023-12-28', '08:45 AM', 22, 90);
INSERT INTO Fact_Ridership (RecordID, BusID, RideDate, RideTime, NumberOfRiders, RiderID) VALUES (191, 18, '2023-12-07', '11:36 PM', 20, 91);
INSERT INTO Fact_Ridership (RecordID, BusID, RideDate, RideTime, NumberOfRiders, RiderID) VALUES (192, 36, '2023-12-18', '06:47 AM', 39, 92);
INSERT INTO Fact_Ridership (RecordID, BusID, RideDate, RideTime, NumberOfRiders, RiderID) VALUES (193, 32, '2024-01-01', '09:40 PM', 60, 93);
INSERT INTO Fact_Ridership (RecordID, BusID, RideDate, RideTime, NumberOfRiders, RiderID) VALUES (194, 31, '2023-12-10', '04:56 PM', 25, 94);
INSERT INTO Fact_Ridership (RecordID, BusID, RideDate, RideTime, NumberOfRiders, RiderID) VALUES (195, 8, '2023-12-17', '11:57 PM', 32, 95);
INSERT INTO Fact_Ridership (RecordID, BusID, RideDate, RideTime, NumberOfRiders, RiderID) VALUES (196, 1, '2023-12-15', '10:26 AM', 30, 96);
INSERT INTO Fact_Ridership (RecordID, BusID, RideDate, RideTime, NumberOfRiders, RiderID) VALUES (197, 29, '2023-12-22', '06:34 AM', 26, 97);
INSERT INTO Fact_Ridership (RecordID, BusID, RideDate, RideTime, NumberOfRiders, RiderID) VALUES (198, 21, '2023-12-09', '09:18 AM', 46, 98);
INSERT INTO Fact_Ridership (RecordID, BusID, RideDate, RideTime, NumberOfRiders, RiderID) VALUES (199, 6, '2023-12-20', '09:06 AM', 22, 99);
INSERT INTO Fact_Ridership (RecordID, BusID, RideDate, RideTime, NumberOfRiders, RiderID) VALUES (200, 4, '2023-12-13', '11:16 PM', 53, 100);



select * from Fact_Ridership;
select * from Dim_Buses
select * from Dim_Demographics
select * from Dim_Routes



ALTER TABLE Fact_Ridership
ADD RideTime_AMPM VARCHAR(11);

UPDATE Fact_Ridership
SET RideTime_AMPM =
       FORMAT(CAST(RideTime AS datetime), 'hh:mm:ss tt');


SELECT COLUMN_NAME
FROM INFORMATION_SCHEMA.COLUMNS
WHERE TABLE_NAME = 'Fact_Ridership';

UPDATE Fact_Ridership
SET RideTime_AMPM =
    FORMAT(CAST(RideTime AS datetime), 'hh:mm:ss tt');


ALTER TABLE Fact_Ridership
ALTER COLUMN RideTime_AMPM VARCHAR(20);


select @@SERVERNAME

ALTER TABLE Dim_Routes
ALTER COLUMN TakeOffTime VARCHAR(11);

UPDATE Dim_Routes
SET TakeOffTime =
       FORMAT(CAST(TakeOffTime AS datetime),'hh:mm:ss tt');


ALTER TABLE Dim_Routes
ALTER COLUMN ArrivalTime VARCHAR(11);

UPDATE Dim_Routes
SET ArrivalTime =
       FORMAT(CAST(ArrivalTime AS datetime),'hh:mm:ss tt');