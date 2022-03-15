--------------------------------------------------------
--  ∆ƒ¿œ¿Ã ª˝º∫µ  - ±›ø‰¿œ-2ø˘-04-2022   
--------------------------------------------------------
--------------------------------------------------------
--  DDL for Table TEST
--------------------------------------------------------

  CREATE TABLE "TEST" 
   (	"CODE" VARCHAR2(50 BYTE), 
	"NAME" VARCHAR2(20 BYTE), 
	"PRICE" NUMBER, 
	"AMOUNT" NUMBER, 
	"SALEDATE" DATE
   ) SEGMENT CREATION IMMEDIATE 
  PCTFREE 10 PCTUSED 40 INITRANS 1 MAXTRANS 255 NOCOMPRESS LOGGING
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "USERS" ;
REM INSERTING into TEST
SET DEFINE OFF;
Insert into TEST (CODE,NAME,PRICE,AMOUNT,SALEDATE) values ('≥√¿Â∞Ì-kr-230L','ªÔº∫',2300000,1000,to_date('22/02/04','RR/MM/DD'));
Insert into TEST (CODE,NAME,PRICE,AMOUNT,SALEDATE) values ('±Ëƒ°≥√¿Â∞Ì-kr-800L','ªÔº∫',3300000,100,to_date('22/02/04','RR/MM/DD'));
