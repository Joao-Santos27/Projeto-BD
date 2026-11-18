-- Revised SQLite database creation script
PRAGMA foreign_keys = ON;

DROP TABLE IF EXISTS Ticket;
DROP TABLE IF EXISTS TicketPurchase;
DROP TABLE IF EXISTS ConsistsOf;
DROP TABLE IF EXISTS ClassifiedAs;
DROP TABLE IF EXISTS Performs;
DROP TABLE IF EXISTS Operates;
DROP TABLE IF EXISTS Receives;
DROP TABLE IF EXISTS ValidFor;
DROP TABLE IF EXISTS Sponsorship;
DROP TABLE IF EXISTS Concert;
DROP TABLE IF EXISTS StaffAssignment;
DROP TABLE IF EXISTS Member;
DROP TABLE IF EXISTS Genre;
DROP TABLE IF EXISTS Artist;
DROP TABLE IF EXISTS Task;
DROP TABLE IF EXISTS StaffMember;
DROP TABLE IF EXISTS Stage;
DROP TABLE IF EXISTS FestivalDay;
DROP TABLE IF EXISTS TicketType;
DROP TABLE IF EXISTS Sponsor;
DROP TABLE IF EXISTS Client;
DROP TABLE IF EXISTS Festival;
DROP TABLE IF EXISTS Organizer;

CREATE TABLE Organizer(
    OrganizerID INTEGER PRIMARY KEY,
    Name TEXT NOT NULL,
    PhoneNumber TEXT,
    Email TEXT
);

CREATE TABLE Festival(
    FestivalID INTEGER PRIMARY KEY,
    OrganizerID INTEGER NOT NULL,
    Name TEXT NOT NULL,
    Location TEXT,
    StartDate TEXT NOT NULL,
    EndDate TEXT NOT NULL,
    Capacity INTEGER CHECK (Capacity > 0),

    CHECK (StartDate <= EndDate),

    FOREIGN KEY (OrganizerID)
        REFERENCES Organizer(OrganizerID)
);

CREATE TABLE Client(
    CCNumber TEXT PRIMARY KEY,
    Name TEXT NOT NULL,
    IBAN TEXT,
    NIF TEXT NOT NULL UNIQUE,
    BirthDate TEXT,
    Address TEXT,
    PhoneNumber TEXT,
    Email TEXT
);

CREATE TABLE Sponsor(
    Name TEXT PRIMARY KEY,
    PhoneNumber TEXT,
    Email TEXT
);

CREATE TABLE Sponsorship(
    FestivalID INTEGER NOT NULL,
    SponsorName TEXT NOT NULL,
    ContributionType TEXT,
    ContributionValue REAL CHECK (ContributionValue >= 0),
    ContributionDescription TEXT,

    PRIMARY KEY(FestivalID, SponsorName),
    FOREIGN KEY (FestivalID)
        REFERENCES Festival(FestivalID),
    FOREIGN KEY (SponsorName)
        REFERENCES Sponsor(Name)
);

CREATE TABLE TicketType(
    TicketTypeID INTEGER PRIMARY KEY,
    FestivalID INTEGER NOT NULL,
    Name TEXT NOT NULL,
    Price REAL NOT NULL CHECK (Price >= 0),

    FOREIGN KEY (FestivalID)
        REFERENCES Festival(FestivalID)
);

CREATE TABLE FestivalDay(
    DayID INTEGER PRIMARY KEY,
    FestivalID INTEGER NOT NULL,
    Date TEXT NOT NULL,

    UNIQUE(FestivalID, Date),

    FOREIGN KEY (FestivalID)
        REFERENCES Festival(FestivalID)
);

CREATE TABLE ValidFor(
    TicketTypeID INTEGER NOT NULL,
    DayID INTEGER NOT NULL,

    PRIMARY KEY (TicketTypeID, DayID),
    FOREIGN KEY (TicketTypeID)
        REFERENCES TicketType(TicketTypeID),
    FOREIGN KEY (DayID)
        REFERENCES FestivalDay(DayID)
);

CREATE TABLE Stage(
    StageID INTEGER PRIMARY KEY,
    Name TEXT NOT NULL,
    Capacity INTEGER CHECK (Capacity > 0)
);

CREATE TABLE Concert(
    ConcertID INTEGER PRIMARY KEY,
    DayID INTEGER NOT NULL,
    StageID INTEGER NOT NULL,
    StartTime TEXT NOT NULL,
    EndTime TEXT NOT NULL,

    FOREIGN KEY (DayID)
        REFERENCES FestivalDay(DayID),
    FOREIGN KEY (StageID)
        REFERENCES Stage(StageID)
);

CREATE TABLE StaffAssignment(
    AssignmentID INTEGER PRIMARY KEY,
    FestivalID INTEGER NOT NULL,
    StageID INTEGER,
    Role TEXT NOT NULL,
    Area TEXT,

    FOREIGN KEY (FestivalID)
        REFERENCES Festival(FestivalID),
    FOREIGN KEY (StageID)
        REFERENCES Stage(StageID)
);

CREATE TABLE StaffMember(
    StaffID INTEGER PRIMARY KEY,
    Name TEXT NOT NULL,
    PhoneNumber TEXT,
    Email TEXT
);

CREATE TABLE Receives(
    StaffID INTEGER NOT NULL,
    AssignmentID INTEGER NOT NULL,

    PRIMARY KEY (StaffID, AssignmentID),
    FOREIGN KEY(StaffID)
        REFERENCES StaffMember(StaffID),
    FOREIGN KEY(AssignmentID)
        REFERENCES StaffAssignment(AssignmentID)
);

CREATE TABLE Task(
    Name TEXT PRIMARY KEY
);

CREATE TABLE Operates(
    TaskName TEXT NOT NULL,
    AssignmentID INTEGER NOT NULL,

    PRIMARY KEY(TaskName, AssignmentID),
    FOREIGN KEY(TaskName)
        REFERENCES Task(Name),
    FOREIGN KEY(AssignmentID)
        REFERENCES StaffAssignment(AssignmentID)
);

CREATE TABLE Artist(
    ArtistID INTEGER PRIMARY KEY,
    DebutDate TEXT,
    Name TEXT NOT NULL
);

CREATE TABLE Performs(
    ConcertID INTEGER NOT NULL,
    ArtistID INTEGER NOT NULL,

    PRIMARY KEY (ConcertID, ArtistID),
    FOREIGN KEY (ConcertID)
        REFERENCES Concert(ConcertID),
    FOREIGN KEY (ArtistID)
        REFERENCES Artist(ArtistID)
);

CREATE TABLE Genre(
    Name TEXT PRIMARY KEY
);

CREATE TABLE ClassifiedAs(
    ArtistID INTEGER NOT NULL,
    GenreName TEXT NOT NULL,

    PRIMARY KEY (ArtistID, GenreName),
    FOREIGN KEY (ArtistID)
        REFERENCES Artist(ArtistID),
    FOREIGN KEY (GenreName)
        REFERENCES Genre(Name)
);

CREATE TABLE Member(
    MemberID INTEGER PRIMARY KEY,
    ArtisticName TEXT,
    RealName TEXT,
    BirthDate TEXT,
    Instrument TEXT
);

CREATE TABLE ConsistsOf(
    ArtistID INTEGER NOT NULL,
    MemberID INTEGER NOT NULL,

    PRIMARY KEY (ArtistID, MemberID),
    FOREIGN KEY (ArtistID)
        REFERENCES Artist(ArtistID),
    FOREIGN KEY (MemberID)
        REFERENCES Member(MemberID)
);

CREATE TABLE TicketPurchase(
    PurchaseID INTEGER PRIMARY KEY,
    CCNumber TEXT NOT NULL,
    Date TEXT NOT NULL,
    Value REAL NOT NULL CHECK (Value >= 0),
    PaymentMethod TEXT NOT NULL,

    FOREIGN KEY (CCNumber)
        REFERENCES Client(CCNumber)
);

CREATE TABLE Ticket(
    TicketID INTEGER PRIMARY KEY,
    PurchaseID INTEGER NOT NULL,
    TicketTypeID INTEGER NOT NULL,

    FOREIGN KEY (PurchaseID)
        REFERENCES TicketPurchase(PurchaseID),
    FOREIGN KEY (TicketTypeID)
        REFERENCES TicketType(TicketTypeID)
);
