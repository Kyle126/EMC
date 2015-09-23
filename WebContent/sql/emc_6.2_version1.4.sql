/* Create an admin */
CREATE USER emc IDENTIFIED BY admin;
GRANT dba TO emc WITH ADMIN OPTION;

/* Create a table users */
CREATE TABLE users
( user_id NUMBER(10),
  username VARCHAR2(20) NOT NULL,
  password VARCHAR2(50) NOT NULL,
  email VARCHAR2(50) NOT NULL,
  enabled NUMBER(1) DEFAULT 0 NOT NULL,
  CONSTRAINT users_pk PRIMARY KEY(user_id),
  CONSTRAINT username_uk UNIQUE (username)
);

/* Create a table user_roles */
CREATE TABLE user_roles
( user_role_id NUMBER(10), 
  user_id NUMBER(10)  NOT NULL,
  authority VARCHAR2(20) NOT NULL,
  CONSTRAINT user_roles_pk PRIMARY KEY(user_role_id),
  CONSTRAINT user_roles_fk FOREIGN KEY(user_id) REFERENCES users(user_id)
);

/* Create a table interest_rates */
CREATE TABLE interest_rates
( state_id NUMBER(2),
  state VARCHAR2(2) NOT NULL,
  fix_30 NUMBER(5,2) NOT NULL,
  fix_20 NUMBER(5,2) NOT NULL,
  fix_15 NUMBER(5,2) NOT NULL,
  arm_5 NUMBER(5,2) NOT NULL,
  arm_7 NUMBER(5,2) NOT NULL,
  arm_10 NUMBER(5,2) NOT NULL,
  CONSTRAINT interest_rates_pk PRIMARY KEY(state_id),
  CONSTRAINT interest_rates_uk UNIQUE (state)
);

/* Create a table persistent_logins for remember me */
CREATE TABLE persistent_logins
( series VARCHAR2(64) NOT NULL,
  username VARCHAR2(64) NOT NULL,
  token VARCHAR2(64) NOT NULL,
  last_used TIMESTAMP(6) NOT NULL,
  CONSTRAINT persistent_login_pk PRIMARY KEY(series)
);

/* Create a sequence for user_id */
CREATE SEQUENCE user_id_seq 
  MINVALUE 1 
  START WITH 1
  INCREMENT BY 1  
  NOCACHE 
  NOORDER 
  NOCYCLE;

/* Create a sequence for user_role_id */
CREATE SEQUENCE user_role_id_seq 
  MINVALUE 1 
  START WITH 1
  INCREMENT BY 1  
  NOCACHE 
  NOORDER 
  NOCYCLE;
  
/* Create a sequence for state_id */
CREATE SEQUENCE state_id_seq 
  MINVALUE 1 
  START WITH 1
  INCREMENT BY 1  
  NOCACHE 
  NOORDER 
  NOCYCLE;

/* Populate data */
INSERT INTO users VALUES (user_id_seq.NEXTVAL, 'admin', '21232f297a57a5a743894a0e4a801fc3', 'admin@gmail.com', 1);
INSERT INTO users VALUES (user_id_seq.NEXTVAL, 'allen', 'a34c3d45b6018d3fd5560b103c2a00e2', 'allen@gmail.com', 1);
INSERT INTO users VALUES (user_id_seq.NEXTVAL, 'yakun', 'ca84fffd0ccf0cfd193cef88dc8f3410', 'yakun@gmail.com', 1);
INSERT INTO users VALUES (user_id_seq.NEXTVAL, 'freddie', 'c908a90d0fe5aec600e957b88efc04a4', 'freddie@gmail.com', 1);
commit;
INSERT INTO user_roles VALUES (user_role_id_seq.NEXTVAL, 1, 'ROLE_ADMIN');
INSERT INTO user_roles VALUES (user_role_id_seq.NEXTVAL, 2, 'ROLE_USER');
INSERT INTO user_roles VALUES (user_role_id_seq.NEXTVAL, 3, 'ROLE_USER');
INSERT INTO user_roles VALUES (user_role_id_seq.NEXTVAL, 4, 'ROLE_USER');
commit;

/* Drop all tables */
DROP TABLE user_roles;
DROP TABLE users;
DROP TABLE interest_rates;
DROP TABLE persistent_logins;
DROP SEQUENCE user_id_seq;
DROP SEQUENCE user_role_id_seq;
DROP SEQUENCE state_id_seq;
