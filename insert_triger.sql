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
FROM deleted, inserted
--kontroll
update guest set first_name='Timuuuur' where guest_id=2;
select * from guest;
select * from logi;
