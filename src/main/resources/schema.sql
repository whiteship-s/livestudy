alter table T_COMMON_CODE drop foreign key FK_T_COMMON_CODE_MASTER_CODE_T_MASTER_CODE_MASTER_CODE;

DROP TABLE IF EXISTS T_COMMON_CODE;
DROP TABLE IF EXISTS T_MASTER_CODE;


CREATE TABLE T_MASTER_CODE
(
    MASTER_CODE CHAR(100) NOT NULL,
    MASTER_DESC TEXT      NOT NULL,
    CONSTRAINT PK_T_CODE PRIMARY KEY (MASTER_CODE)
);

CREATE TABLE T_COMMON_CODE
(
    CODE         VARCHAR(100)    NOT NULL    ,
    MASTER_CODE  VARCHAR(100)    NOT NULL    ,
    CODE_KR      VARCHAR(100)    NOT NULL    ,
    CODE_DESC    TEXT            NOT NULL    ,
    CODE_ORDER   INT             NOT NULL    ,
    REG_ID       VARCHAR(100)    NOT NULL    ,
    REG_DATE     DATETIME        NOT NULL    ,
    MOD_ID       VARCHAR(100)    NOT NULL    ,
    MOD_DATE     DATETIME        NOT NULL    ,
    MOD_COMMENT  TEXT            NOT NULL    ,
    STATUS       TINYINT(4)      NOT NULL    ,
    CONSTRAINT PK_T_COMMON_CODE PRIMARY KEY (CODE)
);

ALTER TABLE T_COMMON_CODE
    ADD CONSTRAINT FK_T_COMMON_CODE_MASTER_CODE_T_MASTER_CODE_MASTER_CODE FOREIGN KEY (MASTER_CODE)
        REFERENCES T_MASTER_CODE (MASTER_CODE) ON DELETE RESTRICT ON UPDATE RESTRICT;