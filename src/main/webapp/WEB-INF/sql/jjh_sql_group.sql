--------------------------------------------------------
--  파일이 생성됨 - 토요일-1월-07-2023   
--------------------------------------------------------
--------------------------------------------------------
--  DDL for Table BOARD_JJH
--------------------------------------------------------

  CREATE TABLE JJH.BOARD_JJH 
   (	NUM NUMBER, 
	TITLE VARCHAR2(50 BYTE), 
	WRITER VARCHAR2(50 BYTE), 
	CONTENT VARCHAR2(4000 BYTE), 
	REGDATE DATE, 
	CNT NUMBER DEFAULT 0, 
	BOARD_IDX NUMBER(11,0), 
	UPDATE_DATE DATE, 
	WRITE_DATE DATE, 
	BOARD_LIKE NUMBER(11,0)
   ) SEGMENT CREATION IMMEDIATE 
  PCTFREE 10 PCTUSED 40 INITRANS 1 MAXTRANS 255 NOCOMPRESS LOGGING
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE SYSTEM ;
--------------------------------------------------------
--  DDL for Table BOARD_LIKE_JJH
--------------------------------------------------------

  CREATE TABLE JJH.BOARD_LIKE_JJH 
   (	LIKE_IDX NUMBER(11,0), 
	NUM NUMBER(11,0), 
	MEM_IDX NUMBER(11,0)
   ) SEGMENT CREATION IMMEDIATE 
  PCTFREE 10 PCTUSED 40 INITRANS 1 MAXTRANS 255 NOCOMPRESS LOGGING
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE SYSTEM ;
--------------------------------------------------------
--  DDL for Table BOARD_REPLY_JJH
--------------------------------------------------------

  CREATE TABLE JJH.BOARD_REPLY_JJH 
   (	REPLY_IDX NUMBER(11,0), 
	REPLY_CONTENT VARCHAR2(1000 BYTE), 
	REPLY_REGDATE DATE, 
	NUM NUMBER, 
	MEM_IDX NUMBER(11,0)
   ) SEGMENT CREATION IMMEDIATE 
  PCTFREE 10 PCTUSED 40 INITRANS 1 MAXTRANS 255 NOCOMPRESS LOGGING
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE SYSTEM ;
--------------------------------------------------------
--  DDL for Table MEMBER_JJH
--------------------------------------------------------

  CREATE TABLE JJH.MEMBER_JJH 
   (	MEM_IDX NUMBER, 
	MEM_ID VARCHAR2(50 BYTE), 
	MEM_NAME VARCHAR2(50 BYTE), 
	MEM_PWD VARCHAR2(50 BYTE), 
	MEM_AUTH VARCHAR2(50 BYTE), 
	MEM_GENDER VARCHAR2(50 BYTE), 
	MEM_PHONE VARCHAR2(50 BYTE), 
	MEM_EMAIL VARCHAR2(50 BYTE), 
	REGIST_DATE DATE, 
	UPDATE_DATE DATE, 
	REGIST_ID VARCHAR2(50 BYTE), 
	UPDATE_ID VARCHAR2(50 BYTE), 
	REGIST_IP VARCHAR2(50 BYTE), 
	UPDATE_IP VARCHAR2(50 BYTE), 
	MEM_IP VARCHAR2(50 BYTE)
   ) SEGMENT CREATION IMMEDIATE 
  PCTFREE 10 PCTUSED 40 INITRANS 1 MAXTRANS 255 NOCOMPRESS LOGGING
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE SYSTEM ;
REM INSERTING into JJH.BOARD_JJH
SET DEFINE OFF;

REM INSERTING into JJH.BOARD_LIKE_JJH
SET DEFINE OFF;

REM INSERTING into JJH.BOARD_REPLY_JJH
SET DEFINE OFF;

REM INSERTING into JJH.MEMBER_JJH
SET DEFINE OFF;
Insert into JJH.MEMBER_JJH (MEM_IDX,MEM_ID,MEM_NAME,MEM_PWD,MEM_AUTH,MEM_GENDER,MEM_PHONE,MEM_EMAIL,REGIST_DATE,UPDATE_DATE,REGIST_ID,UPDATE_ID,REGIST_IP,UPDATE_IP,MEM_IP) values (1,'admin','운영자','123123','member','남성',null,null,to_date('22/12/28','RR/MM/DD'),to_date('22/12/29','RR/MM/DD'),null,null,null,null,'0:0:0:0:0:0:0:1');

--------------------------------------------------------
--  DDL for Index SYS_C007416
--------------------------------------------------------

  CREATE UNIQUE INDEX JJH.SYS_C007416 ON JJH.BOARD_JJH (NUM) 
  PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE SYSTEM ;
--------------------------------------------------------
--  DDL for Index SYS_C007458
--------------------------------------------------------

  CREATE UNIQUE INDEX JJH.SYS_C007458 ON JJH.BOARD_LIKE_JJH (LIKE_IDX) 
  PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE SYSTEM ;
--------------------------------------------------------
--  DDL for Index SYS_C007468
--------------------------------------------------------

  CREATE UNIQUE INDEX JJH.SYS_C007468 ON JJH.BOARD_REPLY_JJH (REPLY_IDX) 
  PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE SYSTEM ;
--------------------------------------------------------
--  DDL for Index SYS_C007437
--------------------------------------------------------

  CREATE UNIQUE INDEX JJH.SYS_C007437 ON JJH.MEMBER_JJH (MEM_IDX) 
  PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE SYSTEM ;
--------------------------------------------------------
--  Constraints for Table BOARD_JJH
--------------------------------------------------------

  ALTER TABLE JJH.BOARD_JJH ADD PRIMARY KEY (NUM)
  USING INDEX PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE SYSTEM  ENABLE;
  ALTER TABLE JJH.BOARD_JJH MODIFY (WRITER NOT NULL ENABLE);
  ALTER TABLE JJH.BOARD_JJH MODIFY (TITLE NOT NULL ENABLE);
--------------------------------------------------------
--  Constraints for Table BOARD_LIKE_JJH
--------------------------------------------------------

  ALTER TABLE JJH.BOARD_LIKE_JJH ADD PRIMARY KEY (LIKE_IDX)
  USING INDEX PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE SYSTEM  ENABLE;
  ALTER TABLE JJH.BOARD_LIKE_JJH MODIFY (MEM_IDX NOT NULL ENABLE);
  ALTER TABLE JJH.BOARD_LIKE_JJH MODIFY (NUM NOT NULL ENABLE);
--------------------------------------------------------
--  Constraints for Table BOARD_REPLY_JJH
--------------------------------------------------------

  ALTER TABLE JJH.BOARD_REPLY_JJH ADD PRIMARY KEY (REPLY_IDX)
  USING INDEX PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE SYSTEM  ENABLE;
  ALTER TABLE JJH.BOARD_REPLY_JJH MODIFY (MEM_IDX NOT NULL ENABLE);
  ALTER TABLE JJH.BOARD_REPLY_JJH MODIFY (NUM NOT NULL ENABLE);
  ALTER TABLE JJH.BOARD_REPLY_JJH MODIFY (REPLY_REGDATE NOT NULL ENABLE);
  ALTER TABLE JJH.BOARD_REPLY_JJH MODIFY (REPLY_CONTENT NOT NULL ENABLE);
--------------------------------------------------------
--  Constraints for Table MEMBER_JJH
--------------------------------------------------------

  ALTER TABLE JJH.MEMBER_JJH ADD PRIMARY KEY (MEM_IDX)
  USING INDEX PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE SYSTEM  ENABLE;
  ALTER TABLE JJH.MEMBER_JJH MODIFY (MEM_PWD NOT NULL ENABLE);
  ALTER TABLE JJH.MEMBER_JJH MODIFY (MEM_NAME NOT NULL ENABLE);
  ALTER TABLE JJH.MEMBER_JJH MODIFY (MEM_ID NOT NULL ENABLE);
  ALTER TABLE JJH.MEMBER_JJH MODIFY (MEM_IDX NOT NULL ENABLE);
