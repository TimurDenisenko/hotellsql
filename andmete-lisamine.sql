INSERT INTO room_type(description, max_capacity) VALUES('description',2);
INSERT INTO room_type(description, max_capacity) VALUES('description',1);
INSERT INTO room_type(description, max_capacity) VALUES('description',5);
INSERT INTO room_type(description, max_capacity) VALUES('description',4);
INSERT INTO room_type(description, max_capacity) VALUES('description',3);

INSERT INTO room(number,name,status,smoke,room_type_id) VALUES('202','lupa','vaba',1,11);
INSERT INTO room(number,name,status,smoke,room_type_id) VALUES('101','luka','ei vaba',0,12);
INSERT INTO room(number,name,status,smoke,room_type_id) VALUES('303','pula','vaba',1,13);
INSERT INTO room(number,name,status,smoke,room_type_id) VALUES('404','kula','ei vaba',0,14);
INSERT INTO room(number,name,status,smoke,room_type_id) VALUES('505','akula','vaba',1,15);

INSERT INTO guest(first_name,last_name,member_since) VALUES('Timur','Denisenko','2022-5-6');
INSERT INTO guest(first_name,last_name,member_since) VALUES('Luka','Gluhov','2021-7-5');
INSERT INTO guest(first_name,last_name,member_since) VALUES('Deniss','Gorjunov','2023-5-3');
INSERT INTO guest(first_name,last_name,member_since) VALUES('Aleksander','Rogovski','2024-2-5');
INSERT INTO guest(first_name,last_name,member_since) VALUES('Irina','Merkulova','2020-1-15');

INSERT INTO reservation(date_in,date_out,made_by,guest_id) VALUES('2022-05-05','2022-06-06','Timur',1);
INSERT INTO reservation(date_in,date_out,made_by,guest_id) VALUES('2022-04-4','2023-06-06','Luka',2);
INSERT INTO reservation(date_in,date_out,made_by,guest_id) VALUES('2021-05-05','2022-06-07','Deniss',3);
INSERT INTO reservation(date_in,date_out,made_by,guest_id) VALUES('2022-06-05','2022-10-06','Aleksander',4);
INSERT INTO reservation(date_in,date_out,made_by,guest_id) VALUES('2022-05-05','2022-05-06','Irina',5);

INSERT INTO ocuppied_room(check_in,check_out,room_id,reservation_id) VALUES('2022-05-05 1:5:5','2022-05-05 2:5:5',6,1);
INSERT INTO ocuppied_room(check_in,check_out,room_id,reservation_id) VALUES('2022-05-05 1:5:5','2023-05-05 2:5:5',7,2);
INSERT INTO ocuppied_room(check_in,check_out,room_id,reservation_id) VALUES('2021-05-05 1:5:5','2022-05-05 2:5:5',8,3);
INSERT INTO ocuppied_room(check_in,check_out,room_id,reservation_id) VALUES('2022-05-05 1:5:5','2022-05-06 2:5:5',9,4);
INSERT INTO ocuppied_room(check_in,check_out,room_id,reservation_id) VALUES('2022-05-05 1:5:5','2022-07-05 2:5:5',10,5);

INSERT INTO hosted_at(guest_id,occupied_room_id) VALUES(1,1);
INSERT INTO hosted_at(guest_id,occupied_room_id) VALUES(2,3);
INSERT INTO hosted_at(guest_id,occupied_room_id) VALUES(3,2);
INSERT INTO hosted_at(guest_id,occupied_room_id) VALUES(5,4);
INSERT INTO hosted_at(guest_id,occupied_room_id) VALUES(4,5);

INSERT INTO reserved_room(number_of_rooms,room_type_id,reservation_id,status) VALUES(1,11,1,'vaba');
INSERT INTO reserved_room(number_of_rooms,room_type_id,reservation_id,status) VALUES(1,12,2,'ei vaba');
INSERT INTO reserved_room(number_of_rooms,room_type_id,reservation_id,status) VALUES(1,13,3,'vaba');
INSERT INTO reserved_room(number_of_rooms,room_type_id,reservation_id,status) VALUES(1,14,4,'ei vaba');
INSERT INTO reserved_room(number_of_rooms,room_type_id,reservation_id,status) VALUES(1,15,5,'vaba');
