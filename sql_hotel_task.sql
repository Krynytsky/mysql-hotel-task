use SoftServeTaskDb;
show tables;

# 1 Add 3 hotels to DB, one with name 'Edelweiss’

insert into Hotel (`Name`,`YearFoundation`,`Address`,`IsActive`) 
values ('Edelweiss', '1994','Pihotskogo str.', 1);
insert into Hotel (`Name`,`YearFoundation`,`Address`,`IsActive`)
values ('Neptun', '2019','Ivasjyka str.', 1), ('Launch Fauna', '2020','Kypeleva str.', 1);
###################################

# 2 Get All hotels from DB

select * from Hotel;
###################################

# 3 Update first hotel foundation year from existing value to 1937

update Hotel set YearFoundation = 1937 where HotelID = 1;
###################################

# 4) Delete 3d hotel from DB by Id

delete from Hotel where HotelID = 3;
###################################

# 5 Insert 10 users to Database, but have at least 2 users with Name Andrew or Anton

insert into User (`Name`,`Email`)
values('Ivan','jipo@mail.com'),('Anton','lopit@mail.com'),('Andrew','Ivan@mail.com'),('Yosup','Ivan@mail.com'),
('Andrew','Ivan@mail.com'),('Ivan','Ivan@mail.com'),('Anton','lotrit@mail.com'),('Ivanka','ivanka@mail.com'),
('Antonina','ritora@mail.com'),('Vika','kika@mail.com');
###################################

# 6 Get all users which name starts from "A"

select * from User U where U.Name like 'A%';
###################################

#7) Insert 10 rooms in DB. 7 to first hotel and 3 to other. 
#Make sure both hotels have room number 101. 
#Make sure 'Edelweiss' has room number 301, but other hotel no. 
#Also make sure 'Edelweiss' do not have rooms with comfort level 3, 
#but second hotel has at least one room with such comfort level

insert into Room(`HotelID`,`RoomNumber`,`Price`,`ComfortLevel`,`Capability`)
values(5,601,30000.25,3,5);
insert into Room(`HotelID`,`RoomNumber`,`Price`,`ComfortLevel`,`Capability`)
values(1,102,300.25,1,1),(1,103,600.99,1,2),(1,104,3000.25,2,3),(1,105,300.25,1,2),(1,106,9900.25,1,4),
(1,301,300.25,1,2),(4,101,2000.25,3,2),(4,101,1900.25,3,2),(5,401,8000,1,2);
###################################

# 8 Select All rooms from DB sorted by Price

select * from Room order by Price desc;
select * from Room order by Price asc;
###################################

# 9 Select All rooms from DB that belong to 'Edelweiss' hotel and sorted by price

select R.*, H.Name from Room R 
inner join Hotel H 
on R.HotelID = H.HotelID 
where H.HotelID = 1 
order by R.Price;
###################################

# 10 Select Hotels that have rooms with comfort level 3

select H.*,R.ComfortLevel 
from Hotel H 
inner join Room R 
on H.HotelID = R.HotelID 
where R.ComfortLevel = 3;
#####################################

# 11 Select Hotelname and room number for rooms that have comfort level 1

select H.Name, R.RoomNumber 
from Hotel H 
inner join Room R 
on H.HotelID = R.HotelID 
where R.ComfortLevel = 1;
#####################################

# 12 Select Hotel names and count of hotel rooms

select H.Name, count(R.RoomID) 
from Room R 
inner join Hotel H 
on R.HotelID = H.HotelID  
group by H.Name;
#####################################

# 13 Insert 10 different reservations to db.

insert into Reservation(`UserID`,`RoomID`,`StartReservation`,`EndReservation`)
values( 2,2,'2021-01-18','2021-01-22'),( 3,3,'2021-01-18','2021-01-22'),( 4,4,'2021-01-18','2021-01-22'),
( 5,5,'2021-01-18','2021-01-22'),( 6,6,'2021-01-18','2021-01-22'),( 7,7,'2021-01-18','2021-01-22'),
( 8,8,'2021-01-18','2021-01-22'),( 9,9,'2021-01-18','2021-01-22'),( 10,10,'2021-01-18','2021-01-22');
##########################################

# 14 Select Username, room number, reservation period.
select U.Name, RM.RoomNumber, datediff(R.EndReservation,R.StartReservation) ReservationPeriod 
from Reservation R inner join User U
on U.UserID = R.UserID  inner join Room RM on RM.RoomID = R.RoomID;
############################################

update Reservation set EndReservation = '2021-01-25' where UserID = 2;