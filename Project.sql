-- Database Creation
CREATE DATABASE cameo
USE cameo

-- Table Creation
CREATE TABLE login_roles(roleId INT IDENTITY(1,1) PRIMARY KEY, roles CHAR(20));
SELECT * FROM login_roles;

CREATE TABLE proof (proof INT IDENTITY(1,1) PRIMARY KEY,[ID Proof Type] CHAR(25));
SELECT * FROM proof;

CREATE TABLE users
(userID INT identity(1,1) PRIMARY KEY,
roleID INT FOREIGN KEY REFERENCES login_roles,
fullName VARCHAR(150),emailID VARCHAR(100) UNIQUE,
displayName VARCHAR(50),
password NVARCHAR(100),
birthDate DateTime,
proofID INT FOREIGN KEY REFERENCES proof,
IDvalue VARCHAR(50),
isTermsAndConditionsAccepted BIT);
SELECT * FROM users;

CREATE TABLE videoRequest(requestID INT IDENTITY(1,1) PRIMARY KEY, userID INT, celebrityID INT, dateOfRequest DATETIME, isApproved BIT);
SELECT * FROM videoRequest;

ALTER TABLE videoRequest
ADD Constraint fk_celebrityID
FOREIGN KEY (celebrityID) REFERENCES users(userID);

ALTER TABLE videoRequest
ADD eventTime DATETIME;
SELECT * FROM videoRequest;

drop table celebrityVideo;
CREATE TABLE celebrityVideo(videoID INT IDENTITY(1,1) PRIMARY KEY,requestID INT FOREIGN KEY REFERENCES videoRequest(requestID),
												NameOfVideo VARCHAR(50),isApproved BIT);
SELECT * FROM celebrityVideo;

CREATE TABLE likes(likesId INT IDENTITY(1,1) PRIMARY KEY,likedBy INT FOREIGN KEY REFERENCES users(userID));
SELECT * FROM likes;

CREATE TABLE followingMaster(ID INT IDENTITY(1,1) PRIMARY KEY,videoID INT FOREIGN KEY REFERENCES celebrityVideo(videoID),
								requestID INT FOREIGN KEY REFERENCES videoRequest(requestID), commentsID INT, likesID INT);
SELECT * FROM followingMaster;

CREATE TABLE comments(commentsID INT IDENTITY(1,1) PRIMARY KEY, comment VARCHAR(50));
SELECT * FROM comments;

ALTER TABLE followingMaster
ADD CONSTRAINT FK_commentsID
FOREIGN KEY (commentsID) REFERENCES comments(commentsID);

ALTER TABLE followingMaster
ADD CONSTRAINT FK_likesID
FOREIGN KEY (likesID) REFERENCES likes(likesID);


CREATE TABLE paymentMode(paymentTypeID INT IDENTITY(1,1) PRIMARY KEY, paymentType VARCHAR(20));
SELECT * FROM paymentMode;

CREATE TABLE paymentDetails(paymentID INT IDENTITY(1,1) PRIMARY KEY, requestID INT FOREIGN KEY REFERENCES videoRequest(requestID),
							paymentTypeID INT FOREIGN KEY REFERENCES paymentMode(paymentTypeID),paymentMadeInDollars DECIMAL(18,2),
							transactionID NVARCHAR(50), OTP CHAR(6));
SELECT * FROM paymentDetails;


CREATE TABLE moduleMaster (moduleID INT IDENTITY(1,1) PRIMARY KEY, moduleName VARCHAR(50));
SELECT * FROM moduleMaster;

CREATE TABLE subModuleMaster(subModuleID INT IDENTITY(1,1) PRIMARY KEY,moduleID INT FOREIGN KEY REFERENCES moduleMaster(moduleID),
							subModuleName VARCHAR(50));

CREATE TABLE pageMaster(pageID INT IDENTITY(1,1) PRIMARY KEY, subModuleID INT FOREIGN KEY REFERENCES subModuleMaster(subModuleID),
						pageName VARCHAR(50));

CREATE TABLE actionMaster(actionID INT IDENTITY(1,1) PRIMARY KEY, pageID INT FOREIGN KEY REFERENCES pageMaster(pageID),
						actionName VARCHAR(50));

CREATE TABLE permission(roleID INT FOREIGN KEY REFERENCES login_roles(roleID),
moduleID INT FOREIGN KEY REFERENCES moduleMaster(moduleID),
subModuleID INT FOREIGN KEY REFERENCES subModuleMaster(subModuleID),
pageID INT FOREIGN KEY REFERENCES pageMaster(pageID),
actionID INT FOREIGN KEY REFERENCES actionMaster(actionID));

-- Data Insertion
SELECT * FROM login_roles;
INSERT INTO login_roles(roles)
VALUES ('Admin Role');
INSERT INTO login_roles(roles)
VALUES ('Customer Role');
INSERT INTO login_roles(roles)
VALUES ('Talent Role');

SELECT * FROM proof;
INSERT INTO proof([ID Proof Type])
VALUES ('Aadhar');
INSERT INTO proof([ID Proof Type])
VALUES ('Password');
INSERT INTO proof([ID Proof Type])
VALUES ('PAN');

SELECT * FROM users;
INSERT INTO users(roleID,fullName,emailID,displayName,[password],birthDate,proofID,IDvalue,isTermsAndConditionsAccepted)
VALUES (2,'Rachel Green','rachelgreen@gmail.com','Rachel',HASHBYTES('SHA2_512','Rachel'), '1990-01-30',2,'T155590978',1);
INSERT INTO users(roleID,fullName,emailID,displayName,[password],birthDate,proofID,IDvalue,isTermsAndConditionsAccepted)
VALUES (3,'Jen Aniston','jenaniston@gmail.com','Jennifer',HASHBYTES('SHA2_512','Jen'), '1980-02-25',2,'K155590978',1);
INSERT INTO users(roleID,fullName,emailID,displayName,[password],birthDate,proofID,IDvalue,isTermsAndConditionsAccepted)
VALUES (2,'Ross Geller','rossgeller@gmail.com','Ross',HASHBYTES('SHA2_512','Ross'), '1985-01-12',2,'T111590978',1);

INSERT INTO videoRequest(userID, celebrityID,dateOfRequest,eventTime,isApproved)
VALUES(1,2,GETUTCDATE()-1,GETUTCDATE()+4,1);
SELECT * FROM videoRequest;

SELECT * FROM celebrityVideo;
INSERT INTO celebrityVideo(requestID, NameOfVideo, isApproved)
VALUES(1,'Anniversary',1);


INSERT INTO comments(comment)
VALUES('Great video. loving it');
SELECT * FROM comments;

INSERT INTO likes(likedBy)
VALUES (3)
SELECT * FROM likes;

INSERT INTO followingMaster(videoID, requestID, commentsID, likesID)
VALUES (3,1,1,1);
SELECT * FROM followingMaster;

INSERT INTO paymentMode(paymentType)
VALUES('Paypal'); 
INSERT INTO paymentMode(paymentType)
VALUES('Zelle'); 
INSERT INTO paymentMode(paymentType)
VALUES('GooglePay'); 

INSERT INTO paymentDetails(requestID, paymentTypeID, paymentMadeInDollars, transactionID, OTP)
VALUES(1,2,200,2001,'xq8w'); 
SELECT * FROM paymentDetails;

