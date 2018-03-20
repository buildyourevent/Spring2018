/*Right click on server, select "new query" and paste contents into the page that opens.
Execute the query and the db and tables will be created*/
CREATE DATABASE [ByeDB]
GO
USE [ByeDB]
GO

CREATE TABLE Locations (
	[id] smallint NOT NULL IDENTITY,
	[city] varchar(200) NOT NULL,
	[province] varchar(200) NOT NULL,
	[country] varchar(200) NOT NULL,
	[street] varchar(200) NOT NULL,
	[postal_code] varchar(7) NOT NULL,
	[latitude] varchar(100) NOT NULL,
	[longitude] varchar(100) NOT NULL,
	PRIMARY KEY ([id])
);

CREATE TABLE Event_Types (
	[id] smallint NOT NULL IDENTITY,
	[name] varchar(200) NOT NULL,
	PRIMARY KEY ([id])
);

CREATE TABLE Venue_Types (
	[id] smallint NOT NULL IDENTITY,
	[name] varchar(200) NOT NULL,
	PRIMARY KEY ([id])
);

CREATE TABLE Venues (
	[id] smallint NOT NULL IDENTITY,
	[name] varchar(200) NOT NULL,
	[guest_capacity] smallint NOT NULL,
	[venue_size_sqf] FLOAT NOT NULL,
	[price_hourly] DECIMAL(10,0),
	[price_daily] DECIMAL(10,0),
	[fk_venue_type] smallint NOT NULL,
	[fk_event_type] smallint NOT NULL,
	[fk_amenity] smallint NOT NULL,
	[fk_venue_rule] smallint NOT NULL,
	[fk_style] smallint NOT NULL,
	[fk_feature] smallint NOT NULL,
	[fk_on_site_service] smallint NOT NULL,
	[fk_location] smallint NOT NULL,
	PRIMARY KEY ([id])
);

CREATE TABLE Amenities (
	[id] smallint NOT NULL IDENTITY,
	[name] varchar(200) NOT NULL,
	[fk_amenities] smallint NOT NULL,
	PRIMARY KEY ([id])
);

CREATE TABLE Venue_Rules (
	[id] smallint NOT NULL IDENTITY,
	[name] varchar(200) NOT NULL,
	[fk_venue_rules] smallint NOT NULL,
	PRIMARY KEY ([id])
);

CREATE TABLE Styles (
	[id] smallint NOT NULL IDENTITY,
	[name] varchar(200) NOT NULL,
	PRIMARY KEY ([id])
);

CREATE TABLE Features (
	[id] smallint NOT NULL IDENTITY,
	[name] varchar(200) NOT NULL,
	[fk_features] smallint NOT NULL,
	PRIMARY KEY ([id])
);

CREATE TABLE On_Site_Services (
	[id] smallint NOT NULL IDENTITY,
	[name] varchar(200) NOT NULL,
	[fk_on_site_services] smallint NOT NULL,
	PRIMARY KEY ([id])
);

CREATE TABLE Users (
	[id] smallint NOT NULL IDENTITY,
	[user_name] varchar(100) NOT NULL,
	[password] varchar(200) NOT NULL,
	[email] varchar(200) NOT NULL,
	[fk_user_type] smallint NOT NULL,
	PRIMARY KEY ([id])
);

CREATE TABLE User_Types (
	[id] smallint NOT NULL IDENTITY,
	[name] varchar(200) NOT NULL,
	PRIMARY KEY ([id])
);

CREATE TABLE Vendors (
	[id] smallint NOT NULL IDENTITY,
	[fk_user] smallint NOT NULL,
	[fk_venue] smallint NOT NULL
);

ALTER TABLE [Venues] ADD CONSTRAINT [Venues_fk0] FOREIGN KEY ([fk_venue_type]) REFERENCES Venue_Types([id]);

ALTER TABLE [Venues] ADD CONSTRAINT [Venues_fk1] FOREIGN KEY ([fk_event_type]) REFERENCES Event_Types([id]);

ALTER TABLE [Venues] ADD CONSTRAINT [Venues_fk2] FOREIGN KEY ([fk_amenity]) REFERENCES Amenities([id]);

ALTER TABLE [Venues] ADD CONSTRAINT [Venues_fk3] FOREIGN KEY ([fk_venue_rule]) REFERENCES Venue_Rules([id]);

ALTER TABLE [Venues] ADD CONSTRAINT [Venues_fk4] FOREIGN KEY ([fk_style]) REFERENCES Styles([id]);

ALTER TABLE [Venues] ADD CONSTRAINT [Venues_fk5] FOREIGN KEY ([fk_feature]) REFERENCES Features([id]);

ALTER TABLE [Venues] ADD CONSTRAINT [Venues_fk6] FOREIGN KEY ([fk_on_site_service]) REFERENCES On_Site_Services([id]);

ALTER TABLE [Venues] ADD CONSTRAINT [Venues_fk7] FOREIGN KEY ([fk_location]) REFERENCES Locations([id]);

ALTER TABLE [Amenities] ADD CONSTRAINT [Amenities_fk0] FOREIGN KEY ([fk_amenities]) REFERENCES Amenities([id]);

ALTER TABLE [Venue_Rules] ADD CONSTRAINT [Venue_Rules_fk0] FOREIGN KEY ([fk_venue_rules]) REFERENCES Venue_Rules([id]);

ALTER TABLE [Features] ADD CONSTRAINT [Features_fk0] FOREIGN KEY ([fk_features]) REFERENCES Features([id]);

ALTER TABLE [On_Site_Services] ADD CONSTRAINT [On_Site_Services_fk0] FOREIGN KEY ([fk_on_site_services]) REFERENCES On_Site_Services([id]);

ALTER TABLE [Users] ADD CONSTRAINT [Users_fk0] FOREIGN KEY ([fk_user_type]) REFERENCES User_Types([id]);

ALTER TABLE [Vendors] ADD CONSTRAINT [Vendors_fk0] FOREIGN KEY ([fk_user]) REFERENCES Users([id]);

ALTER TABLE [Vendors] ADD CONSTRAINT [Vendors_fk1] FOREIGN KEY ([fk_venue]) REFERENCES Venues([id]);
