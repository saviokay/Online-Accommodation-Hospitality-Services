#!/usr/bin/env sql
# -*- coding: utf-8 -*-
/*
- ===================================
Created:     Fri Sep 27 13:16:17 2017
Author:      saviokay
Description: The project revolves around designing a database system for an online accommodation and hospitality company service.  We achieve this by designing the database, inserting sample data and implement a set of required features. Each feature will be implemented as one or more Oracle PL/SQL procedures.
- ===================================
*/




/* Users
Name         Null?    Type
------------ -------- ------------
USER_ID      NOT NULL NUMBER(38)
NAME                  CHAR(50)
ADDRESS               VARCHAR2(50)
PHONE_NUMBER          VARCHAR2(20)
EMAIL                 VARCHAR2(20)
PASSWORD              VARCHAR2(10)
AVG_RATING            FLOAT(126)
PROFILE               VARCHAR2(20)
USER_TYPE             CHAR(5) */


insert into users values (
110,'John Doe','123 6th St. Melbourne, FL 32904',
'+1202555-0172','john.doe@gmail.com','john123',4.0,'p1', 'Host'
);

insert into users values (
111,'Emelia Oberbrunner III','71 Pilgrim Avenue Chevy Chase, MD 20815',
'+12025550167','emober3@gmail.com','password123',3.5,'p2', 'Guest'
);

insert into users values (
112,'Craig Reilly','70 Bowman St.South Windsor, CT 06074',
'+12025550125','craigr311@gmail.com','oreilly987',3.7,'p3', 'Host'
);

insert into users values (
113,'Kevin Leandro','44 Shirley Ave.West Chicago, IL 60185, CT 06074',
'+12025550179','kevin97@gmail.com','qwertty!23',3.2,'p4', 'Guest'
);

insert into users values (
114,'Gabriel-Auguste Côté','514 S. Magnolia St.Orlando, FL 32806, CT 06074',
'+12025550172','gabbyc@gmail.com','mettsrockz',3.2,'p5', 'Host'
);

insert into users values (
115,'Inagustin Jameś','5001 S. Bousten St.Orlando, MD 21230, YT 04038',
'+12025549873','tyhjasm@gmail.com','jettsrockz',3.2,'p5', 'Host'
);

insert into users values (
116,'Jack BBladeRunner III','71 Mathheh Avenue , MD 20815',
'+12025552313','James123@gmail.com','password123',3.5,'p2', 'Guest'
);


/* Host
 Name           Null?    Type
-------------- -------- ------------
HOST_ID        NOT NULL NUMBER(38)
USER_ID                 NUMBER(38)
NAME                    CHAR(50)
ADDRESS                 VARCHAR2(50)
PHONE_NUMBER            VARCHAR2(20)
EMAIL                   VARCHAR2(20)
PASSWORD                VARCHAR2(10)
AVG_RATING              FLOAT(126)
ACCOUNT_NUMBER          VARCHAR2(20) */

insert into Host values (
210,110,'John Doe','123 6th St. Melbourne, FL 32904',
'+1202555-0172','john.doe@gmail.com','john123',4.0,'498077A'
);

insert into Host values (
211,112,'Craig Reilly','70 Bowman St.South Windsor, CT 06074',
'+12025550125','craigr311@gmail.com','oreilly987',3.7,'471639C'
);

insert into Host values (
212,114,'Brian Griffin','514 S. Magnolia St.Orlando, FL 32806, CT 06074',
'+12025550172','gabbyc@gmail.com','mettsrockz',3.2,'471325F'
);

/* Guest
Name         Null?    Type
------------ -------- ------------
GUEST_ID     NOT NULL NUMBER(38)
USER_ID               NUMBER(38)
ADDRESS               VARCHAR2(50)
EMAIL                 VARCHAR2(20)
PASSWORD              VARCHAR2(10)
PHONE_NUMBER          VARCHAR2(20)
AVG_RATING            FLOAT(126)
PROFILE               VARCHAR2(20) */

insert into guest values (
310,111,'71 Pilgrim Avenue Chevy Chase, MD 20815',
'emober3@gmail.com','password123','+12025550167',3.5,'p2'
);

insert into guest values (
311,113,'44 Shirley Ave.West Chicago, IL 60185, CT 06074',
'kevin97@gmail.com','qwertty!23','+12025550179',3.2,'p4'
);


/* Listing

Name              Null?    Type
----------------- -------- -------------
LISTING_ID        NOT NULL NUMBER(38)
HOST_ID                    NUMBER(38)
ADDRESS                    VARCHAR2(50)
BUILDING_TYPE              VARCHAR2(50)
MAX_CAPACITY               NUMBER(38)
NUMBER_BEDROOM             NUMBER(38)
NUMBER_BEDS                NUMBER(38)
NUMBER_BATHROOM            NUMBER(38)
MIN_NUM_NIGHTSTAY          NUMBER(38)
CHECK_IN_TIME              TIMESTAMP(6)
CHECK_OUT_TIME             TIMESTAMP(6)
AMINITIES                  AMINITIESTYPE */

insert into listing values (
4128,210,'123 6th St. Melbourne, FL 32904',
'OutHouse',6,3,3,3,5,timestamp'2017-11-01 05:30:00',timestamp'2017-11-06 01:00:00',
AMINITIESTYPE('WiFi','AC','Washing Machine')
);

insert into listing values (
4230,211,'70 Bowman St.South Windsor, CT 06074',
'Studio AP',4,2,2,1,2,timestamp'2017-11-11 05:30:00',timestamp'2017-11-13 01:00:00',
AMINITIESTYPE('WiFi','AC')
);

/* Available_Table
 Name            Null?    Type
--------------- -------- ----------
AVAIL_ID        NOT NULL NUMBER(38)
LISTING_ID               NUMBER(38)
START_DATE               DATE
END_DATE                 DATE
PRICE_PER_NIGHT          FLOAT(126) */

insert into available_table values (
5889,4128,'2017-11-01','2017-11-06',
7250.50);

insert into available_table values (
5922,4230,'2017-11-11','2017-11-13',
5550.00);


/* Booking_Info
Name            Null?    Type
--------------- -------- ------------
BOOKING_ID      NOT NULL NUMBER(38)
GUEST_ID                 NUMBER(38)
LISTING_ID               NUMBER(38)
CHECK_IN_DATE            DATE
CHECK_OUT_DATE           DATE
NUMBER_ADULT             NUMBER(38)
NUMBER_CHILDREN          NUMBER(38)
PAYMENT_METHOD           VARCHAR2(20)
PAYMENT_DATE             DATE
BOOKING_STATUS           VARCHAR2(15)
PAYOUT_STATUS            VARCHAR2(20) */

insert into booking_info values (
7538269,310,4230,date'2017-11-11',date'2017-11-13',2,2,'CASH',date'2017-11-07','CONFIRMED','PAID');

insert into booking_info values (
8975311,311,4128,date'2017-11-01',date'2017-11-06',4,0,'CREDIT',date'2017-10-23','CANCELLED','FAILED');


/* Payout_Info
Name          Null?    Type
------------- -------- ------------
PAYOUT_ID     NOT NULL NUMBER(38)
BOOKING_ID             NUMBER(38)
HOST_ID                NUMBER(38)
PAYOUT_DATE            DATE
PAYOUT_STATUS          VARCHAR2(20)
TOTAL_AMOUNT           FLOAT(126) */

insert into payout_info values (
9543255,7538269,211,date'2017-11-07','PAID',7250.50);

insert into payout_info values (
1643432,8975311,210,date'2017-10-23','FAILED',5550.00);

/* Review
Name      Null?    Type
--------- -------- -------------
REVIEW_ID NOT NULL NUMBER(38)
GUEST_ID           NUMBER(38)
HOST_ID            NUMBER(38)
REVIEW             VARCHAR2(200)
*/

insert into review values (
123,310,211,'Roxanas place is in a great location for visiting must-see sights in Kyoto.');

insert into review values (
765,311,210,'This was a lovely little place to stay away from the tourist bustle with a beautiful view, while still being just a short walk to the train which can easily take you throughout Tuscany.');

/* Message
Name     Null?    Type
-------- -------- -------------
MSG_ID   NOT NULL NUMBER(38)
USER_ID           NUMBER(38)
MSG_DATE          DATE
MSG_BODY          VARCHAR2(100)
*/

insert into message values (
921,111,date'2017-11-15','It is a long established fact that a reader will be distracted by the readable content.');
insert into message values (
411,113,date'2017-11-07','Lorem Ipsum is simply dummy text of the printing and typesetting industry.');
insert into message values (
412,114,date'2017-11-08','Lorem Ipsum is simply dummy text of the printing and typesetting industry.');
insert into message values (
413,115,date'2017-11-09','Lorem Ipsum is simply dummy text of the printing and typesetting industry.');

COMMIT;
