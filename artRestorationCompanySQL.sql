/* Student name: Vladimir Tregubiak
Student username: adcm062
*/

/* SECTION 1 CREATE TABLE STATEMENTS */
create table adcm062_Client(
  client_ID integer(10) primary key auto_increment,
  client_name char(30) not null,
  client_country char(30) not null
);

create table adcm062_Painting(
  painting_ID integer(5) primary key auto_increment,
  artist_name char(30),
  painting_name char(255) not null,
  painting_creationDate integer(8),
  painting_price integer(12),
  painting_movement char(30)
);

create table adcm062_Query(
  painting_ID integer(5) auto_increment,
  query_date integer(8),
  query_status char(12) not null,
  client_ID integer(10) not null,
  foreign key (client_ID) references adcm062_Client (client_ID),
  foreign key (painting_ID) references adcm062_Painting (painting_ID),
  primary key (query_date, painting_ID)
);

create table adcm062_Invoice(
  invoice_no integer(10) primary key auto_increment,
  invoice_cost dec(10, 2) not null,
  painting_ID integer(5) not null,
  query_date integer(8) not null,
  foreign key (painting_ID, query_date) references adcm062_Query (painting_ID, query_date)
);


create table adcm062_Restorers(
  name char(30) primary key,
  age integer(3),
  restorationsCompleted integer(3)
);


create table adcm062_RestorersAssignments(
  name char(30),
  painting_ID integer(5),
  query_date integer(8),
  primary key (name, painting_ID, query_date),
  foreign key (name) references adcm062_Restorers (name),
  foreign key (painting_ID, query_date) references adcm062_Query (painting_ID, query_date)
);









/* SECTION 2 INSERT STATEMENTS */


insert into adcm062_Client (client_name, client_country) values

    ("Neil Adkins","United States"),
    ("Vladimir Selenov","Russian Federation"),
    ("Senchan Ko","Russian Federation"),
    ("Kamilla Mazhenova","Kazakhstan"),
    ("Paloma Pittman", "United States"),
    ("Nicolas Gonzales","Italy"),
    ("Carol Esmin","United Kingdom"),
    ("Hiroko Bray","France"),
    ("Chase Lester","United Kingdom"),
    ("Caleb Randall","United Kingdom"),
    ("Dara Davenport","Italy"),
    ("Fay Wolf","United States"),
    ("Alyssa Rodriquez","Spain"),
    ("Dolan Sanders","France"),
    ("Calvin Singleton","Sweden"),
    ("Muji Yamamoto", "Ireland");

insert into adcm062_Painting (artist_name, painting_name, painting_creationDate, painting_price, painting_movement) values
    ("Michelangelo Buonarroti", "Sistine Chapel", 1508, 35000000, "High Renaissance"),
    ("Leonardo da Vinci", "Last Supper", 1490, 450000000, "High Renaissance"),
    ("Rembrandt van Rijn", "The Night Watch", 1642, 5128000, "Baroque"),
    ("Jan van Hemessen", "Christ as Triumphant Redeemer", 1545, 550000, "Renaissance"),
    ("Agnolo Bronzino", "The portrait of Isabella Romola de Medici", 1562, 5655500, "Mannerism"),
    ("Leonardo da Vinci", "The Virgin and Child with St. Anne", 1503, 1389000, "High Renaissance"),
    ("Vincent van Gogh", "Sunflowers", 1888, 2804000, "Post-Impressionism"),
    ("Vincent van Gogh", "Church in Nuenen", null, 6300000, "Post-Impressionism"),
    ("Ivan Aivazovsky", "The Island of Capri", 1881, 880000000, "Romanticism"),
    ("Ivan Aivazovsky", "Storm on the Azov Sea", 1886, 3120000, "Romanticism"),
    ("Charles Le Brun", "Everhard Jabach and His Family", 1660, 1250000, "Baroque"),
    ("Merisi da Caravaggio", "Lute-Player", 1596, 950000, "Baroque"),
    ("Caspar David Friedrich", "Monk by the Sea", null, 4520000, "Romanticism"),
    ("Leonardo da Vinci", "Mona Lisa", 1503, 870000000, "Renaissance"),
    ("Pablo Picasso", "Portrait of María Picasso", null, 9888800, "Post-Impressionism");


insert into adcm062_Query (query_date, query_status, client_ID) values
    ('19800728', "completed", 1),
    ('20151029', "completed", 2),
    ('19990807', "completed", 3),
    ('20110213', "completed", 4),
    ('19821113', "completed", 5),
    ('19980527', "completed", 6),
    ('19800719', "failed", 7),
    ('20200629', "in process", 8),
    ('19801222', "completed", 9),
    ('19940725', "completed", 10),
    ('20001023', "failed", 11),
    ('20031015', "completed", 12),
    ('19900602', "completed", 13),
    ('20120911', "in process", 14),
    ('19911204', "completed", 15);

insert into adcm062_Invoice (invoice_cost, painting_ID, query_date) values
    ('38426.30', 1, '19800728'),
    ('89674.60', 2, '20151029'),
    ('57959.20', 3, '19990807'),
    ('384727.50', 4, '20110213'),
    ('410622.24', 5, '19821113'),
    ('445980.80' , 6, '19980527'),
    ('299985.80', 7, '19800719'),
    ('193744.78', 8, '20200629'),
    ('201222.25', 9, '19801222'),
    ('723020.65', 10, '19940725'),
    ('978196.20', 11, '20001023'),
    ('999938.50', 12, '20031015'),
    ('374753.38', 13, '19900602'),
    ('14086.70', 14, '20120911'),
    ('718809.80', 15, '19911204');

  insert into adcm062_Restorers(name, age, restorationsCompleted) values
     ('Farlee Tegler', 43, 11),
     ('Nickey Forre', 54, 13),
     ('Townie Tregenza', 49, 23),
     ('Maribeth Konert', 57, 11),
     ('Bald Caro', 40, 18),
     ('Laurel Crimin', 48, 13),
     ('Loutitia Dowsing', 29, 19),
     ('Kimberli Antonijevic', 35, 5),
     ('Lucias Balling', 61, 13),
     ('Trish Vasyanin', 53, 11),
     ('Alberik Allbut', 70, 2),
     ('Jenifer Mansel', 80, 4),
     ('Dolli Hassey', 49, 16),
     ('Enriqueta Vero', 25, 16),
     ('Perry Doelle', 70, 3);

   insert into adcm062_RestorersAssignments(name, painting_ID, query_date) values
     ('Farlee Tegler', 1, '19800728'),
     ('Nickey Forre', 2, '20151029'),
     ('Townie Tregenza', 3, '19990807'),
     ('Maribeth Konert', 4, '20110213'),
     ('Bald Caro', 5, '19821113'),
     ('Laurel Crimin', 6,'19980527' ),
     ('Loutitia Dowsing', 7, '19800719'),
     ('Kimberli Antonijevic', 8, '20200629'),
     ('Lucias Balling', 9, '19801222'),
     ('Trish Vasyanin', 10, '19940725'),
     ('Alberik Allbut', 11, '20001023'),
     ('Jenifer Mansel', 12, '20031015'),
     ('Dolli Hassey', 13, '19900602'),
     ('Enriqueta Vero', 14, '20120911'),
     ('Perry Doelle', 15, '19911204');



/* SECTION 3 UPDATE STATEMENTS */

  update adcm062_Query
  set query_status = "completed"
  where query_date = '20120911' and painting_ID = 14;

  update adcm062_Restorers
  set restorationsCompleted = restorationsCompleted + 1
  where name = (select name from adcm062_RestorersAssignments where query_date = '20120911' and painting_ID = 14);

  update adcm062_Invoice
  set invoice_cost = '250000'
  where query_date = '20120911' and painting_ID = 14;

/* SECTION 4 SINGLE TABLE QUERIES */


/*
1) How many restorations has Maribeth Konert supervised?
*/

select restorationsCompleted
from adcm062_Restorers
where name = 'Maribeth Konert';


/*
2) List the names and IDs of clients from United States
*/

 select distinct client_name, client_ID
 from adcm062_Client
 where client_country = 'United States';




/*
3) What is the cost of restoration done on 28th July 1980?
*/

 select distinct invoice_cost
 from adcm062_Invoice
 where query_date = '19800728';




/*
4) What paintings were written in Renaissance peiod?
*/

 select distinct painting_name
 from adcm062_Painting
 where painting_movement like '%renaissance%';





/*
5) List the number of restorers who are over 40
*/

 select count(distinct name)
 from adcm062_Restorers
 where age > 40;



/*
6) How many restorations were unsuccessful between 1980 and 2000?
*/

 select count(query_date)
 from adcm062_Query
 where query_status like '%failed%' and (query_date > 19800000 and query_date < 20000000);


/*
7) What is the average price we have charged for restoration in the past 5 years?
*/

 select avg(invoice_cost)
 from adcm062_Invoice
 where query_date < 20220000 and query_date > 20170000;


/*
8) List the names of paintings creation dates of which are uknown?
*/

 select distinct painting_name
 from adcm062_Painting
 where painting_creationDate is NULL;



/* SECTION 5 MULTIPLE TABLE QUERIES */


/*
1) List the client names, names of their paintings and the restorers which have done the restoration.
*/

select distinct c.client_name, p.painting_name, r.name as restorer_name
from adcm062_Client c, adcm062_Painting p, adcm062_Restorers r, adcm062_RestorersAssignments a, adcm062_Query q
where r.name = a.name
and p.painting_ID = a.painting_ID
and a.query_date = q.query_date
and q.client_ID = c.client_ID;





/*
2) What is the name and age of a restorer who has done the most expensive restoration?
*/

select name, age
from adcm062_Restorers
where name = (
  select name
  from adcm062_RestorersAssignments
  where query_date = (
    select query_date
    from adcm062_Invoice
    where invoice_cost = (
      select max(invoice_cost)
      from adcm062_Invoice
    )
  )
);




/*
3) List the number of customers from each country and average invoice cost for each country.
   Only include countries with more than 1 costumer.
*/

   select c.client_country as country, count(c.client_country) as numberOfCustomers, avg(i.invoice_cost) as averageInvoiceCost
   from adcm062_Client c, adcm062_Invoice i, adcm062_Query q
   where i.query_date = q.query_date and q.client_ID = c.client_ID
   group by client_country
   having count(c.client_ID) > 1;





/*
4) List the names of artists whose paintings cost the most for each art movement. Include the names and prices of the most expensive paintings,
   as well as the query date of their restoration.
   Sort by date.
*/


select a.artist_name, a.painting_movement, a.painting_price, a.painting_name, q.query_date
from adcm062_Painting a, adcm062_Query q
where painting_price in (
 select max(painting_price)
 from adcm062_Painting
 group by painting_movement)
 and a.painting_ID = q.painting_ID
order by q.query_date desc;









/*
5) Display the names of paintings and restorers who have completed restoration on them. Order by restorers' name.
*/

   select adcm062_Painting.painting_name, adcm062_RestorersAssignments.name
   from adcm062_Painting
   left join adcm062_RestorersAssignments on adcm062_RestorersAssignments.painting_ID = adcm062_Painting.painting_ID
   order by adcm062_RestorersAssignments.name;






/*
6) Create a distribution table of restorers ages and the average income earned by each age band. Use 15 as a class width.
   (e.g outputs floor of a class width, and the average in)

*/

   select floor(r.age/15)*15 as floor_of_class_width, avg(i.invoice_cost) as average_cost_per_band
   from adcm062_Restorers r, adcm062_Invoice i, adcm062_RestorersAssignments a
   where r.name = a.name
   and a.query_date = i.query_date
   group by 1
   order by 1;




/* SECTION 6 DELETE ROWS (make sure the SQL is commented out in this section)

  delete from adcm062_Client where client_name = 'Muji Yamamoto';


*/

/* SECTION 7 DROP TABLES (make sure the SQL is commented out in this section)

  drop table adcm062_RestorersAssignments;
  drop table adcm062_Restorers;
  drop table adcm062_Invoice;
  drop table adcm062_Query;
  drop table adcm062_Painting;
  drop table adcm062_Client;



*/
