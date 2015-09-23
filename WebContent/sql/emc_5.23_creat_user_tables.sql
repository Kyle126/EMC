/* Create an admin */
CREATE USER emc IDENTIFIED BY admin;
GRANT dba TO emc WITH ADMIN OPTION;

/* Create a table users */
CREATE TABLE users
( user_id NUMBER(10),
  username VARCHAR2(20) NOT NULL,
  password VARCHAR2(50) NOT NULL,
  email VARCHAR2(50) NOT NULL,
  enabled NUMBER(1) DEFAULT 1 NOT NULL,
  CONSTRAINT users_pk PRIMARY KEY(user_id),
  CONSTRAINT username_unique UNIQUE (username)
);

/* Create a table user_roles */
CREATE TABLE user_roles
( user_role_id NUMBER(10), 
  user_id NUMBER(10)  NOT NULL,
  authority VARCHAR2(20) NOT NULL,
  CONSTRAINT user_roles_pk PRIMARY KEY(user_role_id),
  CONSTRAINT user_roles_fk FOREIGN KEY(user_id) REFERENCES users(user_id)
);

/* Create a table interest */
CREATE TABLE interest
( state_id NUMBER(2),
  state VARCHAR2(2) NOT NULL,
  fix_30 NUMBER(5,2) NOT NULL,
  fix_20 NUMBER(5,2) NOT NULL,
  fix_15 NUMBER(5,2) NOT NULL,
  arm_5 NUMBER(5,2) NOT NULL,
  arm_7 NUMBER(5,2) NOT NULL,
  arm_10 NUMBER(5,2) NOT NULL,
  CONSTRAINT interest_pk PRIMARY KEY(state_id)
);

/* Create a table persistent_login */
CREATE TABLE persistent_login
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
