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
