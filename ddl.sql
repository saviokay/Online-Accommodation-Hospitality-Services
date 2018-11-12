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
