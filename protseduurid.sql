--Protseduurid - tabel -guest
USE hotellDenisenko 
go
CREATE PROCEDURE lisaGuest
@first_name varchar(80),
@last_name varchar(80),
@member_since datetime
AS
BEGIN
INSERT INTO guest(first_name,last_name,member_since) 
VALUES (@first_name,@last_name,@member_since);
SELECT * FROM guest;
END
--käivitamine
EXEC lisaGuest @first_name='Nikolai',@last_name='Baskakov',@member_since='2021-09-09'

USE hotellDenisenko 
go
CREATE PROCEDURE kustutaGuest
@kustutaId int
AS
BEGIN
SELECT * FROM guest ;
DELETE FROM guest 
WHERE guest_id=@kustutaId;
SELECT * FROM guest;
END
--kustutamine
EXEC kustutaGuest 4

--Andmete uuendamine sisetatud id järgi
--
USE hotellDenisenko 
go
CREATE PROCEDURE uuendaGuest
@uusnimi varchar(25),
@id int
AS
BEGIN
SELECT * FROM guest ;
UPDATE guest SET first_name=@uusnimi
WHERE guest_id=@id;
SELECT * FROM guest;
END
--
EXEC uuendaGuest @uusnimi='Timuuuuuuuuur',@id=2
