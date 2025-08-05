DROP DATABASE IF EXISTS RiseUp2;
CREATE DATABASE RiseUp2; 
USE RiseUp2;

-- Mission table
DROP TABLE IF EXISTS Missions
CREATE TABLE Missions (
	id_mission			INT IDENTITY(1,1)	NOT NULL,
	mission_name		VARCHAR(40)			NOT NULL,
	description_mission	CHAR(500)			NOT NULL,
	date_mission		DATE				NOT NULL,
	locality			VARCHAR(50)			NOT NULL, 
	state_mission		VARCHAR(10)			NOT NULL,
	financed_amount		INT					NOT NULL,

	PRIMARY KEY (id_mission),
	
);

INSERT INTO Missions values ('Türkiye earthquake', 'On 6th of February in Kahramanmaras, Türkiye, an earthquake measuring 7.8 on Richter scale occurred, the earthquake destroyed 214,000 buildings, killing 46,000 people.', '2023-02-06', 'Turkiye', 'Active','4000')

INSERT INTO Missions values ('Ukraine War','On 24th of February, 2022, Russia invades Ukraine with with infantry divisions and armoured and air support in  Eastern Ukraine, and dozens of missile attacks across Ukraine, that invalion took the death of many innocent lifes.', '2022-02-20', 'Ukraine', 'Active', '6000')

INSERT INTO Missions values ('Congo Floods', 'On 16th of December, 2022, in the Kalehe Dominican Republic of Congo, 400 people died due to the floods, destroying the homes of countless people, people who have been digging through the mud with their hands in a desperate search for missing relatives.', '2022-12-16', 'Dominican Republic of Congo', 'Active', '2000')

INSERT INTO Missions values ('Cyclone Freddy', 'On 3th of May, 2023, in Mozambique, Cyclone Freddy battered central Mozambique after making landfall for a second time in a month, breaking records for the duration and strength of tropical storms in the souther hemisphere More than 171,000 people were affected, killing 27 people.', '2023-03-12', 'Mozambique', 'Active', '8000')

INSERT INTO Missions values ('Syria earthquake', 'On the same day and at the same time as the earthquake in turkey, there is another earthquake in syria, on the same day and at the same time as the earthquake in turkey,  another earthquake occurs in syria, causing  thousands of deaths and destruction.', '2023-02-06', 'Syria', 'Active', '12000')

INSERT INTO Missions values ('Cyclone Mocha', 'On 14th of May, 2023, in Myanmar, Cyclone Mocha caused winds to reach 200 kilometers per hour (195 mph) affecting millions of people and killing more than 400 people.', '2023-05-14', 'Myanmar', 'Active', '7000')
												 




		
-- Associations table
DROP TABLE IF EXISTS Associations
CREATE TABLE Associations (
	id_association		INT IDENTITY(1,1)	NOT NULL,
	association_name	VARCHAR(40)			NOT NULL,
	base_district		VARCHAR(40)			NOT NULL, --
	base_country		VARCHAR(40)			NOT NULL, --
	iban				VARCHAR(34)			DEFAULT NULL,

	PRIMARY KEY (id_association),
);

INSERT INTO	Associations values ('Voices of Children', 'Kyiv', 'Ukraine', 'UA203006140000026007500456564') --Ukraine mission
INSERT INTO Associations values ('People in Need', 'Safarikova', 'Czech Republic', 'CZ2203000000000093209320') --Ukraine mission
INSERT INTO Associations values ('Save the children', 'London', 'United Kingdom', 'GB29NWBK60161331926819') --Syria and turkye earthquake mission
INSERT INTO Associations values ('The UN Refugee Agency', 'Geneva', 'Switzerland', 'CH9300762011623852957') --Ciclone freddy mission, congo flood mission , ciclone mocha mission



-- Association_Missions bridge table
DROP TABLE IF EXISTS Association_Mission
CREATE TABLE Association_Mission (
	id_mission			INT				NOT NULL,
	id_association		INT				NOT NULL,
	
	CONSTRAINT fk_mission_association FOREIGN KEY (id_mission) REFERENCES Missions(id_mission) ON DELETE NO ACTION ON UPDATE CASCADE,
	CONSTRAINT fk_association_mission FOREIGN KEY (id_association) REFERENCES Associations(id_association) ON DELETE NO ACTION ON UPDATE CASCADE,
);

INSERT INTO Association_Mission values ('2','1')
INSERT INTO Association_Mission values ('2','2')
INSERT INTO Association_Mission values ('1','3')
INSERT INTO Association_Mission values ('5','3')
INSERT INTO Association_Mission values ('3','4')
INSERT INTO Association_Mission values ('4','4')
INSERT INTO Association_Mission values ('6','1')

--Users table
DROP TABLE IF EXISTS Users
CREATE TABLE Users (
	id_user				INT IDENTITY(1,1)	NOT NULL,
	user_name_			VARCHAR(40)			NOT NULL,
	e_mail				VARCHAR(70)			NOT NULL,	
	pass_word			VARCHAR(30)			NOT NULL,

	PRIMARY KEY (id_user),
);

INSERT INTO Users values ('Bernard1', 'bernardapril00@gmail.com', '********')
INSERT INTO Users values ('JhonXX', 'imjhon@outlook.pt', '**********')
INSERT INTO Users values ('Anne1998', '98Anne@gmail.com', '************')
INSERT INTO Users values ('Paul_02', 'united123@hotmail.com', '***********')
INSERT INTO Users values ('TaylorSD', 'taylor147@gmail.com', '*******')

--Payment_Method table
DROP TABLE IF EXISTS Payment_Method
CREATE TABLE Payment_Method (
	id_payment_method	INT IDENTITY(1,1)	NOT NULL,
	payment_method_name	VARCHAR(20)			NOT NULL,

	PRIMARY KEY (id_payment_method),
);

INSERT INTO Payment_Method values ('Bank Transfer')
INSERT INTO Payment_Method values ('MB Way')

--Monetary Donations table
DROP TABLE IF EXISTS Monetary_Donations
CREATE TABLE Monetary_Donations (
	id_monetary_donation INT IDENTITY(1,1)		NOT NULL,
	id_mission			 INT					NOT NULL,
	id_user				 INT					NOT NULL,
	id_association		 INT					NOT NULL,
	id_payment_method	 INT					NOT NULL,
	monetary_value		 INT					NOT NULL,
	date_donation		 DATE					NOT NULL,

	PRIMARY KEY (id_monetary_donation),
	ALTER TABLE Monetary_Donations
	ADD
	CONSTRAINT fk_user FOREIGN KEY (id_user) REFERENCES Users(id_user) ON DELETE CASCADE ON UPDATE CASCADE,
	CONSTRAINT fk_mission FOREIGN KEY (id_mission) REFERENCES Missions(id_mission) ON DELETE CASCADE ON UPDATE CASCADE,
	CONSTRAINT fk_associationn FOREIGN KEY (id_association) REFERENCES Associations(id_association) ON DELETE NO ACTION ON UPDATE CASCADE,
	CONSTRAINT fk_payment_method FOREIGN KEY (id_payment_method) REFERENCES Payment_Method(id_payment_method) ON DELETE NO ACTION ON UPDATE CASCADE

);


INSERT INTO Monetary_Donations values ('2','1','1', '1', '30', '2022-03-21')
INSERT INTO Monetary_Donations values ('2','4','2', '1', '15', '2023-04-01')
INSERT INTO Monetary_Donations values ('1','3','3', '1', '10', '2023-02-12')
INSERT INTO Monetary_Donations values ('5','2','3', '1', '5', '2023-01-03')
INSERT INTO Monetary_Donations values ('3','5','4', '1', '10', '2023-05-27')
INSERT INTO Monetary_Donations values ('4','3','4', '1', '20', '2022-03-30')
INSERT INTO Monetary_Donations values ('2','5','1', '1', '5', '2022-04-16')
INSERT INTO Monetary_Donations values ('2','2','1', '1', '100', '2023-03-01')

--Material Goods table
DROP TABLE IF EXISTS Material_Goods
CREATE TABLE Material_Goods (
	id_material_good	INT IDENTITY(1,1)	NOT NULL,
	material_good_name	VARCHAR(30)			NOT NULL,

	PRIMARY KEY (id_material_good),
);

INSERT INTO Material_Goods values ('Food')
INSERT INTO Material_Goods values ('Blankets')
INSERT INTO Material_Goods values ('Clothes')
INSERT INTO Material_Goods values ('Toys')
INSERT INTO Material_Goods values ('Hygiene Products')
INSERT INTO Material_Goods values ('School Supplies')
INSERT INTO Material_Goods values ('Books')
INSERT INTO Material_Goods values ('Appliences')
INSERT INTO Material_Goods values ('Baby Items')

--Colection Points table
DROP TABLE IF EXISTS Collection_Points
CREATE TABLE Collection_Points (
	id_collection_point		INT IDENTITY(1,1) NOT NULL,
	collection_point_name	VARCHAR(40)		  NOT NULL,
	postal_code				VARCHAR(20)		  NOT NULL,
	district				VARCHAR(30)		  NOT NULL,
	city					VARCHAR(30)		  NOT NULL,
	country					VARCHAR(30)		  NOT NULL,
	street					VARCHAR(40)		  NOT NULL,
	number_door				INT				  NOT NULL,
	inicial_hour			TIME			  NOT NULL,
	end_hour				TIME			  NOT NULL,
	week_days				VARCHAR(30)		  NOT NULL,

	PRIMARY KEY (id_collection_point),
);

INSERT INTO Collection_Points values ('Igreja Ortodoxa do Porto', '4200-199', 'Porto', 'Porto', 'Portugal', 'Rua da Constituição','379', '14:00', '19:00', 'Mondey-Saturday')
INSERT INTO Collection_Points values ('Seminário Cristo Rei', '4400-338', 'Porto', 'Vila Nova de Gaia', 'Portugal', 'Rua Visconde das Devesas','684', '09:00', '22:00', 'Monday-Saturday')
INSERT INTO Collection_Points values ('Loja Solidária', '3504-510', 'Viseu', 'Viseu', 'Portugal', 'Av. Cor. José Maria Vale de Andrade', '44' ,'09:00', '17:30', 'Monday-Saturday')
INSERT INTO Collection_Points values ('Centro de Apoio à Ucrânia', '2725-294', 'Sintra', 'Lisboa', 'Portugal', 'Rua das Eiras', '64', '10:00', '22:00', 'Monday-Saturday')
INSERT INTO Collection_Points values ('Kuri Kuri','4050-525', 'Porto', 'Porto', 'Portugal', 'Rua do Rosario','343', '14:00', '19:00', 'Monday-Saturday')
INSERT INTO Collection_Points values ('Eres Pan','46008', 'Valencia', 'Valencia', 'Spain', 'C. de Guillem de Castro','57', '09:00', '12:00', 'Monday-Saturday')
INSERT INTO Collection_Points values ('Mercadona','41003', 'Sevilla', 'Valencia', 'Spain', 'C. Juan Antonio Cavestany','19', '09:00', '16:00', 'Monday-Sunday')
INSERT INTO Collection_Points values ('BleuForêt','41003', 'Paris', 'Paris', 'France', 'Rue de Rennes','101', '14:00', '19:00', 'Monday-Thursday')



--Missions Collection Points bridge table
DROP TABLE IF EXISTS Missions_Collection_Points
CREATE TABLE Missions_Collection_Points (
	id_mission				INT	   NOT NULL,
	id_collection_point		INT	   NOT NULL,

	CONSTRAINT fk_mission_collection_point FOREIGN KEY (id_mission) REFERENCES Missions(id_mission) ON DELETE NO ACTION ON UPDATE CASCADE,
	CONSTRAINT fk_collection_point_mission FOREIGN KEY (id_collection_point) REFERENCES Collection_Points (id_collection_point) ON DELETE NO ACTION ON UPDATE CASCADE,
);

INSERT INTO Missions_Collection_Points values ('1', '5')
INSERT INTO Missions_Collection_Points values ('1', '2')
INSERT INTO Missions_Collection_Points values ('1', '3')
INSERT INTO Missions_Collection_Points values ('2', '6')
INSERT INTO Missions_Collection_Points values ('2', '7')
INSERT INTO Missions_Collection_Points values ('2', '8')
INSERT INTO Missions_Collection_Points values ('3', '1')
INSERT INTO Missions_Collection_Points values ('3', '3')
INSERT INTO Missions_Collection_Points values ('3', '6')
INSERT INTO Missions_Collection_Points values ('4', '1')
INSERT INTO Missions_Collection_Points values ('4', '3')
INSERT INTO Missions_Collection_Points values ('4', '5')
INSERT INTO Missions_Collection_Points values ('5', '7')
INSERT INTO Missions_Collection_Points values ('5', '8')
INSERT INTO Missions_Collection_Points values ('5', '4')
INSERT INTO Missions_Collection_Points values ('6', '2')
INSERT INTO Missions_Collection_Points values ('6', '3')
INSERT INTO Missions_Collection_Points values ('6', '4')


