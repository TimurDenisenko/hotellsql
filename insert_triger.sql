CREATE TRIGGER guestLisamine
ON guest 
FOR INSERT
AS
INSERT INTO logi(kuupaev,kasutaja,andmed,tegevus)
SELECT GETDATE(), USER, 
CONCAT(inserted.first_name,', ',inserted.last_name,', ',' ,',inserted.member_since),'guest on lisatud'
FROM inserted
--kontroll
INSERT INTO guest(first_name,last_name,member_since) VALUES('Timur','Denisenko','2022-5-6');
select * from guest;
select * from logi;

CREATE TRIGGER guestKustuta
ON guest 
FOR DELETE
AS
INSERT INTO logi(kuupaev,kasutaja,andmed,tegevus)
SELECT GETDATE(), USER, 
CONCAT(deleted.first_name,', ',deleted.last_name,', ',' ,',deleted.member_since),'guest on kustutatud'
FROM deleted
--kontroll
DELETE from guest where guest_id=1;
select * from guest;
select * from logi;

CREATE TRIGGER guestUuendamine
ON guest 
FOR UPDATE
AS
INSERT INTO logi(kuupaev,kasutaja,andmed,tegevus)
SELECT GETDATE(), USER, 
CONCAT('vanad andmed: ',deleted.first_name,', ',deleted.last_name,', ',' ,',deleted.member_since,
'\n uued andmed: ',inserted.first_name,', ',inserted.last_name,', ',' ,',inserted.member_since),'guest on uuendatud'
FROM deleted INNER JOIN inserted
ON deleted.guest_id=inserted.guest_id
--kontroll
select * from guest;
update guest set first_name='Timur' where guest_id=2;
select * from guest;
select * from logi;

CREATE TRIGGER roomLisamine
ON room 
FOR INSERT
AS
INSERT INTO logi(kuupaev,kasutaja,andmed,tegevus)
SELECT GETDATE(), USER, 
CONCAT(inserted.number,', ',inserted.name,', ',' ,',inserted.status,', ',inserted.smoke),'room on lisatud'
FROM inserted
--kontroll
INSERT INTO room(number,name,status,smoke) VALUES('505','akula','vaba',1);
select * from room;
select * from logi;

CREATE TRIGGER roomKustuta
ON room 
FOR DELETE
AS
INSERT INTO logi(kuupaev,kasutaja,andmed,tegevus)
SELECT GETDATE(), USER, 
CONCAT(deleted.number,', ',deleted.name,', ',' ,',deleted.status,', ',deleted.smoke),'room on kustutatud'
FROM deleted
--kontroll
select * from room;
DELETE from room where room_id=3;
select * from room;
select * from logi;

CREATE TRIGGER roomUuendamine
ON room 
FOR UPDATE
AS
INSERT INTO logi(kuupaev,kasutaja,andmed,tegevus)
SELECT GETDATE(), USER, 
CONCAT('vanad andmed: ',deleted.number,', ',deleted.name,', ',' ,',deleted.status,', ',deleted.smoke,
'\n uued andmed: ',inserted.number,', ',inserted.name,', ',' ,',inserted.status,', ',inserted.smoke),'room on uuendatud'
FROM deleted INNER JOIN inserted
ON deleted.room_id=inserted.room_id
--kontroll
select * from room;
update room set number='999' where room_id=4;
select * from room;
select * from logi;
