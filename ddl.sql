#!/usr/bin/env python3
# -*- coding: utf-8 -*-
/*

Created on Fri Sep 27 13:16:17 2017
@author: saviokay

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


create table available_table
  (avail_id int,
   listing_id,
   start_date date,
   end_date date,
   price_per_night float,
   primary key (avail_id),
   foreign key (listing_id) references listing (listing_id));


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
