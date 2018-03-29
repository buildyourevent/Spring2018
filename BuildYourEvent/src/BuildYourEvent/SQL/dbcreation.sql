/*Right click on server, select "new query" and paste contents into the page that opens.
Execute the query and the db and tables will be created */
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
	PRIMARY KEY ([id])
);

CREATE TABLE Venue_Rules (
	[id] smallint NOT NULL IDENTITY,
	[name] varchar(200) NOT NULL,
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
	PRIMARY KEY ([id])
);

CREATE TABLE On_Site_Services (
	[id] smallint NOT NULL IDENTITY,
	[name] varchar(200) NOT NULL,
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

ALTER TABLE [Users] ADD CONSTRAINT [Users_fk0] FOREIGN KEY ([fk_user_type]) REFERENCES User_Types([id]);

ALTER TABLE [Vendors] ADD CONSTRAINT [Vendors_fk0] FOREIGN KEY ([fk_user]) REFERENCES Users([id]);

ALTER TABLE [Vendors] ADD CONSTRAINT [Vendors_fk1] FOREIGN KEY ([fk_venue]) REFERENCES Venues([id]);

INSERT INTO Features(name) VALUES ('Art');
INSERT INTO Features(name) VALUES ('Bar');
INSERT INTO Features(name) VALUES ('Bathtub/shower');
INSERT INTO Features(name) VALUES ('Breakout rooms');
INSERT INTO Features(name) VALUES ('Columns');
INSERT INTO Features(name) VALUES ('Concrete');
INSERT INTO Features(name) VALUES ('Deck/Patio');
INSERT INTO Features(name) VALUES ('Dining Table');
INSERT INTO Features(name) VALUES ('Empty');
INSERT INTO Features(name) VALUES ('Exposed Brick');
INSERT INTO Features(name) VALUES ('Exposed Pipes');
INSERT INTO Features(name) VALUES ('Fireplace');
INSERT INTO Features(name) VALUES ('Furnished');
INSERT INTO Features(name) VALUES ('Garden');
INSERT INTO Features(name) VALUES ('Graffiti');
INSERT INTO Features(name) VALUES ('High Ceiling');
INSERT INTO Features(name) VALUES ('Large Windows');
INSERT INTO Features(name) VALUES ('Library');
INSERT INTO Features(name) VALUES ('Bathroom');
INSERT INTO Features(name) VALUES ('Open Kitchen');
INSERT INTO Features(name) VALUES ('Piano');
INSERT INTO Features(name) VALUES ('Plants');
INSERT INTO Features(name) VALUES ('Pool');
INSERT INTO Features(name) VALUES ('Props');
INSERT INTO Features(name) VALUES ('Roof');
INSERT INTO Features(name) VALUES ('Screening Room');
INSERT INTO Features(name) VALUES ('Skylight');
INSERT INTO Features(name) VALUES ('Sound-proof');
INSERT INTO Features(name) VALUES ('Storefront');
INSERT INTO Features(name) VALUES ('View');
INSERT INTO Features(name) VALUES ('White Space');
INSERT INTO Features(name) VALUES ('Wood Beams');
INSERT INTO Features(name) VALUES ('Wood Floors');

INSERT INTO Venue_Types(name) VALUES ('Indoors');
INSERT INTO Venue_Types(name) VALUES ('Outdoors');
INSERT INTO Venue_Types(name) VALUES ('Coffee shop');
INSERT INTO Venue_Types(name) VALUES ('Theater');
INSERT INTO Venue_Types(name) VALUES ('Open concept');
INSERT INTO Venue_Types(name) VALUES ('Roundtable');
INSERT INTO Venue_Types(name) VALUES ('Boardroom');
INSERT INTO Venue_Types(name) VALUES ('High-tech');
INSERT INTO Venue_Types(name) VALUES ('Bar');
INSERT INTO Venue_Types(name) VALUES ('Religious building');
INSERT INTO Venue_Types(name) VALUES ('Art gallery');
INSERT INTO Venue_Types(name) VALUES ('Hall');
INSERT INTO Venue_Types(name) VALUES ('Apartment');
INSERT INTO Venue_Types(name) VALUES ('No preference');

INSERT INTO On_Site_Services(name) VALUES ('Tech Support');
INSERT INTO On_Site_Services(name) VALUES ('Catering');
INSERT INTO On_Site_Services(name) VALUES ('Bartenders');
INSERT INTO On_Site_Services(name) VALUES ('Servers');
INSERT INTO On_Site_Services(name) VALUES ('Chef');
INSERT INTO On_Site_Services(name) VALUES ('DJ');
INSERT INTO On_Site_Services(name) VALUES ('Cleaning');

INSERT INTO Styles(name) VALUES ('Classic');
INSERT INTO Styles(name) VALUES ('Industrial');
INSERT INTO Styles(name) VALUES ('Intimate');
INSERT INTO Styles(name) VALUES ('Luxurious');
INSERT INTO Styles(name) VALUES ('Minimalist');
INSERT INTO Styles(name) VALUES ('Modern');
INSERT INTO Styles(name) VALUES ('Raw');
INSERT INTO Styles(name) VALUES ('Urban');
INSERT INTO Styles(name) VALUES ('Whimsical');
INSERT INTO Styles(name) VALUES ('Romantic');

INSERT INTO Event_Types(name) VALUES ('Anniversary');
INSERT INTO Event_Types(name) VALUES ('Bachelor Party');
INSERT INTO Event_Types(name) VALUES ('Bachelorette Party');
INSERT INTO Event_Types(name) VALUES ('Birthday Party');
INSERT INTO Event_Types(name) VALUES ('Holiday Party');
INSERT INTO Event_Types(name) VALUES ('Corporate Event');
INSERT INTO Event_Types(name) VALUES ('Reception');
INSERT INTO Event_Types(name) VALUES ('Wake');
INSERT INTO Event_Types(name) VALUES ('Festival');
INSERT INTO Event_Types(name) VALUES ('Other');
INSERT INTO Event_Types(name) VALUES ('Viewing Party');
INSERT INTO Event_Types(name) VALUES ('Wedding Ceremony');
INSERT INTO Event_Types(name) VALUES ('After Party');
INSERT INTO Event_Types(name) VALUES ('Anniversary Party');
INSERT INTO Event_Types(name) VALUES ('Art Class');
INSERT INTO Event_Types(name) VALUES ('Art Show');
INSERT INTO Event_Types(name) VALUES ('Wedding Reception');
INSERT INTO Event_Types(name) VALUES ('Audition');
INSERT INTO Event_Types(name) VALUES ('Baby Shower');
INSERT INTO Event_Types(name) VALUES ('Banquet');
INSERT INTO Event_Types(name) VALUES ('Bat Mitzvah');
INSERT INTO Event_Types(name) VALUES ('Bar Mitzvah');
INSERT INTO Event_Types(name) VALUES ('Birthday Dinner');
INSERT INTO Event_Types(name) VALUES ('Birthday Gathering');
INSERT INTO Event_Types(name) VALUES ('Board Meeting');
INSERT INTO Event_Types(name) VALUES ('Corporate Meeting');
INSERT INTO Event_Types(name) VALUES ('Book Launch');
INSERT INTO Event_Types(name) VALUES ('Brainstorming');
INSERT INTO Event_Types(name) VALUES ('Brand Activation');
INSERT INTO Event_Types(name) VALUES ('Work Session');
INSERT INTO Event_Types(name) VALUES ('Work Meeting');
INSERT INTO Event_Types(name) VALUES ('Brand Event');
INSERT INTO Event_Types(name) VALUES ('Planning Event');
INSERT INTO Event_Types(name) VALUES ('Planning Meeting');
INSERT INTO Event_Types(name) VALUES ('Breakfast');
INSERT INTO Event_Types(name) VALUES ('Bridal Shower');
INSERT INTO Event_Types(name) VALUES ('Casting');
INSERT INTO Event_Types(name) VALUES ('Charity Dinner');
INSERT INTO Event_Types(name) VALUES ('Charity Event');
INSERT INTO Event_Types(name) VALUES ('Charity Fashion Show');
INSERT INTO Event_Types(name) VALUES ('Christmas Party');
INSERT INTO Event_Types(name) VALUES ('Hannukah Party');
INSERT INTO Event_Types(name) VALUES ('Class');
INSERT INTO Event_Types(name) VALUES ('Cocktail Party');
INSERT INTO Event_Types(name) VALUES ('Alumni Event');
INSERT INTO Event_Types(name) VALUES ('Fundraiser');
INSERT INTO Event_Types(name) VALUES ('Commercial Shoot');
INSERT INTO Event_Types(name) VALUES ('Company Holiday Party');
INSERT INTO Event_Types(name) VALUES ('Cooking Class');
INSERT INTO Event_Types(name) VALUES ('Corporate Holiday Party');
INSERT INTO Event_Types(name) VALUES ('Corporate Party');
INSERT INTO Event_Types(name) VALUES ('Dance Class');
INSERT INTO Event_Types(name) VALUES ('Dinner Party');
INSERT INTO Event_Types(name) VALUES ('Dinner');
INSERT INTO Event_Types(name) VALUES ('Luncheon');
INSERT INTO Event_Types(name) VALUES ('Lunch');
INSERT INTO Event_Types(name) VALUES ('Documentary Shoot');
INSERT INTO Event_Types(name) VALUES ('Movie Shoot');
INSERT INTO Event_Types(name) VALUES ('Engagement Party');
INSERT INTO Event_Types(name) VALUES ('Fair');
INSERT INTO Event_Types(name) VALUES ('Family Gathering');
INSERT INTO Event_Types(name) VALUES ('Family Reunion');
INSERT INTO Event_Types(name) VALUES ('Fashion Event');
INSERT INTO Event_Types(name) VALUES ('Fashion Show');
INSERT INTO Event_Types(name) VALUES ('Fashion Presentation');
INSERT INTO Event_Types(name) VALUES ('Fashion Shoot');
INSERT INTO Event_Types(name) VALUES ('Fasion Show');
INSERT INTO Event_Types(name) VALUES ('Festibal');
INSERT INTO Event_Types(name) VALUES ('Fitness Class');
INSERT INTO Event_Types(name) VALUES ('Concert');
INSERT INTO Event_Types(name) VALUES ('Gala');
INSERT INTO Event_Types(name) VALUES ('Going Away Party');
INSERT INTO Event_Types(name) VALUES ('Graduation Ceremony');
INSERT INTO Event_Types(name) VALUES ('Graduation Party');
INSERT INTO Event_Types(name) VALUES ('Hackathon');
INSERT INTO Event_Types(name) VALUES ('Halloween Party');
INSERT INTO Event_Types(name) VALUES ('Valentine''S Day Party');
INSERT INTO Event_Types(name) VALUES ('Happy Hour');
INSERT INTO Event_Types(name) VALUES ('Kids Birthday');
INSERT INTO Event_Types(name) VALUES ('Kids Party');
INSERT INTO Event_Types(name) VALUES ('Large Scale Production');
INSERT INTO Event_Types(name) VALUES ('Filming');
INSERT INTO Event_Types(name) VALUES ('Launch Event');
INSERT INTO Event_Types(name) VALUES ('Live Musical Performance');
INSERT INTO Event_Types(name) VALUES ('Marriage Proposal');
INSERT INTO Event_Types(name) VALUES ('Media Event');
INSERT INTO Event_Types(name) VALUES ('Memorial');
INSERT INTO Event_Types(name) VALUES ('New Year''S Even Party');
INSERT INTO Event_Types(name) VALUES ('Office Party');
INSERT INTO Event_Types(name) VALUES ('Performance');
INSERT INTO Event_Types(name) VALUES ('Panel Discussion');
INSERT INTO Event_Types(name) VALUES ('Speakers Series');
INSERT INTO Event_Types(name) VALUES ('Photography Exhibition');
INSERT INTO Event_Types(name) VALUES ('Presentation');
INSERT INTO Event_Types(name) VALUES ('Private Party');
INSERT INTO Event_Types(name) VALUES ('Product Launch');
INSERT INTO Event_Types(name) VALUES ('Prom Party');
INSERT INTO Event_Types(name) VALUES ('Quincaenera');
INSERT INTO Event_Types(name) VALUES ('Recital');
INSERT INTO Event_Types(name) VALUES ('Rehearsal');
INSERT INTO Event_Types(name) VALUES ('Repass');
INSERT INTO Event_Types(name) VALUES ('Retail Popup');
INSERT INTO Event_Types(name) VALUES ('Popup');
INSERT INTO Event_Types(name) VALUES ('Sales Meeting');
INSERT INTO Event_Types(name) VALUES ('Seminar');
INSERT INTO Event_Types(name) VALUES ('Small Video Shoot');
INSERT INTO Event_Types(name) VALUES ('Social Media Shoot');
INSERT INTO Event_Types(name) VALUES ('Sorority/Fraternity Event');
INSERT INTO Event_Types(name) VALUES ('Superbowl Party');
INSERT INTO Event_Types(name) VALUES ('Surprise Party');
INSERT INTO Event_Types(name) VALUES ('Thanksgiving');
INSERT INTO Event_Types(name) VALUES ('Training');
INSERT INTO Event_Types(name) VALUES ('Workout Class');
INSERT INTO Event_Types(name) VALUES ('Yoga Class');
INSERT INTO Event_Types(name) VALUES ('Brunch');
INSERT INTO Event_Types(name) VALUES ('Homecoming');
INSERT INTO Event_Types(name) VALUES ('Influencer Event');
INSERT INTO Event_Types(name) VALUES ('Interview');
INSERT INTO Event_Types(name) VALUES ('Photo Shoot');
INSERT INTO Event_Types(name) VALUES ('Activation');

/*////////////////////////////////////2018/03/28 - new queries */
INSERT INTO Amenities(name) VALUES ('Air conditioning');
INSERT INTO Amenities(name) VALUES ('Industrial');
INSERT INTO Amenities(name) VALUES ('Bathrooms');
INSERT INTO Amenities(name) VALUES ('Heating');
INSERT INTO Amenities(name) VALUES ('Kitchen');
INSERT INTO Amenities(name) VALUES ('Large');
INSERT INTO Amenities(name) VALUES ('Lighting');
INSERT INTO Amenities(name) VALUES ('Lounge');
INSERT INTO Amenities(name) VALUES ('Natural');
INSERT INTO Amenities(name) VALUES ('Photography');
INSERT INTO Amenities(name) VALUES ('Projectors');
INSERT INTO Amenities(name) VALUES ('Screens');
INSERT INTO Amenities(name) VALUES ('Sound');
INSERT INTO Amenities(name) VALUES ('Stage');
INSERT INTO Amenities(name) VALUES ('Tableware');
INSERT INTO Amenities(name) VALUES ('TV');
INSERT INTO Amenities(name) VALUES ('Whiteboard');
INSERT INTO Amenities(name) VALUES ('Wifi');
INSERT INTO Amenities(name) VALUES ('Microphones');
INSERT INTO Amenities(name) VALUES ('Tables');
INSERT INTO Amenities(name) VALUES ('Parking');
INSERT INTO Amenities(name) VALUES ('Security');
INSERT INTO Amenities(name) VALUES ('Security');
INSERT INTO Amenities(name) VALUES ('Storage');
INSERT INTO Amenities(name) VALUES ('Connected');
INSERT INTO Amenities(name) VALUES ('Back');
INSERT INTO Amenities(name) VALUES ('Wheelchair');
INSERT INTO Amenities(name) VALUES ('Commercial');
INSERT INTO Amenities(name) VALUES ('Basic');
INSERT INTO Amenities(name) VALUES ('Water');
INSERT INTO Amenities(name) VALUES ('Ground');
INSERT INTO Amenities(name) VALUES ('Fitness');
INSERT INTO Amenities(name) VALUES ('Outdoor');
INSERT INTO Amenities(name) VALUES ('Elevator');
INSERT INTO Amenities(name) VALUES ('Escalator');

INSERT INTO venue_rules(name) VALUES ('Accepts children (0-10)');
INSERT INTO venue_rules(name) VALUES ('Accepts teenagers (10-18)');
INSERT INTO venue_rules(name) VALUES ('Adult only (19+)');
INSERT INTO venue_rules(name) VALUES ('Cooking allowed');
INSERT INTO venue_rules(name) VALUES ('External catering allowed');
INSERT INTO venue_rules(name) VALUES ('Late night parties allowed');
INSERT INTO venue_rules(name) VALUES ('Loud music allowed');
INSERT INTO venue_rules(name) VALUES ('Open flame allowed');
INSERT INTO venue_rules(name) VALUES ('Open to public events');
INSERT INTO venue_rules(name) VALUES ('Selling alcohol allowed');
INSERT INTO venue_rules(name) VALUES ('Serving alcohol allowed');
INSERT INTO venue_rules(name) VALUES ('Quiet music allowed');
INSERT INTO venue_rules(name) VALUES ('Ticket sales allowed');


/* add One location to db*/
INSERT INTO [dbo].[Locations]
           ([city]
           ,[province]
           ,[country]
           ,[street]
           ,[postal_code]
           ,[latitude]
           ,[longitude])
     VALUES
           ('Ottawa','Ontario','Canada', '1200 St.Laurent', 'K1K 3B8', '45.422229','-75.638769');



/*Mock data: contains one location at st.Laurent. */
INSERT INTO venues(name,guest_capacity,venue_size_sqf,price_hourly,price_daily,fk_venue_type,fk_event_type,fk_amenity,fk_venue_rule,fk_style,fk_feature,fk_on_site_service,fk_location) VALUES ('Swift and Sons',514,3882,$676.86,$1237.95,2,54,32,11,3,4,1,1);
INSERT INTO venues(name,guest_capacity,venue_size_sqf,price_hourly,price_daily,fk_venue_type,fk_event_type,fk_amenity,fk_venue_rule,fk_style,fk_feature,fk_on_site_service,fk_location) VALUES ('Mayer and Sons',953,3215,$996.45,$3184.58,6,114,10,1,4,18,1,1);
INSERT INTO venues(name,guest_capacity,venue_size_sqf,price_hourly,price_daily,fk_venue_type,fk_event_type,fk_amenity,fk_venue_rule,fk_style,fk_feature,fk_on_site_service,fk_location) VALUES ('Little, Homenick and Wisoky',591,2701,$170.29,$1679.81,1,99,22,4,6,4,1,1);
INSERT INTO venues(name,guest_capacity,venue_size_sqf,price_hourly,price_daily,fk_venue_type,fk_event_type,fk_amenity,fk_venue_rule,fk_style,fk_feature,fk_on_site_service,fk_location) VALUES ('Windler and Sons',657,3060,$220.70,$798.64,5,71,14,6,8,24,5,1);
INSERT INTO venues(name,guest_capacity,venue_size_sqf,price_hourly,price_daily,fk_venue_type,fk_event_type,fk_amenity,fk_venue_rule,fk_style,fk_feature,fk_on_site_service,fk_location) VALUES ('Hansen-O''Keefe',328,1925,$174.62,$2900.18,7,43,1,3,4,20,1,1);
INSERT INTO venues(name,guest_capacity,venue_size_sqf,price_hourly,price_daily,fk_venue_type,fk_event_type,fk_amenity,fk_venue_rule,fk_style,fk_feature,fk_on_site_service,fk_location) VALUES ('Friesen Group',235,2922,$997.36,$2525.22,13,83,29,10,2,24,2,1);
INSERT INTO venues(name,guest_capacity,venue_size_sqf,price_hourly,price_daily,fk_venue_type,fk_event_type,fk_amenity,fk_venue_rule,fk_style,fk_feature,fk_on_site_service,fk_location) VALUES ('Hirthe-Cummerata',683,2842,$412.78,$2234.74,7,74,33,10,3,14,1,1);
INSERT INTO venues(name,guest_capacity,venue_size_sqf,price_hourly,price_daily,fk_venue_type,fk_event_type,fk_amenity,fk_venue_rule,fk_style,fk_feature,fk_on_site_service,fk_location) VALUES ('Ryan, Konopelski and Kuhn',128,1856,$162.50,$2234.39,9,80,24,13,10,2,1,1);
INSERT INTO venues(name,guest_capacity,venue_size_sqf,price_hourly,price_daily,fk_venue_type,fk_event_type,fk_amenity,fk_venue_rule,fk_style,fk_feature,fk_on_site_service,fk_location) VALUES ('Jacobson LLC',528,3155,$725.32,$2435.61,1,6,7,2,10,11,4,1);
INSERT INTO venues(name,guest_capacity,venue_size_sqf,price_hourly,price_daily,fk_venue_type,fk_event_type,fk_amenity,fk_venue_rule,fk_style,fk_feature,fk_on_site_service,fk_location) VALUES ('Homenick and Sons',610,2197,$792.42,$3595.69,11,110,4,1,1,23,5,1);
INSERT INTO venues(name,guest_capacity,venue_size_sqf,price_hourly,price_daily,fk_venue_type,fk_event_type,fk_amenity,fk_venue_rule,fk_style,fk_feature,fk_on_site_service,fk_location) VALUES ('Nolan-Armstrong',527,2479,$489.30,$1856.05,1,64,24,11,5,18,2,1);
INSERT INTO venues(name,guest_capacity,venue_size_sqf,price_hourly,price_daily,fk_venue_type,fk_event_type,fk_amenity,fk_venue_rule,fk_style,fk_feature,fk_on_site_service,fk_location) VALUES ('Braun-Robel',767,3322,$196.74,$2018.43,14,24,18,3,6,17,2,1);
INSERT INTO venues(name,guest_capacity,venue_size_sqf,price_hourly,price_daily,fk_venue_type,fk_event_type,fk_amenity,fk_venue_rule,fk_style,fk_feature,fk_on_site_service,fk_location) VALUES ('Mayer, Hickle and Heidenreich',990,2048,$675.91,$2709.49,13,82,31,11,9,8,4,1);
INSERT INTO venues(name,guest_capacity,venue_size_sqf,price_hourly,price_daily,fk_venue_type,fk_event_type,fk_amenity,fk_venue_rule,fk_style,fk_feature,fk_on_site_service,fk_location) VALUES ('Bogisich-Morar',127,1724,$341.87,$1405.92,12,65,5,13,2,14,4,1);
INSERT INTO venues(name,guest_capacity,venue_size_sqf,price_hourly,price_daily,fk_venue_type,fk_event_type,fk_amenity,fk_venue_rule,fk_style,fk_feature,fk_on_site_service,fk_location) VALUES ('Schaefer Group',242,1602,$212.01,$2830.76,13,87,18,2,6,8,2,1);
INSERT INTO venues(name,guest_capacity,venue_size_sqf,price_hourly,price_daily,fk_venue_type,fk_event_type,fk_amenity,fk_venue_rule,fk_style,fk_feature,fk_on_site_service,fk_location) VALUES ('Hessel, Bode and Dicki',877,2175,$366.31,$2777.47,6,99,28,2,4,23,4,1);
INSERT INTO venues(name,guest_capacity,venue_size_sqf,price_hourly,price_daily,fk_venue_type,fk_event_type,fk_amenity,fk_venue_rule,fk_style,fk_feature,fk_on_site_service,fk_location) VALUES ('Runolfsson-Stanton',753,1318,$606.21,$2550.45,14,114,10,6,10,7,1,1);
INSERT INTO venues(name,guest_capacity,venue_size_sqf,price_hourly,price_daily,fk_venue_type,fk_event_type,fk_amenity,fk_venue_rule,fk_style,fk_feature,fk_on_site_service,fk_location) VALUES ('Stehr LLC',535,3712,$396.67,$682.37,3,15,3,5,7,8,5,1);
INSERT INTO venues(name,guest_capacity,venue_size_sqf,price_hourly,price_daily,fk_venue_type,fk_event_type,fk_amenity,fk_venue_rule,fk_style,fk_feature,fk_on_site_service,fk_location) VALUES ('Glover, Raynor and Kertzmann',212,1746,$386.00,$3494.01,9,16,13,9,4,9,2,1);
INSERT INTO venues(name,guest_capacity,venue_size_sqf,price_hourly,price_daily,fk_venue_type,fk_event_type,fk_amenity,fk_venue_rule,fk_style,fk_feature,fk_on_site_service,fk_location) VALUES ('Gusikowski-Orn',902,3721,$397.83,$1216.63,1,81,33,8,3,13,1,1);
