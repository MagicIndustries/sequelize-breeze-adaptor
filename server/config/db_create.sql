/*
  SPAplatform Data Schema Build Script

  Created: 2014-12-24
  Updated: 2014-12-25
  Author:  Toby Tremayne <toby@magicindustries.net>

*/

CREATE TABLE spa_AnswerType
(
answerTypeID INTEGER NOT NULL AUTO_INCREMENT UNIQUE,
name VARCHAR(30) NOT NULL,
createdAt TIMESTAMP NOT NULL,
updatedAt TIMESTAMP NOT NULL,
createdBy INTEGER NOT NULL,
updatedBy INTEGER NOT NULL,
PRIMARY KEY (answerTypeID)
) ENGINE=InnoDB;

CREATE TABLE spa_LearningArea_LearningAreaCollection
(
learningAreaID INTEGER NOT NULL,
learningAreaCollectionID INTEGER NOT NULL,
createdAt TIMESTAMP NOT NULL,
updatedAt TIMESTAMP NOT NULL,
createdBy INTEGER NOT NULL,
updatedBy INTEGER NOT NULL
) ENGINE=InnoDB;

CREATE TABLE spa_Module
(
moduleID INTEGER NOT NULL AUTO_INCREMENT UNIQUE,
name VARCHAR(30) NOT NULL UNIQUE,
description VARCHAR(255),
basePrice DOUBLE PRECISION NOT NULL,
createdAt TIMESTAMP NOT NULL,
updatedAt TIMESTAMP NOT NULL,
createdBy INTEGER NOT NULL,
updatedBy INTEGER NOT NULL,
PRIMARY KEY (moduleID)
) ENGINE=InnoDB;

CREATE TABLE spa_ModulePrice
(
modulePriceID INTEGER NOT NULL AUTO_INCREMENT UNIQUE,
minQty INTEGER NOT NULL,
maxQty INTEGER NOT NULL,
price DOUBLE PRECISION NOT NULL,
moduleID INTEGER NOT NULL,
createdAt TIMESTAMP NOT NULL,
updatedAt TIMESTAMP NOT NULL,
createdBy INTEGER NOT NULL,
updatedBy INTEGER NOT NULL,
PRIMARY KEY (modulePriceID)
) ENGINE=InnoDB;


CREATE TABLE spa_Organization
(
organizationID INTEGER NOT NULL AUTO_INCREMENT UNIQUE,
name VARCHAR(30) NOT NULL,
description VARCHAR(255),
tenantID VARCHAR(100) NOT NULL UNIQUE,
createdAt TIMESTAMP NOT NULL,
updatedAt TIMESTAMP NOT NULL,
createdBy INTEGER NOT NULL,
updatedBy INTEGER NOT NULL,
PRIMARY KEY (organizationID)
) ENGINE=InnoDB;

CREATE VIEW spa_vOrganization AS
  SELECT  organizationID,
          name,
          description,
          tenantID,
          createdAt,
          updatedAt,
          createdBy,
          updatedBy
  FROM    spa_Organization
  WHERE   tenantID = user();

CREATE TABLE spa_LearningAreaCollection
(
learningAreaCollectionID INTEGER NOT NULL AUTO_INCREMENT UNIQUE,
name VARCHAR(30) NOT NULL,
organizationID INTEGER,
tenantID VARCHAR(100),
createdAt TIMESTAMP NOT NULL,
updatedAt TIMESTAMP NOT NULL,
createdBy INTEGER NOT NULL,
updatedBy INTEGER NOT NULL,
PRIMARY KEY (learningAreaCollectionID)
) ENGINE=InnoDB;


CREATE VIEW spa_vLearningAreaCollection AS
  SELECT  learningAreaCollectionID,
          name,
          organizationID,
          createdAt,
          updatedAt,
          createdBy,
          updatedBy
  FROM    spa_LearningAreaCollection
  WHERE   tenantID = user();

CREATE TABLE spa_learningArea
(
learningAreaID INTEGER NOT NULL AUTO_INCREMENT UNIQUE,
name VARCHAR(100) NOT NULL,
description VARCHAR(255),
tenantID VARCHAR(100),
organizationID INTEGER,
createdAt TIMESTAMP NOT NULL,
updatedAt TIMESTAMP NOT NULL,
createdBy INTEGER NOT NULL,
updatedBy INTEGER NOT NULL,
PRIMARY KEY (learningAreaID)
) ENGINE=InnoDB;

CREATE VIEW spa_vLearningArea AS
  SELECT  learningAreaID,
          name,
          description,
          organizationID,
          createdAt,
          updatedAt,
          createdBy,
          updatedBy
  FROM    spa_learningArea
  WHERE   tenantID = user();

CREATE TABLE spa_Answer
(
answerID INTEGER NOT NULL AUTO_INCREMENT UNIQUE,
testID INTEGER NOT NULL,
answerTypeID INTEGER NOT NULL,
organizationID INTEGER NOT NULL,
tenantID VARCHAR(100) NOT NULL,
value INTEGER,
createdAt TIMESTAMP NOT NULL,
updatedAt TIMESTAMP NOT NULL,
createdBy INTEGER NOT NULL,
updatedBy INTEGER NOT NULL,
PRIMARY KEY (answerID)
) ENGINE=InnoDB;

CREATE VIEW spa_vAnswer AS
  SELECT  answerID,
    testID,
    answerTypeID,
    value,
    organizationID,
    createdAt,
    updatedAt,
    createdBy,
    updatedBy
  FROM    spa_Answer
  WHERE   tenantID = user();


CREATE TABLE spa_OrganizationLicences
(
organizationLicenceID INTEGER NOT NULL AUTO_INCREMENT UNIQUE,
organizationID INTEGER NOT NULL,
tenantID VARCHAR(100),
moduleID INTEGER NOT NULL,
total INTEGER NOT NULL,
used INTEGER NOT NULL,
createdAt TIMESTAMP NOT NULL,
updatedAt TIMESTAMP NOT NULL,
createdBy INTEGER NOT NULL,
updatedBy INTEGER NOT NULL,
PRIMARY KEY (organizationLicenceID)
) ENGINE=InnoDB;

CREATE VIEW spa_vOrganizationLicences AS
  SELECT  organizationLicenceID,
    moduleID,
    total,
    used,
    organizationID,
    createdAt,
    updatedAt,
    createdBy,
    updatedBy
  FROM    spa_OrganizationLicences
  WHERE   tenantID = user();


CREATE TABLE spa_Permission
(
permissionID INTEGER NOT NULL AUTO_INCREMENT UNIQUE,
name VARCHAR(20) NOT NULL UNIQUE,
descriptions VARCHAR(255) NOT NULL,
createdAt TIMESTAMP NOT NULL,
updatedAt TIMESTAMP NOT NULL,
createdBy INTEGER NOT NULL,
updatedBy INTEGER NOT NULL,
PRIMARY KEY (permissionID)
) ENGINE=InnoDB;

CREATE TABLE spa_ResultType
(
resultTypeID INTEGER NOT NULL AUTO_INCREMENT UNIQUE,
name VARCHAR(30) NOT NULL,
description VARCHAR(255),
testTypeID INTEGER,
createdAt TIMESTAMP NOT NULL,
updatedAt TIMESTAMP NOT NULL,
createdBy INTEGER NOT NULL,
updatedBy INTEGER NOT NULL,
PRIMARY KEY (resultTypeID)
) ENGINE=InnoDB;

CREATE TABLE spa_Role
(
roleID INTEGER AUTO_INCREMENT UNIQUE,
name VARCHAR(20) NOT NULL,
description VARCHAR(255),
createdAt TIMESTAMP NOT NULL,
updatedAt TIMESTAMP NOT NULL,
createdBy INTEGER NOT NULL,
updatedBy INTEGER NOT NULL,
PRIMARY KEY (roleID)
) ENGINE=InnoDB;

CREATE TABLE spa_Role_Permission
(
roleID INTEGER NOT NULL,
permissionID INTEGER NOT NULL,
rolePermissionID INTEGER NOT NULL AUTO_INCREMENT UNIQUE,
createdAt TIMESTAMP NOT NULL,
updatedAt TIMESTAMP NOT NULL,
createdBy INTEGER NOT NULL,
updatedBy INTEGER NOT NULL,
PRIMARY KEY (rolePermissionID)
) ENGINE=InnoDB;

CREATE TABLE spa_Student
(
studentID INTEGER NOT NULL AUTO_INCREMENT UNIQUE,
firstName VARCHAR(20) NOT NULL,
surname VARCHAR(20) NOT NULL,
middleName VARCHAR(20),
studentIdentifier VARCHAR(20),
tenantID VARCHAR(100) NOT NULL,
organizationID INTEGER NOT NULL,
createdAt TIMESTAMP NOT NULL,
updatedAt TIMESTAMP NOT NULL,
createdBy INTEGER NOT NULL,
updatedBy INTEGER NOT NULL,
PRIMARY KEY (studentID)
) ENGINE=InnoDB;

CREATE VIEW spa_vStudent AS
  SELECT  studentID,
    firstName,
    surname,
    middleName,
    studentIdentifier,
    organizationID,
    createdAt,
    updatedAt,
    createdBy,
    updatedBy
  FROM    spa_Student
  WHERE   tenantID = user();


CREATE TABLE spa_Tenant
(
tenantID INTEGER NOT NULL AUTO_INCREMENT UNIQUE,
dbuser VARCHAR(255) NOT NULL,
dbPass VARCHAR(30) NOT NULL,
bActive TINYINT NOT NULL DEFAULT 1,
bLocked TINYINT NOT NULL DEFAULT 0,
createdAt TIMESTAMP NOT NULL,
updatedAt TIMESTAMP NOT NULL,
createdBy INTEGER NOT NULL,
updatedBy INTEGER NOT NULL,
PRIMARY KEY (tenantID)
) ENGINE=InnoDB;

CREATE TABLE spa_Result
(
resultID INTEGER NOT NULL AUTO_INCREMENT UNIQUE,
resultTypeID INTEGER NOT NULL,
testID INTEGER NOT NULL,
value VARCHAR(255),
tenantID VARCHAR(100) NOT NULL,
organizationID INTEGER NOT NULL,
studentID INTEGER NOT NULL,
createdAt TIMESTAMP NOT NULL,
updatedAt TIMESTAMP NOT NULL,
createdBy INTEGER NOT NULL,
updatedBy INTEGER NOT NULL,
PRIMARY KEY (resultID)
) ENGINE=InnoDB;

CREATE VIEW spa_vResult AS
  SELECT  resultID,
    resultTypeID,
    testID,
    studentID,
    value,
    organizationID,
    createdAt,
    updatedAt,
    createdBy,
    updatedBy
  FROM    spa_Result
  WHERE   tenantID = user();


CREATE TABLE spa_StudentAnswer
(
studentAnswerID INTEGER NOT NULL AUTO_INCREMENT UNIQUE,
answerTypeID INTEGER NOT NULL,
testID INTEGER NOT NULL,
organizationID INTEGER NOT NULL,
tenantID VARCHAR(100) NOT NULL,
value LONGTEXT,
studentID INTEGER NOT NULL,
createdAt TIMESTAMP NOT NULL,
updatedAt TIMESTAMP NOT NULL,
createdBy INTEGER NOT NULL,
updatedBy INTEGER NOT NULL,
PRIMARY KEY (studentAnswerID)
) ENGINE=InnoDB;

CREATE VIEW spa_vStudentAnswer AS
  SELECT  studentAnswerID,
    answerTypeID,
    testID,
    studentID,
    value,
    organizationID,
    createdAt,
    updatedAt,
    createdBy,
    updatedBy
  FROM    spa_StudentAnswer
  WHERE   tenantID = user();

CREATE TABLE spa_TestItemType
(
testItemTypeID INTEGER NOT NULL AUTO_INCREMENT UNIQUE,
name VARCHAR(30) NOT NULL,
description VARCHAR(255),
createdAt TIMESTAMP NOT NULL,
updatedAt TIMESTAMP NOT NULL,
createdBy INTEGER NOT NULL,
updatedBy INTEGER NOT NULL,
PRIMARY KEY (testItemTypeID)
) ENGINE=InnoDB;

CREATE TABLE spa_TestItem
(
testItemID INTEGER NOT NULL AUTO_INCREMENT UNIQUE,
testItemTypeID INTEGER NOT NULL,
organizationID INTEGER NOT NULL,
tenantID VARCHAR(100) NOT NULL,
bAnswerable TINYINT NOT NULL DEFAULT 1,
name VARCHAR(100),
description LONGTEXT,
identifier VARCHAR(255),
identifierLabel VARCHAR(255),
levelID INTEGER,
answerTypeID INTEGER,
createdAt TIMESTAMP NOT NULL,
updatedAt TIMESTAMP NOT NULL,
createdBy INTEGER NOT NULL,
updatedBy INTEGER NOT NULL,
PRIMARY KEY (testItemID)
) ENGINE=InnoDB;

CREATE VIEW spa_vTestItem AS
  SELECT  testItemID,
    testItemTypeID,
    bAnswerable,
    name,
    description,
    identifier,
    identifierLabel,
    levelID,
    answerTypeID,
    organizationID,
    createdAt,
    updatedAt,
    createdBy,
    updatedBy
  FROM    spa_TestItem
  WHERE   tenantID = user();


CREATE TABLE spa_TestType
(
testTypeID INTEGER NOT NULL AUTO_INCREMENT UNIQUE,
name VARCHAR(30) NOT NULL,
description VARCHAR(255),
createdAt TIMESTAMP NOT NULL,
updatedAt TIMESTAMP NOT NULL,
createdBy INTEGER NOT NULL,
updatedBy INTEGER NOT NULL,
PRIMARY KEY (testTypeID)
) ENGINE=InnoDB;

CREATE TABLE spa_Test
(
testID INTEGER NOT NULL AUTO_INCREMENT UNIQUE,
name VARCHAR(255) NOT NULL,
description VARCHAR(255),
organizationID INTEGER NOT NULL,
tenantID VARCHAR(100) NOT NULL,
bActive TINYINT NOT NULL DEFAULT 1,
bPrivate TINYINT NOT NULL DEFAULT 0,
bPublished TINYINT NOT NULL DEFAULT 0,
testTypeID INTEGER NOT NULL,
testTemplateID INTEGER,
createdAt TIMESTAMP NOT NULL,
updatedAt TIMESTAMP NOT NULL,
createdBy INTEGER NOT NULL,
updatedBy INTEGER NOT NULL,
PRIMARY KEY (testID)
) ENGINE=InnoDB;

CREATE VIEW spa_vTest AS
  SELECT  testId,
    name,
    description,
    bActive,
    bPrivate,
    bPublished,
    testTypeID,
    testTemplateID,
    organizationID,
    createdAt,
    updatedAt,
    createdBy,
    updatedBy
  FROM    spa_Test
  WHERE   tenantID = user();

CREATE TABLE spa_User
(
userID INTEGER NOT NULL AUTO_INCREMENT UNIQUE,
username VARCHAR(20) NOT NULL,
password VARCHAR(30) NOT NULL,
email VARCHAR(255) NOT NULL,
firstName VARCHAR(20) NOT NULL,
surname VARCHAR(20) NOT NULL,
middleName VARCHAR(20),
bActive TINYINT NOT NULL DEFAULT 1,
bLocked TINYINT NOT NULL DEFAULT 0,
firstLogin TIMESTAMP,
lastLogin TIMESTAMP,
createdAt TIMESTAMP NOT NULL,
updatedAt TIMESTAMP NOT NULL,
createdBy INTEGER NOT NULL,
updatedBy INTEGER NOT NULL,
PRIMARY KEY (userID)
) ENGINE=InnoDB;

CREATE TABLE spa_Cohort
(
cohortID INTEGER NOT NULL AUTO_INCREMENT UNIQUE,
name VARCHAR(30) NOT NULL,
description VARBINARY(255),
organizationID INTEGER NOT NULL,
tenantID VARCHAR(100) NOT NULL,
bSelectable TINYINT NOT NULL DEFAULT 1,
bActive TINYINT NOT NULL DEFAULT 1,
bPrivate TINYINT NOT NULL DEFAULT 0,
createdAt TIMESTAMP NOT NULL,
updatedAt TIMESTAMP NOT NULL,
createdBy INTEGER NOT NULL,
updatedBy INTEGER NOT NULL,
PRIMARY KEY (cohortID)
) ENGINE=InnoDB;

CREATE VIEW spa_vCohort AS
  SELECT  cohortID,
    name,
    description,
    bSelectable,
    bActive,
    bPrivate,
    organizationID,
    createdAt,
    updatedAt,
    createdBy,
    updatedBy
  FROM    spa_Cohort
  WHERE   tenantID = user();


CREATE TABLE spa_TestTemplate
(
testTemplateID INTEGER NOT NULL AUTO_INCREMENT UNIQUE,
name VARCHAR(50) NOT NULL,
description VARCHAR(255),
organizationID INTEGER NOT NULL,
tenantID VARCHAR(100) NOT NULL,
bPrivate TINYINT NOT NULL DEFAULT 0,
bPublished TINYINT NOT NULL DEFAULT 0,
testTypeID INTEGER NOT NULL,
createdAt TIMESTAMP NOT NULL,
updatedAt TIMESTAMP NOT NULL,
createdBy INTEGER NOT NULL,
updatedBy INTEGER NOT NULL,
PRIMARY KEY (testTemplateID)
) ENGINE=InnoDB;

CREATE VIEW spa_vTestTemplate AS
  SELECT  testTemplateID,
    name,
    description,
    bPrivate,
    bPublished,
    testTypeID,
    organizationID,
    createdAt,
    updatedAt,
    createdBy,
    updatedBy
  FROM    spa_TestTemplate
  WHERE   tenantID = user();

CREATE TABLE spa_TestResultSet
(
testResultSetID INTEGER NOT NULL AUTO_INCREMENT UNIQUE,
tenantID VARCHAR(100) NOT NULL,
organizationID INTEGER NOT NULL,
testID INTEGER NOT NULL,
bLocked TINYINT NOT NULL DEFAULT 0,
testDate TIMESTAMP NOT NULL,
createdAt TIMESTAMP NOT NULL,
updatedAt TIMESTAMP NOT NULL,
createdBy INTEGER NOT NULL,
updatedBy INTEGER NOT NULL,
PRIMARY KEY (testResultSetID)
) ENGINE=InnoDB;

CREATE VIEW spa_vTestResultSet AS
  SELECT  testResultSetID,
    testID,
    bLocked,
    testDate,
    organizationID,
    createdAt,
    updatedAt,
    createdBy,
    updatedBy
  FROM    spa_TestResultSet
  WHERE   tenantID = user();

CREATE TABLE spa_User_Role
(
userRoleID INTEGER NOT NULL AUTO_INCREMENT UNIQUE,
userID INTEGER NOT NULL,
roleID INTEGER NOT NULL,
tenantID VARCHAR(100) NOT NULL,
organizationID INTEGER NOT NULL,
createdAt TIMESTAMP NOT NULL,
updatedAt TIMESTAMP NOT NULL,
createdBy INTEGER NOT NULL,
updatedBy INTEGER NOT NULL,
PRIMARY KEY (userRoleID)
) ENGINE=InnoDB;

CREATE VIEW spa_vUser_Role AS
  SELECT  userRoleID,
    userID,
    roleID,
    organizationID,
    createdAt,
    updatedAt,
    createdBy,
    updatedBy
  FROM    spa_User_Role
  WHERE   tenantID = user();

CREATE TABLE spa_User_Tenant_Organization
(
userTenantOrganizationID INTEGER NOT NULL AUTO_INCREMENT UNIQUE,
userID INTEGER NOT NULL,
organizationID INTEGER NOT NULL,
tenantID INTEGER NOT NULL,
createdAt TIMESTAMP NOT NULL,
updatedAt TIMESTAMP NOT NULL,
createdBy INTEGER NOT NULL,
updatedBy INTEGER NOT NULL,
PRIMARY KEY (userTenantOrganizationID)
) ENGINE=InnoDB;

ALTER TABLE spa_LearningArea_LearningAreaCollection ADD FOREIGN KEY learningAreaID_idxfk (learningAreaID) REFERENCES spa_LearningArea (learningAreaID);

ALTER TABLE spa_LearningArea_LearningAreaCollection ADD FOREIGN KEY learningAreaCollectionID_idxfk (learningAreaCollectionID) REFERENCES spa_LearningAreaCollection (learningAreaCollectionID);

ALTER TABLE spa_ModulePrice ADD FOREIGN KEY moduleID_idxfk (moduleID) REFERENCES spa_Module (moduleID);

ALTER TABLE spa_LearningAreaCollection ADD FOREIGN KEY organizationID_idxfk (organizationID) REFERENCES spa_Organization (organizationID);

ALTER TABLE spa_learningArea ADD FOREIGN KEY organizationID_idxfk_1 (organizationID) REFERENCES spa_Organization (organizationID);

ALTER TABLE spa_Answer ADD FOREIGN KEY organizationID_idxfk_2 (organizationID) REFERENCES spa_Organization (organizationID);

ALTER TABLE spa_OrganizationLicences ADD FOREIGN KEY organizationID_idxfk_3 (organizationID) REFERENCES spa_Organization (organizationID);

ALTER TABLE spa_OrganizationLicences ADD FOREIGN KEY moduleID_idxfk_1 (moduleID) REFERENCES spa_Module (moduleID);

CREATE INDEX roleID_idx ON spa_Role (roleID);
ALTER TABLE spa_Role_Permission ADD FOREIGN KEY roleID_idxfk (roleID) REFERENCES spa_Role (roleID);

ALTER TABLE spa_Role_Permission ADD FOREIGN KEY permissionID_idxfk (permissionID) REFERENCES spa_Permission (permissionID);

ALTER TABLE spa_Student ADD FOREIGN KEY organizationID_idxfk_4 (organizationID) REFERENCES spa_Organization (organizationID);

ALTER TABLE spa_Result ADD FOREIGN KEY resultTypeID_idxfk (resultTypeID) REFERENCES spa_ResultType (resultTypeID);

ALTER TABLE spa_Result ADD FOREIGN KEY testID_idxfk (testID) REFERENCES spa_Test (testID);

ALTER TABLE spa_Result ADD FOREIGN KEY organizationID_idxfk_5 (organizationID) REFERENCES spa_Organization (organizationID);

ALTER TABLE spa_Result ADD FOREIGN KEY studentID_idxfk (studentID) REFERENCES spa_Student (studentID);

ALTER TABLE spa_StudentAnswer ADD FOREIGN KEY answerTypeID_idxfk (answerTypeID) REFERENCES spa_AnswerType (answerTypeID);

ALTER TABLE spa_StudentAnswer ADD FOREIGN KEY testID_idxfk_1 (testID) REFERENCES spa_Test (testID);

ALTER TABLE spa_StudentAnswer ADD FOREIGN KEY organizationID_idxfk_6 (organizationID) REFERENCES spa_OrganizationLicences (organizationLicenceID);

ALTER TABLE spa_StudentAnswer ADD FOREIGN KEY studentID_idxfk_1 (studentID) REFERENCES spa_Student (studentID);

ALTER TABLE spa_TestItem ADD FOREIGN KEY testItemTypeID_idxfk (testItemTypeID) REFERENCES spa_TestItemType (testItemTypeID);

ALTER TABLE spa_TestItem ADD FOREIGN KEY organizationID_idxfk_7 (organizationID) REFERENCES spa_Organization (organizationID);

ALTER TABLE spa_Test ADD FOREIGN KEY organizationID_idxfk_8 (organizationID) REFERENCES spa_Organization (organizationID);

ALTER TABLE spa_Test ADD FOREIGN KEY testTypeID_idxfk (testTypeID) REFERENCES spa_TestType (testTypeID);

ALTER TABLE spa_Test ADD FOREIGN KEY testTemplateID_idxfk (testTemplateID) REFERENCES spa_TestTemplate (testTemplateID);

ALTER TABLE spa_Cohort ADD FOREIGN KEY organizationID_idxfk_9 (organizationID) REFERENCES spa_Organization (organizationID);

ALTER TABLE spa_Cohort ADD FOREIGN KEY createdBy_idxfk (createdBy) REFERENCES spa_User (userID);

ALTER TABLE spa_TestTemplate ADD FOREIGN KEY organizationID_idxfk_10 (organizationID) REFERENCES spa_Organization (organizationID);

ALTER TABLE spa_TestTemplate ADD FOREIGN KEY createdBy_idxfk_1 (createdBy) REFERENCES spa_User (userID);

ALTER TABLE spa_TestTemplate ADD FOREIGN KEY testTypeID_idxfk_1 (testTypeID) REFERENCES spa_TestType (testTypeID);

ALTER TABLE spa_TestResultSet ADD FOREIGN KEY organizationID_idxfk_11 (organizationID) REFERENCES spa_Organization (organizationID);

ALTER TABLE spa_TestResultSet ADD FOREIGN KEY testID_idxfk_2 (testID) REFERENCES spa_Test (testID);

ALTER TABLE spa_TestResultSet ADD FOREIGN KEY createdBy_idxfk_2 (createdBy) REFERENCES spa_User (userID);

ALTER TABLE spa_User_Role ADD FOREIGN KEY userID_idxfk (userID) REFERENCES spa_User (userID);

ALTER TABLE spa_User_Role ADD FOREIGN KEY roleID_idxfk_1 (roleID) REFERENCES spa_Role (roleID);

ALTER TABLE spa_User_Role ADD FOREIGN KEY organizationID_idxfk_12 (organizationID) REFERENCES spa_Organization (organizationID);

ALTER TABLE spa_User_Tenant_Organization ADD FOREIGN KEY userID_idxfk_1 (userID) REFERENCES spa_User (userID);

ALTER TABLE spa_User_Tenant_Organization ADD FOREIGN KEY organizationID_idxfk_13 (organizationID) REFERENCES spa_Organization (organizationID);

ALTER TABLE spa_User_Tenant_Organization ADD FOREIGN KEY tenantID_idxfk (tenantID) REFERENCES spa_Tenant (tenantID);
