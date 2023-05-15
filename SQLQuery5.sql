use learning
go

Create table email_extraction(
	id INTEGER  PRIMARY KEY ,	
	full_name VARCHAR(25) NOT NULL,
	email_id VARCHAR(50) 
	)

INSERT INTO email_extraction 
	VALUES(1,'Shishir Sachan','shishir.sachan710@gmail.com')

SELECT * FROM email_extraction

INSERT INTO email_extraction (id,full_name,email_id)
	VALUES(2,'Rahul Raj','rahulraj111@Kmail.com')

INSERT INTO email_extraction (id,full_name,email_id)
	SELECT
	5,'Riya kul', 'riyakul1010@yahoo.com'

DELETE  FROM email_extraction WHERE id = 4;

UPDATE email_extraction SET id = 4 where id = 5

SELECT *,LEN (email_id) AS Length_of_email_id ,LEFT ( email_id,CHARINDEX ('@',email_id)-1) + '@acc.com' AS Company_mail_id
FROM email_extraction

SELECT *, LEFT(email_id,
			PATINDEX('%[0-9]%',email_id)-1) + '@ss.com'
FROM email_extraction



SELECT email_id ,  
 
					LEFT(email_id, 
					PATINDEX('%[0-9]%',email_id) -1
					) a
					, LEFT(email_id,
					CHARINDEX ( '.',
						LEFT(email_id, 
					PATINDEX('%[0-9]%',email_id) -1
					)
					) 
					)b
FROM email_extraction



select * from email_extraction

UPDATE email_extraction
SET email_id = REPLACE(email_id, 'gmail', 'smail')

UPDATE email_extraction
SET email_id = SUBSTRING(email_id, 1, CHARINDEX('@',email_id))

UPDATE email_extraction SET email_id = REPLACE(email_id, '@', '@SSMAIL')

