#!/usr/bin/env sql
# -*- coding: utf-8 -*-
/*
- ===================================
Created:     Fri Sep 27 13:16:17 2017
Author:      saviokay
Description: The project revolves around designing a database system for an online accommodation and hospitality company service.  We achieve this by designing the database, inserting sample data and implement a set of required features. Each feature will be implemented as one or more Oracle PL/SQL procedures.
- ===================================
*/


/*
--Drop Commands :
    Initially declared to avoid prior data redundancies.
*/

drop table message;
drop table Review;
drop table Payout_Info;
drop table Booking_Info;
drop table Available_Table;
drop table Listing;
drop table Guest;
drop table Host;
drop table Users;

/*
--Create Commands:
    Declared for creating Datasbase Schema.
*/

/*
-- Table Users:

Creating Table User with various attributes like user_id, name, address, phone etc. user_id is declared as a primary key whereas host_id is declared.

*/


create table users
  (user_id int,
   name char(50),
   address varchar(100),
   phone_number varchar(20),
   email varchar(50),
   password varchar(20),
   user_type char(5),
   primary key(user_id));


/*
-- Table Host:

Creating Table Host with various attributes like host_id, user_id, name, address, phone_number etc. host_id is declared as a primary key whereas user_id is declared as the foreign key.

*/

create table host
     (host_id int,
      user_id int,
      name char(50),
      address varchar(100),
      phone_number varchar(20),
      email varchar(50),
      password varchar(20),
      avg_rating number(3,2),
      account_number varchar(30),
      primary key (host_id),
      foreign key (user_id) references users (user_id));


create table guest
     (guest_id int,
      user_id int,
       name varchar(50),
      address varchar(100),
      email varchar (50),
      password varchar(20),
      phone_number varchar(20),
      avg_rating number(3,2),
      profile varchar(20),
      primary key (guest_id),
      foreign key (user_id) references users (user_id));

/*
-- aminitiesType:

Declaring custom TYPE for specific category of aminitiesType for the Table Listing. This type helps store
various services provided by the listing which is added to the table in type VARCHAR. Using 'CREATE OR REPLACE' to help create with overriding properties.
*/

CREATE OR REPLACE TYPE aminitiesType AS VARRAY(20) OF VARCHAR(50);

/*
-- Table Listing:

Creating Table Listing with various attributes like listing_id, host_id, address, city etc. Listing_Id is declared as a primary key whereas host_id is declared as a foreign key to provide the reference with the Table Host.

*/


create table listing
  (listing_id int,
   host_id int,
   address varchar(100),
   city varchar(100),
   state varchar(100),
   zip_code varchar(150),
   building_type varchar (50),
   max_capacity int,
   number_bedroom int,
   number_beds int,
   number_bathroom int,
   min_num_nightstay int,
   check_in_time varchar(20),
   check_out_time varchar(20),
   aminities aminitiesType,
   primary key (listing_id),
   foreign key (host_id) references host (host_id));


/*
-- Table Available:

Creating Table Availability with various attributes like listing_id, start_date, end_date, price_per_night etc. avail_id is declared as a primary key whereas listing_id is declared as a foreign key to provide the reference with the Table Host.

*/

create table available_table
  (avail_id int,
   listing_id,
   start_date date,
   end_date date,
   price_per_night float,
   primary key (avail_id),
   foreign key (listing_id) references listing (listing_id));

/*
-- Table Booking Info:

Creating Table Booking Info with various attributes like listing_id, guest_id, listing_id, payment_method etc. booking_id is declared as a primary key whereas guest_id & listing_id are declared as a foreign key to provide the reference with the Table Host.

*/

create table booking_info
  (booking_id int,
   guest_id int,
   listing_id int,
   check_in_date date,
   check_out_date date,
   number_adult int,
   number_children int,
   payment_method varchar (20),
   payment_date timestamp,
   booking_status varchar(20),
   payout_status int,
   total_price float,
   primary key (booking_id),
   foreign key (guest_id) references guest (guest_id),
   foreign key (listing_id) references listing (listing_id));

/*
-- Table Payout Info:

Creating Table Payout Info with various attributes like listing_id, guest_id, payout_id, payout_status etc. payout_id is declared as a primary key whereas guest_id & host_id are declared as a foreign key to provide the reference with the Table Host.

*/

create table payout_info
  (payout_id int,
   host_id int,
   payout_date timestamp,
   payout_status int,
   total_amount float,
   primary key (payout_id),
   foreign key (host_id) references host (host_id));


create table review
  (review_id int,
   guest_id int,
   host_id int,
   review varchar (1000),
   rating float,
   reviewer_type char(1),
   primary key (review_id),
   foreign key (guest_id) references guest ( guest_id),
   foreign key (host_id) references host (host_id));


create table message
  (msg_id int,
   user_id int,
   msg_date date, msg_body varchar (1000),
   primary key (msg_id),
   foreign key (user_id) references users (user_id));


/* Users
Name         Null?    Type
------------ -------- ------------
USER_ID NUMBER(38,0)
NAME    CHAR(50 BYTE)
ADDRESS VARCHAR2(100 BYTE)
PHONE_NUMBER    VARCHAR2(20 BYTE)
EMAIL   VARCHAR2(50 BYTE)
PASSWORD    VARCHAR2(20 BYTE)
USER_TYPE   CHAR(5 BYTE) */

--Drop Sequences

Drop sequence AVAILABILITYID;
Drop sequence BOOK_SEQ1;
Drop sequence LISTID_SEQ;
Drop sequence MESSAGEID;
Drop sequence PAYOUTID;
Drop sequence REGISTERUSER;
Drop sequence REVIEWID;
Drop sequence hostseq;
Drop sequence guestseq;


--create sequences


create sequence hostseq start with 200 increment by 1;
create sequence guestseq start with 300 increment by 1;
create sequence AVAILABILITYID start with 1 increment by 1;
create sequence MESSAGEID start with 1 increment by 1;
create sequence PAYOUTID start with 1 increment by 1;
create sequence REGISTERUSER start with 110 increment by 1;
create sequence BOOK_SEQ1 start with 5000 increment by 1;
create sequence LISTID_SEQ start with 1000 increment by 1;
create sequence REVIEWID start with 1 increment by 1;


--Inserting Initial Values






insert into users values (
REGISTERUSER.nextval,'John Doe','123 6th St. Melbourne, FL 32904',
'+1202555-0172','john.doe@gmail.com','john123', 'host');

insert into users values (
REGISTERUSER.nextval,'Emelia Oberbrunner III','71 Pilgrim Avenue Chevy Chase, MD 20815',
'+12025550167','emober3@gmail.com','password123','guest'
);

insert into users values (
REGISTERUSER.nextval,'Craig Reilly','70 Bowman St.South Windsor, CT 06074',
'+12025550125','craigr311@gmail.com','oreilly987','both');

insert into users values (
REGISTERUSER.nextval,'Kevin Leandro','44 Shirley Ave.West Chicago, IL 60185, CT 06074',
'+12025550179','kevin97@gmail.com','qwertty!23','guest');

insert into users values (
REGISTERUSER.nextval,'Gabriel-Auguste Côté','514 S. Magnolia St.Orlando, FL 32806, CT 06074',
'+12025550172','gabbyc@gmail.com','mettsrockz','host');

insert into users values (
REGISTERUSER.nextval,'Jerome D. Levi','1093 Stratford Court Raleigh, NC 27601',
'+19197559586','jerome3@gmail.com','password123','guest');

insert into users values (
REGISTERUSER.nextval,'George C. Williams','2635 Happy Hollow Road Clinton, NC 28328',
'+19105920324','georgec@gmail.com','jesus123','host'
);

insert into users values (
REGISTERUSER.nextval,'Jacqueline E. Torres','4894 Worthington Drive Dallas, TX 75201',
'+19726165405','jacq56@gmail.com','jaccq64','guest'
);

insert into users values (
REGISTERUSER.nextval,'Joan J. Sawyer','743 Spinnaker Lane Lisbon, IL 60541',
'+18157363098','joan.j@gmail.com','i5qt123','host'
);

insert into users values (
REGISTERUSER.nextval,'Rita R. Torres','2022 Adonais Way Newnan, GA 30263',
'+16784236467','ritat1@gmail.com','password123','guest'
);


/* Host@
 Name           Null?    Type
-------------- -------- ------------
HOST_ID NUMBER(38,0)
USER_ID NUMBER(38,0)
NAME    CHAR(50 BYTE)
ADDRESS VARCHAR2(100 BYTE)
PHONE_NUMBER    VARCHAR2(20 BYTE)
EMAIL   VARCHAR2(50 BYTE)
PASSWORD    VARCHAR2(20 BYTE)
AVG_RATING  FLOAT
ACCOUNT_NUMBER  VARCHAR2(30 BYTE) */

insert into Host values (1
hostseq.nextval,110,'John Doe','123 6th St. Melbourne, FL 32904',
'+1202555-0172','john.doe@gmail.com','john123',0.0,'498077A'
);

insert into Host values (
hostseq.nextval,112,'Craig Reilly','70 Bowman St.South Windsor, CT 06074',
'+12025550125','craigr311@gmail.com','oreilly987',0.0,'471639C'
);

insert into Host values (
hostseq.nextval,114,'Gabriel-Auguste Côté','514 S. Magnolia St.Orlando, FL 32806, CT 06074',
'+12025550172','gabbyc@gmail.com','mettsrockz',0.0,'471325F'
);

insert into Host values (
hostseq.nextval,116,'George C. Williams','2635 Happy Hollow Road Clinton, NC 28328',
'+19105920324','georgec@gmail.com','jesus123',0.0,'789358F'
);


insert into Host values (
hostseq.nextval,118,'Joan J. Sawyer','743 Spinnaker Lane Lisbon, IL 60541',
'+18157363098','joan.j@gmail.com','i5qt123',0.0,'987543D'
);



COMMIT;
