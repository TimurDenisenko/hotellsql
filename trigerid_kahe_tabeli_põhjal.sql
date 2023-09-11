--room ja room_type
--SQL server
CREATE TRIGGER roomLisamine
ON room
FOR INSERT
AS 
INSERT INTO logi(kuupaev,andmed,kasutaja)
SELECT GETDATE(),
CONCAT('room info: ',inserted.number,', ',inserted.name,'///  room type id: ',room_type.room_type_id),USER
FROM inserted
INNER JOIN room_type ON inserted.room_type_id=room_type.room_type_id
--kontroll
INSERT INTO room(number,name,status,smoke,room_type_id) VALUES('202','lupa','vaba',1,1);
SELECT * FROM room;
SELECT * FROM logi;


CREATE TRIGGER roomUuendamine
ON room
FOR UPDATE
AS 
INSERT INTO logi(kuupaev,andmed,kasutaja)
SELECT GETDATE(),
CONCAT('Vanad andmed (room info): ',deleted.number,', ',deleted.name,'==Vanad andmed (room type id):', r.room_type_id,
'///Uued andmed (room info): ',inserted.number,', ',i.name,'==Uued andmed (room type id):', r1.room_type_id),USER
FROM deleted
INNER JOIN inserted ON deleted.number=inserted.number
INNER JOIN inserted i ON deleted.name=i.name
INNER JOIN room_type r ON deleted.room_type_id=r.room_type_id
INNER JOIN room_type r1 ON inserted.room_type_id=r1.room_type_id
--kontroll
select * from room;
UPDATE room SET room_type_id=2
WHERE name='lupa';
SELECT * FROM room;
SELECT * from logi;

--XAMPP
INSERT INTO logi(kuupaev,andmed,kasutaja)
SELECT NOW(),
CONCAT('room info: ',NEW.number,', ',NEW.name,'///  room type id: ',rt.room_type_id),USER()
FROM room r
INNER JOIN room_type rt
ON r.room_type_id=rt.room_type_id
WHERE r.room_id=NEW.room_id


INSERT INTO logi(kuupaev,andmed,kasutaja)
SELECT NOW(),
CONCAT('Vanad andmed (room info): ',OLD.number,', ',OLD.name,'==Vanad andmed (room type id):', rt.room_type_id,
'///Uued andmed (room info): ',NEW.number,', ',NEW.name,'==Uued andmed (room type id):', rt1.room_type_id),USER()
FROM room r
INNER JOIN room_type rt ON OLD.room_type_id=rt.room_type_id
INNER JOIN room_type rt1 ON NEW.room_type_id=rt1.room_type_id
WHERE r.room_id=NEW.room_id

