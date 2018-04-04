/*Right click on server, select "new query" and paste contents into the page that opens.
Execute the query and the db and tables will be created */
CREATE DATABASE [ByeDB]
GO
USE [ByeDB]
GO

/****** Object:  Table [dbo].[Amenities]    Script Date: 4/3/2018 11:42:11 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Amenities](
	[id] [smallint] IDENTITY(1,1) NOT NULL,
	[name] [varchar](200) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Amenities_Venues]    Script Date: 4/3/2018 11:42:11 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Amenities_Venues](
	[fk_Venue] [smallint] NOT NULL,
	[fk_Amenity] [smallint] NOT NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Bookings]    Script Date: 4/3/2018 11:42:11 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Bookings](
	[id] [smallint] IDENTITY(1,1) NOT NULL,
	[fk_User] [smallint] NOT NULL,
	[fk_Venue] [smallint] NOT NULL,
	[fk_Order_State] [smallint] NOT NULL,
 CONSTRAINT [PK_Bookings] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Event_Types]    Script Date: 4/3/2018 11:42:11 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Event_Types](
	[id] [smallint] IDENTITY(1,1) NOT NULL,
	[name] [varchar](200) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Event_Types_Venues]    Script Date: 4/3/2018 11:42:11 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Event_Types_Venues](
	[fk_Venue] [smallint] NOT NULL,
	[fk_Event_Type] [smallint] NOT NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Features]    Script Date: 4/3/2018 11:42:11 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Features](
	[id] [smallint] IDENTITY(1,1) NOT NULL,
	[name] [varchar](200) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Features_Venues]    Script Date: 4/3/2018 11:42:12 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Features_Venues](
	[fk_Venue] [smallint] NOT NULL,
	[fk_Feature] [smallint] NOT NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Locations]    Script Date: 4/3/2018 11:42:12 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Locations](
	[id] [smallint] IDENTITY(1,1) NOT NULL,
	[city] [varchar](200) NOT NULL,
	[province] [varchar](200) NOT NULL,
	[country] [varchar](200) NOT NULL,
	[street] [varchar](200) NOT NULL,
	[postal_code] [varchar](7) NOT NULL,
	[latitude] [varchar](100) NOT NULL,
	[longitude] [varchar](100) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[On_Site_Services]    Script Date: 4/3/2018 11:42:12 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[On_Site_Services](
	[id] [smallint] IDENTITY(1,1) NOT NULL,
	[name] [varchar](200) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[On_Site_Services_Venues]    Script Date: 4/3/2018 11:42:12 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[On_Site_Services_Venues](
	[fk_Venue] [smallint] NOT NULL,
	[fk_On_Site_Service] [smallint] NOT NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Order_States]    Script Date: 4/3/2018 11:42:12 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Order_States](
	[id] [smallint] IDENTITY(1,1) NOT NULL,
	[name] [varchar](50) NOT NULL,
 CONSTRAINT [PK_Order_States] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Photos]    Script Date: 4/3/2018 11:42:12 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Photos](
	[id] [smallint] IDENTITY(1,1) NOT NULL,
	[filename] [varchar](2048) NOT NULL,
	[url] [varchar](2048) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Photos_Venues]    Script Date: 4/3/2018 11:42:12 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Photos_Venues](
	[fk_Venue] [smallint] NOT NULL,
	[fk_Photo] [smallint] NOT NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Styles]    Script Date: 4/3/2018 11:42:12 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Styles](
	[id] [smallint] IDENTITY(1,1) NOT NULL,
	[name] [varchar](200) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Styles_Venues]    Script Date: 4/3/2018 11:42:12 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Styles_Venues](
	[fk_Venue] [smallint] NOT NULL,
	[fk_Style] [smallint] NOT NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Users]    Script Date: 4/3/2018 11:42:12 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Users](
	[id] [smallint] IDENTITY(1,1) NOT NULL,
	[user_name] [varchar](100) NOT NULL,
	[password] [varchar](200) NOT NULL,
	[email] [varchar](200) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Vendors]    Script Date: 4/3/2018 11:42:12 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Vendors](
	[id] [smallint] IDENTITY(1,1) NOT NULL,
	[fk_User] [smallint] NOT NULL,
 CONSTRAINT [PK_Vendors] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Venue_Rules]    Script Date: 4/3/2018 11:42:12 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Venue_Rules](
	[id] [smallint] IDENTITY(1,1) NOT NULL,
	[name] [varchar](200) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Venue_Rules_Venues]    Script Date: 4/3/2018 11:42:12 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Venue_Rules_Venues](
	[fk_Venue] [smallint] NOT NULL,
	[fk_Venue_Rule] [smallint] NOT NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Venue_Types]    Script Date: 4/3/2018 11:42:13 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Venue_Types](
	[id] [smallint] IDENTITY(1,1) NOT NULL,
	[name] [varchar](200) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Venue_Types_Venues]    Script Date: 4/3/2018 11:42:13 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Venue_Types_Venues](
	[fk_Venue] [smallint] NOT NULL,
	[fk_Venue_Type] [smallint] NOT NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Venues]    Script Date: 4/3/2018 11:42:13 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Venues](
	[id] [smallint] IDENTITY(1,1) NOT NULL,
	[name] [varchar](200) NOT NULL,
	[guest_capacity] [smallint] NOT NULL,
	[venue_size_sqf] [float] NOT NULL,
	[price_hourly] [decimal](10, 0) NULL,
	[price_daily] [decimal](10, 0) NULL,
	[fk_Location] [smallint] NOT NULL,
	[fk_Vendor] [smallint] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[Amenities_Venues]  WITH CHECK ADD  CONSTRAINT [FK_Amenities_Venues_Amenities] FOREIGN KEY([fk_Amenity])
REFERENCES [dbo].[Amenities] ([id])
GO
ALTER TABLE [dbo].[Amenities_Venues] CHECK CONSTRAINT [FK_Amenities_Venues_Amenities]
GO
ALTER TABLE [dbo].[Amenities_Venues]  WITH CHECK ADD  CONSTRAINT [FK_Amenities_Venues_Venues] FOREIGN KEY([fk_Venue])
REFERENCES [dbo].[Venues] ([id])
GO
ALTER TABLE [dbo].[Amenities_Venues] CHECK CONSTRAINT [FK_Amenities_Venues_Venues]
GO
ALTER TABLE [dbo].[Bookings]  WITH CHECK ADD  CONSTRAINT [FK_Bookings_Order_States] FOREIGN KEY([fk_Order_State])
REFERENCES [dbo].[Order_States] ([id])
GO
ALTER TABLE [dbo].[Bookings] CHECK CONSTRAINT [FK_Bookings_Order_States]
GO
ALTER TABLE [dbo].[Bookings]  WITH CHECK ADD  CONSTRAINT [FK_Bookings_Users] FOREIGN KEY([fk_User])
REFERENCES [dbo].[Users] ([id])
GO
ALTER TABLE [dbo].[Bookings] CHECK CONSTRAINT [FK_Bookings_Users]
GO
ALTER TABLE [dbo].[Bookings]  WITH CHECK ADD  CONSTRAINT [FK_Bookings_Venues] FOREIGN KEY([fk_Venue])
REFERENCES [dbo].[Venues] ([id])
GO
ALTER TABLE [dbo].[Bookings] CHECK CONSTRAINT [FK_Bookings_Venues]
GO
ALTER TABLE [dbo].[Event_Types_Venues]  WITH CHECK ADD  CONSTRAINT [FK_Event_Types_Venues_Event_Types] FOREIGN KEY([fk_Event_Type])
REFERENCES [dbo].[Event_Types] ([id])
GO
ALTER TABLE [dbo].[Event_Types_Venues] CHECK CONSTRAINT [FK_Event_Types_Venues_Event_Types]
GO
ALTER TABLE [dbo].[Event_Types_Venues]  WITH CHECK ADD  CONSTRAINT [FK_Event_Types_Venues_Venues] FOREIGN KEY([fk_Venue])
REFERENCES [dbo].[Venues] ([id])
GO
ALTER TABLE [dbo].[Event_Types_Venues] CHECK CONSTRAINT [FK_Event_Types_Venues_Venues]
GO
ALTER TABLE [dbo].[Features_Venues]  WITH CHECK ADD  CONSTRAINT [FK_Features_Venues_Features] FOREIGN KEY([fk_Feature])
REFERENCES [dbo].[Features] ([id])
GO
ALTER TABLE [dbo].[Features_Venues] CHECK CONSTRAINT [FK_Features_Venues_Features]
GO
ALTER TABLE [dbo].[Features_Venues]  WITH CHECK ADD  CONSTRAINT [FK_Features_Venues_Venues] FOREIGN KEY([fk_Venue])
REFERENCES [dbo].[Venues] ([id])
GO
ALTER TABLE [dbo].[Features_Venues] CHECK CONSTRAINT [FK_Features_Venues_Venues]
GO
ALTER TABLE [dbo].[On_Site_Services_Venues]  WITH CHECK ADD  CONSTRAINT [FK_On_Site_Services_Venues_On_Site_Services] FOREIGN KEY([fk_On_Site_Service])
REFERENCES [dbo].[On_Site_Services] ([id])
GO
ALTER TABLE [dbo].[On_Site_Services_Venues] CHECK CONSTRAINT [FK_On_Site_Services_Venues_On_Site_Services]
GO
ALTER TABLE [dbo].[On_Site_Services_Venues]  WITH CHECK ADD  CONSTRAINT [FK_On_Site_Services_Venues_Venues] FOREIGN KEY([fk_Venue])
REFERENCES [dbo].[Venues] ([id])
GO
ALTER TABLE [dbo].[On_Site_Services_Venues] CHECK CONSTRAINT [FK_On_Site_Services_Venues_Venues]
GO
ALTER TABLE [dbo].[Photos_Venues]  WITH CHECK ADD  CONSTRAINT [FK_Photos_Venues_Photos] FOREIGN KEY([fk_Photo])
REFERENCES [dbo].[Photos] ([id])
GO
ALTER TABLE [dbo].[Photos_Venues] CHECK CONSTRAINT [FK_Photos_Venues_Photos]
GO
ALTER TABLE [dbo].[Photos_Venues]  WITH CHECK ADD  CONSTRAINT [FK_Photos_Venues_Venues] FOREIGN KEY([fk_Venue])
REFERENCES [dbo].[Venues] ([id])
GO
ALTER TABLE [dbo].[Photos_Venues] CHECK CONSTRAINT [FK_Photos_Venues_Venues]
GO
ALTER TABLE [dbo].[Styles_Venues]  WITH CHECK ADD  CONSTRAINT [FK_Styles_Venues_Styles] FOREIGN KEY([fk_Style])
REFERENCES [dbo].[Styles] ([id])
GO
ALTER TABLE [dbo].[Styles_Venues] CHECK CONSTRAINT [FK_Styles_Venues_Styles]
GO
ALTER TABLE [dbo].[Styles_Venues]  WITH CHECK ADD  CONSTRAINT [FK_Styles_Venues_Venues] FOREIGN KEY([fk_Venue])
REFERENCES [dbo].[Venues] ([id])
GO
ALTER TABLE [dbo].[Styles_Venues] CHECK CONSTRAINT [FK_Styles_Venues_Venues]
GO
ALTER TABLE [dbo].[Vendors]  WITH CHECK ADD  CONSTRAINT [Vendors_fk0] FOREIGN KEY([fk_User])
REFERENCES [dbo].[Users] ([id])
GO
ALTER TABLE [dbo].[Vendors] CHECK CONSTRAINT [Vendors_fk0]
GO
ALTER TABLE [dbo].[Venue_Rules_Venues]  WITH CHECK ADD  CONSTRAINT [FK_Venue_Rules_Venues_Venue_Rules] FOREIGN KEY([fk_Venue_Rule])
REFERENCES [dbo].[Venue_Rules] ([id])
GO
ALTER TABLE [dbo].[Venue_Rules_Venues] CHECK CONSTRAINT [FK_Venue_Rules_Venues_Venue_Rules]
GO
ALTER TABLE [dbo].[Venue_Rules_Venues]  WITH CHECK ADD  CONSTRAINT [FK_Venue_Rules_Venues_Venues] FOREIGN KEY([fk_Venue])
REFERENCES [dbo].[Venues] ([id])
GO
ALTER TABLE [dbo].[Venue_Rules_Venues] CHECK CONSTRAINT [FK_Venue_Rules_Venues_Venues]
GO
ALTER TABLE [dbo].[Venue_Types_Venues]  WITH CHECK ADD  CONSTRAINT [FK_Venue_Types_Venues_Venue_Types] FOREIGN KEY([fk_Venue_Type])
REFERENCES [dbo].[Venue_Types] ([id])
GO
ALTER TABLE [dbo].[Venue_Types_Venues] CHECK CONSTRAINT [FK_Venue_Types_Venues_Venue_Types]
GO
ALTER TABLE [dbo].[Venue_Types_Venues]  WITH CHECK ADD  CONSTRAINT [FK_Venue_Types_Venues_Venues] FOREIGN KEY([fk_Venue])
REFERENCES [dbo].[Venues] ([id])
GO
ALTER TABLE [dbo].[Venue_Types_Venues] CHECK CONSTRAINT [FK_Venue_Types_Venues_Venues]
GO
ALTER TABLE [dbo].[Venues]  WITH CHECK ADD  CONSTRAINT [FK_Venues_Locations] FOREIGN KEY([fk_Location])
REFERENCES [dbo].[Locations] ([id])
GO
ALTER TABLE [dbo].[Venues] CHECK CONSTRAINT [FK_Venues_Locations]
GO
ALTER TABLE [dbo].[Venues]  WITH CHECK ADD  CONSTRAINT [FK_Venues_Vendors] FOREIGN KEY([fk_Vendor])
REFERENCES [dbo].[Vendors] ([id])
GO
ALTER TABLE [dbo].[Venues] CHECK CONSTRAINT [FK_Venues_Vendors]
GO


/*--------------------DATA FOR TABLES ------------------------*/
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

/*TBD: Add one Test vendor for dummy data*/
