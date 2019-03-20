
drop table student_course;
drop table course;
drop table student;

CREATE TABLE Course
  (
    Course_ID   INTEGER NOT NULL ,
    Course_Name VARCHAR2 (40)
  ) ;
ALTER TABLE Course ADD CONSTRAINT Course_PK PRIMARY KEY ( Course_ID ) ;

CREATE TABLE Student
  (
    Student_ID INTEGER NOT NULL ,
    Last_Name  VARCHAR2 (30) ,
    First_Name VARCHAR2 (25)
  ) ;
ALTER TABLE Student ADD CONSTRAINT Student_PK PRIMARY KEY ( Student_ID ) ;

CREATE TABLE Student_Course
  (
    Student_Student_ID INTEGER NOT NULL ,
    Course_Course_ID   INTEGER NOT NULL
  ) ;
ALTER TABLE Student_Course ADD CONSTRAINT Student_Course_PK PRIMARY KEY ( Student_Student_ID, Course_Course_ID ) ;

ALTER TABLE Student_Course ADD CONSTRAINT FK_ASS_1 FOREIGN KEY ( Student_Student_ID ) REFERENCES Student ( Student_ID ) ;

ALTER TABLE Student_Course ADD CONSTRAINT FK_ASS_2 FOREIGN KEY ( Course_Course_ID ) REFERENCES Course ( Course_ID ) ;


-- Oracle SQL Developer Data Modeler Summary Report: 
-- 
-- CREATE TABLE                             3
-- CREATE INDEX                             0
-- ALTER TABLE                              5
-- CREATE VIEW                              0
-- CREATE PACKAGE                           0
-- CREATE PACKAGE BODY                      0
-- CREATE PROCEDURE                         0
-- CREATE FUNCTION                          0
-- CREATE TRIGGER                           0
-- ALTER TRIGGER                            0
-- CREATE COLLECTION TYPE                   0
-- CREATE STRUCTURED TYPE                   0
-- CREATE STRUCTURED TYPE BODY              0
-- CREATE CLUSTER                           0
-- CREATE CONTEXT                           0
-- CREATE DATABASE                          0
-- CREATE DIMENSION                         0
-- CREATE DIRECTORY                         0
-- CREATE DISK GROUP                        0
-- CREATE ROLE                              0
-- CREATE ROLLBACK SEGMENT                  0
-- CREATE SEQUENCE                          0
-- CREATE MATERIALIZED VIEW                 0
-- CREATE SYNONYM                           0
-- CREATE TABLESPACE                        0
-- CREATE USER                              0
-- 
-- DROP TABLESPACE                          0
-- DROP DATABASE                            0
-- 
-- REDACTION POLICY                         0
-- 
-- ERRORS                                   0
-- WARNINGS                                 0
