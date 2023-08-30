create table room_type(
room_type_id int PRIMARY KEY identity(1,1),
description varchar(80),
max_capacity int
);

create table room(
room_id int PRIMARY KEY identity(1,1),
number varchar(10),
name varchar(40),
status varchar(10),
smoke bit, 
room_type_id int,
FOREIGN KEY (room_type_id) REFERENCES room_type(room_type_id)
);

create table guest(
guest_id int PRIMARY KEY identity(1,1),
first_name varchar(80), 
last_name varchar(80) null,
member_since date
);

create table reservation(
reservation_id int PRIMARY KEY identity(1,1),
date_in date,
date_out date,
made_by varchar(20),
guest_id int,
FOREIGN KEY (guest_id) REFERENCES guest(guest_id)
);

create table ocuppied_room(
occupied_room_id int PRIMARY KEY identity(1,1),
check_in datetime,
check_out datetime,
room_id int,
FOREIGN KEY (room_id) REFERENCES room(room_id),
reservation_id int,
FOREIGN KEY (reservation_id) REFERENCES reservation(reservation_id)
);

create table hosted_at(
hosted_at_id int PRIMARY KEY identity(1,1),
guest_id int,
FOREIGN KEY (guest_id) REFERENCES guest(guest_id),
occupied_room_id int,
FOREIGN KEY (occupied_room_id) REFERENCES ocuppied_room(occupied_room_id)
);

create table reserved_room(
reserved_room_id int PRIMARY KEY identity(1,1),
number_of_rooms int,
room_type_id int,
FOREIGN KEY (room_type_id) REFERENCES room_type(room_type_id),
reservation_id int,
FOREIGN KEY (reservation_id) REFERENCES reservation(reservation_id),
status varchar(20)
);
