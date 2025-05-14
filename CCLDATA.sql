DROP TABLE SYSTEM.CCLDATA CASCADE CONSTRAINTS;

CREATE TABLE SYSTEM.CCLDATA
(
  PCOIL_SID     INTEGER                         NOT NULL,
  TYPE          CHAR(1 BYTE)                    DEFAULT 'P',
  MAT_IDENT     VARCHAR2(20 BYTE),
  REF_INT_ID    NUMBER(10),
  PROD_DAY      DATE,
  PROD_START    DATE,
  PROD_END      DATE,
  LENGTH        FLOAT(64),
  WIDTH         FLOAT(64),
  THICKNESS     FLOAT(64),
  WEIGHT        FLOAT(64),
  DIAM_INSIDE   FLOAT(64),
  DIAM_OUTSIDE  FLOAT(64)
)
TABLESPACE SYSTEM
PCTUSED    40
PCTFREE    10
INITRANS   1
MAXTRANS   255
STORAGE    (
            INITIAL          64K
            NEXT             1M
            MINEXTENTS       1
            MAXEXTENTS       UNLIMITED
            PCTINCREASE      0
            FREELISTS        1
            FREELIST GROUPS  1
            BUFFER_POOL      DEFAULT
           )
LOGGING 
NOCOMPRESS 
NOCACHE;
