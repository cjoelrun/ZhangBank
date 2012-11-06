  CREATE TABLE  "USERS" 
     (    "ID" NUMBER NOT NULL ENABLE, 
          "SALT" VARCHAR2(45) NOT NULL ENABLE, 
          "PW" VARCHAR2(45) NOT NULL ENABLE, 
          "USERNAME" VARCHAR2(50) NOT NULL ENABLE, 
           CONSTRAINT "USERS_PK" PRIMARY KEY ("ID") ENABLE
     )
  /
  
  CREATE OR REPLACE TRIGGER  "BI_USERS" 
    before insert on "USERS"               
    for each row  
  begin   
      select "USERS_SEQ".nextval into :NEW.ID from dual; 
  end; 
  
  /
  ALTER TRIGGER  "BI_USERS" ENABLE
  /

  CREATE TABLE  "ROLE" 
     (    "ID" NUMBER, 
          "NAME" VARCHAR2(45), 
           CONSTRAINT "ROLE_PK" PRIMARY KEY ("ID") ENABLE
     )
  /
  
  CREATE OR REPLACE TRIGGER  "BI_ROLE" 
    before insert on "ROLE"               
    for each row  
  begin   
      select "ROLE_SEQ".nextval into :NEW.ID from dual; 
  end; 
  
  /
  ALTER TRIGGER  "BI_ROLE" ENABLE
  /

  CREATE TABLE  "USERROLE" 
     (    "USER_ID" NUMBER NOT NULL ENABLE, 
          "ROLE_ID" NUMBER NOT NULL ENABLE, 
           CONSTRAINT "USERROLE_PK" PRIMARY KEY ("USER_ID") ENABLE, 
           CONSTRAINT "USERROLE_FK" FOREIGN KEY ("USER_ID")
            REFERENCES  "USERS" ("ID") ENABLE, 
           CONSTRAINT "USERROLE_FK2" FOREIGN KEY ("ROLE_ID")
            REFERENCES  "ROLE" ("ID") ENABLE
     )
  /
  
  CREATE OR REPLACE TRIGGER  "BI_USERROLE" 
    before insert on "USERROLE"               
    for each row  
  begin   
      select "USERROLE_SEQ".nextval into :NEW.USER_ID from dual; 
  end; 
  
  /
  ALTER TRIGGER  "BI_USERROLE" ENABLE
  /

  CREATE TABLE  "PROFESSOR" 
     (    "NAME" VARCHAR2(50) NOT NULL ENABLE, 
          "ID" NUMBER(*,0) NOT NULL ENABLE, 
          "DEGREE" VARCHAR2(45), 
           PRIMARY KEY ("ID") ENABLE
     )
  /

#+BEGIN_SRC sql
  CREATE TABLE  "COURSE" 
     (    "SEMESTER" VARCHAR2(10) NOT NULL ENABLE, 
          "ID" NUMBER(*,0) NOT NULL ENABLE, 
          "TITLE" VARCHAR2(45) NOT NULL ENABLE, 
          "COURSENUMBER" VARCHAR2(45) NOT NULL ENABLE, 
          "ACADEMICLEVEL" NUMBER, 
          "SUBJECT" VARCHAR2(50) NOT NULL ENABLE, 
           PRIMARY KEY ("ID") ENABLE
     )
  /

  CREATE TABLE  "TAKES" 
     (    "COURSEID" NUMBER NOT NULL ENABLE, 
          "ID" NUMBER NOT NULL ENABLE, 
          "USERID" NUMBER NOT NULL ENABLE, 
           CONSTRAINT "TAKES_PK" PRIMARY KEY ("ID") ENABLE, 
           CONSTRAINT "TAKES_FK" FOREIGN KEY ("COURSEID")
            REFERENCES  "COURSE" ("ID") ENABLE, 
           CONSTRAINT "TAKES_FK2" FOREIGN KEY ("USERID")
            REFERENCES  "USERS" ("ID") ENABLE
     )
  /
  
  CREATE OR REPLACE TRIGGER  "BI_TAKES" 
    before insert on "TAKES"               
    for each row  
  begin   
      select "TAKES_SEQ".nextval into :NEW.ID from dual; 
  end; 
  
  /
  ALTER TRIGGER  "BI_TAKES" ENABLE
  /

  CREATE TABLE  "TEACHES" 
     (    "PROFID" NUMBER NOT NULL ENABLE, 
          "COURSEID" NUMBER NOT NULL ENABLE, 
           CONSTRAINT "TEACHES_FK" FOREIGN KEY ("PROFID")
            REFERENCES  "PROFESSOR" ("ID") ENABLE, 
           CONSTRAINT "TEACHES_FK2" FOREIGN KEY ("COURSEID")
            REFERENCES  "COURSE" ("ID") ENABLE
     )
  /
  
  CREATE OR REPLACE TRIGGER  "BI_TEACHES" 
    before insert on "TEACHES"               
    for each row  
  begin   
      select "TEACHES_SEQ".nextval into :NEW.ID from dual; 
  end; 
  
  /
  ALTER TRIGGER  "BI_TEACHES" ENABLE
  /

  CREATE TABLE  "USERDOC" 
     (    "DOCUMENT_ID" NUMBER NOT NULL ENABLE, 
          "USER_ID" NUMBER NOT NULL ENABLE, 
           CONSTRAINT "USERDOC_PK" PRIMARY KEY ("DOCUMENT_ID") ENABLE, 
           CONSTRAINT "USERDOC_FK" FOREIGN KEY ("DOCUMENT_ID")
            REFERENCES  "DOCUMENT" ("ID") ENABLE, 
           CONSTRAINT "USERDOC_FK2" FOREIGN KEY ("USER_ID")
            REFERENCES  "USERS" ("ID") ENABLE
     )
  /
  
  CREATE OR REPLACE TRIGGER  "BI_USERDOC" 
    before insert on "USERDOC"               
    for each row  
  begin   
      select "USERDOC_SEQ".nextval into :NEW.DOCUMENT_ID from dual; 
  end; 
  
  /
  ALTER TRIGGER  "BI_USERDOC" ENABLE
  /

  CREATE TABLE  "TAG" 
     (    "ID" NUMBER NOT NULL ENABLE, 
          "NAME" VARCHAR2(45) NOT NULL ENABLE, 
           CONSTRAINT "TAG_PK" PRIMARY KEY ("ID") ENABLE
     )
  /
  
  CREATE OR REPLACE TRIGGER  "BI_TAG" 
    before insert on "TAG"               
    for each row  
  begin   
      select "TAG_SEQ".nextval into :NEW.ID from dual; 
  end; 
  
  /
  ALTER TRIGGER  "BI_TAG" ENABLE
  /

  CREATE TABLE  "DOCTAG" 
     (    "ID" NUMBER NOT NULL ENABLE, 
          "DOCUMENT_ID" NUMBER NOT NULL ENABLE, 
          "TAG_ID" NUMBER NOT NULL ENABLE, 
           CONSTRAINT "DOCTAG_PK" PRIMARY KEY ("ID") ENABLE, 
           CONSTRAINT "DOCTAG_FK" FOREIGN KEY ("DOCUMENT_ID")
            REFERENCES  "DOCUMENT" ("ID") ENABLE, 
           CONSTRAINT "DOCTAG_FK2" FOREIGN KEY ("TAG_ID")
            REFERENCES  "TAG" ("ID") ENABLE
     )
  /
  
  CREATE OR REPLACE TRIGGER  "BI_DOCTAG" 
    before insert on "DOCTAG"               
    for each row  
  begin   
      select "DOCTAG_SEQ".nextval into :NEW.ID from dual; 
  end; 
  
  /
  ALTER TRIGGER  "BI_DOCTAG" ENABLE
  /
