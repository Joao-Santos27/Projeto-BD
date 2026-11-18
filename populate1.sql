-- Rock in Rio Lisboa 2026 - Sample Dataset
--
-- This dataset uses a combination of real and fictional data.
-- Some festival information, such as event dates, artists, stages,
-- ticket categories and scheduling, was based on publicly available
-- information regarding Rock in Rio Lisboa 2026.
--
-- Personal information, customer records, payment details, sponsorship
-- agreements, staff assignments, capacities and transaction data are
-- fictional and were created exclusively for testing and academic purposes.
--
-- Sources consulted:
-- https://rockinriolisboa.pt/pt/faqs
-- https://www.dn.pt/cultura/rock-in-rio-lisboa-cartaz-completo-dos-palcos-e-horrio-dos-concertos
-- https://rockinrio.prowly.com/462545-e-hoje
-- https://rockinriolisboa.pt/pt/bilhetes



PRAGMA foreign_keys = ON;


-- 01. Organizer
INSERT INTO Organizer (OrganizerID, Name, PhoneNumber, Email) VALUES
    (1, 'Rock World Lisboa', NULL, NULL);

-- 02. Client
INSERT INTO Client (CCNumber, Name, IBAN, NIF, BirthDate, Address, PhoneNumber, Email) VALUES
    ('TEST-CC-001', 'Ana Ribeiro', NULL, 'TEST-NIF-001', '1999-03-12', 'Lisboa', NULL, 'cliente1@example.com'),
    ('TEST-CC-002', 'Miguel Ferreira', NULL, 'TEST-NIF-002', '2001-06-23', 'Porto', NULL, 'cliente2@example.com'),
    ('TEST-CC-003', 'Inês Costa', NULL, 'TEST-NIF-003', '1998-02-07', 'Coimbra', NULL, 'cliente3@example.com'),
    ('TEST-CC-004', 'Rui Martins', NULL, 'TEST-NIF-004', '1995-12-03', 'Braga', NULL, 'cliente4@example.com'),
    ('TEST-CC-005', 'Sara Almeida', NULL, 'TEST-NIF-005', '2002-08-14', 'Aveiro', NULL, 'cliente5@example.com'),
    ('TEST-CC-006', 'João Oliveira', NULL, 'TEST-NIF-006', '1997-09-28', 'Setúbal', NULL, 'cliente6@example.com'),
    ('TEST-CC-007', 'Beatriz Lopes', NULL, 'TEST-NIF-007', '2003-01-19', 'Lisboa', NULL, 'cliente7@example.com'),
    ('TEST-CC-008', 'Pedro Gomes', NULL, 'TEST-NIF-008', '2000-04-11', 'Faro', NULL, 'cliente8@example.com');

-- 03. Sponsors
INSERT INTO Sponsor (Name, PhoneNumber, Email) VALUES
    ('bp', NULL, NULL),
    ('BPI', NULL, NULL),
    ('Coca-Cola', NULL, NULL);

-- 04. Stages
INSERT INTO Stage (StageID, Name, Capacity) VALUES
    (1, 'Palco Mundo', 80000),
    (2, 'Palco Music Valley', 15000),
    (3, 'Palco Super Bock', 12000),
    (4, 'BacanaPlay Digital Stage', 6000);

-- 05. Staff members
INSERT INTO StaffMember (StaffID, Name, PhoneNumber, Email) VALUES
    (1, 'Marta Silva', NULL, 'staff1@example.com'),
    (2, 'Tiago Costa', NULL, 'staff2@example.com'),
    (3, 'Filipa Sousa', NULL, 'staff3@example.com'),
    (4, 'Daniel Oliveira', NULL, 'staff4@example.com'),
    (5, 'Leonor Pinto', NULL, 'staff5@example.com'),
    (6, 'Bruno Almeida', NULL, 'staff6@example.com');

-- 06. Tasks 
INSERT INTO Task (Name) VALUES
    ('Access control'),
    ('Sound check'),
    ('Stage setup'),
    ('Crowd management'),
    ('Equipment inspection');

-- 07. Artists 
INSERT INTO Artist (ArtistID, DebutDate, Name) VALUES
    (1, NULL, 'Calema'),
    (2, NULL, 'Pedro Sampaio'),
    (3, NULL, 'Charlie Puth'),
    (4, NULL, 'Katy Perry'),
    (5, NULL, 'Maninho'),
    (6, NULL, 'Bebe Rexha'),
    (7, NULL, 'Grandson'),
    (8, NULL, 'The Pretty Reckless'),
    (9, NULL, 'Cypress Hill'),
    (10, NULL, 'Linkin Park'),
    (11, NULL, 'Sepultura'),
    (12, NULL, 'Kaiser Chiefs');

-- 08. Genres
INSERT INTO Genre (Name) VALUES
    ('Pop'),
    ('Rock'),
    ('Hip-Hop'),
    ('Metal'),
    ('Electronic'),
    ('Latin');

-- 09. Band members
INSERT INTO Member (MemberID, ArtisticName, RealName, BirthDate, Instrument) VALUES
    (1, 'Mike Shinoda', 'Michael Kenji Shinoda', NULL, 'Vocals, guitar, keyboards'),
    (2, 'Joe Hahn', 'Joseph Hahn', NULL, 'Turntables'),
    (3, 'Dave Farrell', 'David Michael Farrell', NULL, 'Bass');

-- 10. Festival 
INSERT INTO Festival (FestivalID, OrganizerID, Name, Location, StartDate, EndDate, Capacity) VALUES
    (1, 1, 'Rock in Rio Lisboa 2026', 'Parque Tejo, Lisboa', '2026-06-20', '2026-06-21', 100000);

-- 11. Festival days
INSERT INTO FestivalDay (DayID, FestivalID, Date) VALUES
    (1, 1, '2026-06-20'),
    (2, 1, '2026-06-21');

-- 12. Ticket types
INSERT INTO TicketType (TicketTypeID, FestivalID, Name, Price) VALUES
    (1, 1, 'Relvado 20 June', 89.0),
    (2, 1, 'Relvado 21 June', 89.0),
    (3, 1, 'Weekend Pass 20-21 June', 157.0);

-- 13. Staff assignments 
INSERT INTO StaffAssignment (AssignmentID, FestivalID, StageID, Role, Area) VALUES
    (1, 1, 1, 'Sound technician', 'Audio'),
    (2, 1, 1, 'Security supervisor', 'Front of stage'),
    (3, 1, 2, 'Lighting technician', 'Lighting'),
    (4, 1, 3, 'Stage manager', 'Backstage'),
    (5, 1, NULL, 'Access coordinator', 'Main entrance'),
    (6, 1, 4, 'Stage technician', 'Digital Stage');

-- 14. Ticket purchases 
INSERT INTO TicketPurchase (PurchaseID, CCNumber, Date, Value, PaymentMethod) VALUES
    (1, 'TEST-CC-001', '2026-05-20', 178.0, 'Card'),
    (2, 'TEST-CC-002', '2026-06-02', 157.0, 'MB WAY'),
    (3, 'TEST-CC-003', '2026-05-18', 89.0, 'Card'),
    (7, 'TEST-CC-007', '2026-05-14', 89.0, 'Card');

-- 15. Concerts 
INSERT INTO Concert (ConcertID, DayID, StageID, StartTime, EndTime) VALUES
    (1, 1, 1, '17:00:00', '18:00:00'),
    (2, 1, 1, '19:00:00', '20:00:00'),
    (3, 1, 1, '21:15:00', '22:15:00'),
    (4, 1, 1, '23:15:00', '23:59:00'),
    (5, 1, 2, '18:00:00', '19:00:00'),
    (6, 1, 3, '20:15:00', '21:15:00'),
    (7, 2, 1, '17:00:00', '18:00:00'),
    (8, 2, 1, '19:00:00', '20:00:00'),
    (9, 2, 1, '21:15:00', '22:15:00'),
    (10, 2, 1, '23:15:00', '23:59:00'),
    (11, 2, 2, '22:15:00', '23:15:00'),
    (12, 2, 3, '20:15:00', '21:15:00');

-- 16. Sponsorships
INSERT INTO Sponsorship (FestivalID, SponsorName, ContributionType, ContributionValue, ContributionDescription) VALUES
    (1, 'bp', 'Financial', 75000.0, 'Illustrative event support'),
    (1, 'BPI', 'Financial', 100000.0, 'Illustrative banking partnership'),
    (1, 'Coca-Cola', 'Mixed', 50000.0, 'Illustrative brand activation');

-- 17. Valid ticket days
INSERT INTO ValidFor (TicketTypeID, DayID) VALUES
    (1, 1),
    (2, 2),
    (3, 1),
    (3, 2);

-- 18. Staff assignment relationships
INSERT INTO Receives (StaffID, AssignmentID) VALUES
    (1, 1),
    (2, 2),
    (3, 3),
    (4, 4),
    (5, 5),
    (6, 6),
    (1, 3);

-- 19. Assignment tasks
INSERT INTO Operates (TaskName, AssignmentID) VALUES
    ('Sound check', 1),
    ('Equipment inspection', 1),
    ('Crowd management', 2),
    ('Access control', 5),
    ('Stage setup', 4),
    ('Equipment inspection', 6),
    ('Sound check', 3);

-- 20. Concert-artist relationships
INSERT INTO Performs (ConcertID, ArtistID) VALUES
    (1, 1),
    (2, 2),
    (3, 3),
    (4, 4),
    (5, 5),
    (6, 6),
    (7, 7),
    (8, 8),
    (9, 9),
    (10, 10),
    (11, 11),
    (12, 12);

-- 21. Artist genres
INSERT INTO ClassifiedAs (ArtistID, GenreName) VALUES
    (1, 'Pop'),
    (2, 'Electronic'),
    (2, 'Latin'),
    (3, 'Pop'),
    (4, 'Pop'),
    (5, 'Pop'),
    (6, 'Pop'),
    (7, 'Rock'),
    (7, 'Hip-Hop'),
    (8, 'Rock'),
    (9, 'Hip-Hop'),
    (10, 'Rock'),
    (10, 'Metal'),
    (11, 'Metal'),
    (12, 'Rock');

-- 22. Band membership
INSERT INTO ConsistsOf (ArtistID, MemberID) VALUES
    (10, 1),
    (10, 2),
    (10, 3);

-- 23. Tickets
INSERT INTO Ticket (TicketID, PurchaseID, TicketTypeID) VALUES
    (1, 1, 1),
    (2, 1, 1),
    (3, 2, 3),
    (4, 3, 2),
    (10, 7, 1);

