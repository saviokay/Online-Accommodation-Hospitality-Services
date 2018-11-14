--Drop Commands To Avoid Redundancies.

drop table message;
drop table Review;
drop table Payout_Info;
drop table Booking_Info;
drop table Available_Table;
drop table Listing;
drop table Guest;
drop table Host;
drop table Users;

--Create Commands For Datasbase Schema.

CREATE Or Replace TYPE aminitiesType AS VARRAY(20) OF VARCHAR(50);

create table users
  (user_id int,
   name char(50),
   address varchar(100),
   phone_number varchar(20),
   email varchar(50),
   password varchar(20),
   user_type char(5),
   primary key(user_id));

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
