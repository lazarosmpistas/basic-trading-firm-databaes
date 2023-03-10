--
-- File generated with SQLiteStudio v3.4.1 on ??? ??? 28 01:37:22 2023
--
-- Text encoding used: System
--
PRAGMA foreign_keys = off;
BEGIN TRANSACTION;

-- Table: CUSTOMER
CREATE TABLE IF NOT EXISTS CUSTOMER (
  idCUSTOMER INTEGER  NOT NULL  ,
  CUSTOMER_NAME VARCHAR  NOT NULL  ,
  CUSTOMER_CITY VARCHAR    ,
  CUSTOMER_STATE VARCHAR    ,
  CUSTOMER_ADDRESS VARCHAR  NOT NULL  ,
  CUSTOMER_ADDRESS_NUM INTEGER  NOT NULL  ,
  CUSTOMER_POSTAL_CODE INTEGER  NOT NULL  ,
  CUSTOMER_PHONE_NUM BIGINT  NOT NULL    ,
PRIMARY KEY(idCUSTOMER));
INSERT INTO CUSTOMER (idCUSTOMER, CUSTOMER_NAME, CUSTOMER_CITY, CUSTOMER_STATE, CUSTOMER_ADDRESS, CUSTOMER_ADDRESS_NUM, CUSTOMER_POSTAL_CODE, CUSTOMER_PHONE_NUM) VALUES (1, 'LAZAROS', 'KATERINI', 'PIERIA', 'ABC', 12, 60100, 12345);
INSERT INTO CUSTOMER (idCUSTOMER, CUSTOMER_NAME, CUSTOMER_CITY, CUSTOMER_STATE, CUSTOMER_ADDRESS, CUSTOMER_ADDRESS_NUM, CUSTOMER_POSTAL_CODE, CUSTOMER_PHONE_NUM) VALUES (2, 'GIWRGOS', 'THESSALONIKI', 'THESSALONIKIS', 'DEF', 10, 53535, 69699);
INSERT INTO CUSTOMER (idCUSTOMER, CUSTOMER_NAME, CUSTOMER_CITY, CUSTOMER_STATE, CUSTOMER_ADDRESS, CUSTOMER_ADDRESS_NUM, CUSTOMER_POSTAL_CODE, CUSTOMER_PHONE_NUM) VALUES (3, 'JIM', 'NEW YORK', 'STATES', 'JOHAH ST', 777, 57100, 7345);

-- Table: EMPLOYEE
CREATE TABLE IF NOT EXISTS EMPLOYEE (
  idEMPLOYEE INTEGER  NOT NULL  ,
  AFM INTEGER  NOT NULL  ,
  AT VARCHAR(20)  NOT NULL  ,
  EMPLOYEE_FIRST_NAME VARCHAR  NOT NULL  ,
  EMPLOYEE_LAST_NAME VARCHAR  NOT NULL  ,
  EMPLOYEE_STATE VARCHAR    ,
  EMPLOYEE_CITY VARCHAR    ,
  EMPLOYEE_ADDRESS VARCHAR  NOT NULL  ,
  EMPLOYEE_ADDRESS_NUM INTEGER  NOT NULL  ,
  EMPLOYEE_POSTAL_CODE INTEGER  NOT NULL  ,
  EMPLOYEE_PHONE_NUM BIGINT  NOT NULL    ,
PRIMARY KEY(idEMPLOYEE));
INSERT INTO EMPLOYEE (idEMPLOYEE, AFM, AT, EMPLOYEE_FIRST_NAME, EMPLOYEE_LAST_NAME, EMPLOYEE_STATE, EMPLOYEE_CITY, EMPLOYEE_ADDRESS, EMPLOYEE_ADDRESS_NUM, EMPLOYEE_POSTAL_CODE, EMPLOYEE_PHONE_NUM) VALUES (1, 2345, 'AM2387', 'GARRY', 'LASS', 'FACK', 'YU', 'NYRER', 44, 98732, 23874);
INSERT INTO EMPLOYEE (idEMPLOYEE, AFM, AT, EMPLOYEE_FIRST_NAME, EMPLOYEE_LAST_NAME, EMPLOYEE_STATE, EMPLOYEE_CITY, EMPLOYEE_ADDRESS, EMPLOYEE_ADDRESS_NUM, EMPLOYEE_POSTAL_CODE, EMPLOYEE_PHONE_NUM) VALUES (2, 3822, 'AF3894', 'UGETHS', 'GAMIGN', 'IOS', 'SOSA', 'BABA', 88, 28394, 84730);
INSERT INTO EMPLOYEE (idEMPLOYEE, AFM, AT, EMPLOYEE_FIRST_NAME, EMPLOYEE_LAST_NAME, EMPLOYEE_STATE, EMPLOYEE_CITY, EMPLOYEE_ADDRESS, EMPLOYEE_ADDRESS_NUM, EMPLOYEE_POSTAL_CODE, EMPLOYEE_PHONE_NUM) VALUES (3, 2334, 'AO2342', 'OCHOA', 'LALALA', 'POIS', 'RERERE', 'RAPHA', 98, 57100, 28384);

-- Table: ITEM
CREATE TABLE IF NOT EXISTS ITEM (
  idITEM INTEGER  NOT NULL  ,
  DESCRIPTION1 VARCHAR(20)    ,
  DESCRIPTION2 VARCHAR    ,
  CATEGORY VARCHAR  NOT NULL  ,
  QUANTITY INTEGER  NOT NULL  ,
  PURCHASE_PRICE FLOAT  NOT NULL  ,
  SALE_PRICE FLOAT  NOT NULL    ,
PRIMARY KEY(idITEM));
INSERT INTO ITEM (idITEM, DESCRIPTION1, DESCRIPTION2, CATEGORY, QUANTITY, PURCHASE_PRICE, SALE_PRICE) VALUES (1, 'KAKA', 'KATI MAGIKO', 'RERE', 4, 8.0, 9.0);
INSERT INTO ITEM (idITEM, DESCRIPTION1, DESCRIPTION2, CATEGORY, QUANTITY, PURCHASE_PRICE, SALE_PRICE) VALUES (2, 'VIKOS', 'PIES NERO NA XEIS KEFALI GERO', 'LAZAR', 10, 2.0, 4.0);
INSERT INTO ITEM (idITEM, DESCRIPTION1, DESCRIPTION2, CATEGORY, QUANTITY, PURCHASE_PRICE, SALE_PRICE) VALUES (3, 'DEDESS', 'MIKE HAVOS MABROS', 'PROPONITHS', 1, 33.0, 44.0);

-- Table: PURCHASE
CREATE TABLE IF NOT EXISTS PURCHASE (
  CUSTOMER_idSUPPLIER INTEGER  NOT NULL  ,
  ITEM_idITEM INTEGER  NOT NULL  ,
  EMPLOYEE_idEMPLOYEE INTEGER  NOT NULL  ,
  PURCHASE_PRICE_PIECE FLOAT  NOT NULL  ,
  PURCHASE_PRICE_TOTAL FLOAT  NOT NULL  ,
  DATE_OF_PURCHASE DATE  NOT NULL  ,
  PURCHASE_AMOUNT INTEGER  NOT NULL    ,
PRIMARY KEY(CUSTOMER_idSUPPLIER, ITEM_idITEM, EMPLOYEE_idEMPLOYEE),
  FOREIGN KEY(CUSTOMER_idSUPPLIER)
    REFERENCES SUPPLIER(idSUPPLIER)
      ON DELETE SET NULL
      ON UPDATE CASCADE,
  FOREIGN KEY(EMPLOYEE_idEMPLOYEE)
    REFERENCES EMPLOYEE(idEMPLOYEE)
      ON DELETE SET NULL
      ON UPDATE CASCADE,
  FOREIGN KEY(ITEM_idITEM)
    REFERENCES ITEM(idITEM)
      ON DELETE SET NULL
      ON UPDATE CASCADE);
INSERT INTO PURCHASE (CUSTOMER_idSUPPLIER, ITEM_idITEM, EMPLOYEE_idEMPLOYEE, PURCHASE_PRICE_PIECE, PURCHASE_PRICE_TOTAL, DATE_OF_PURCHASE, PURCHASE_AMOUNT) VALUES (1, 1, 2, 10.0, 50.0, '2022/12/12', 5);
INSERT INTO PURCHASE (CUSTOMER_idSUPPLIER, ITEM_idITEM, EMPLOYEE_idEMPLOYEE, PURCHASE_PRICE_PIECE, PURCHASE_PRICE_TOTAL, DATE_OF_PURCHASE, PURCHASE_AMOUNT) VALUES (2, 3, 2, 5.0, 5.0, '2022/11/15', 1);
INSERT INTO PURCHASE (CUSTOMER_idSUPPLIER, ITEM_idITEM, EMPLOYEE_idEMPLOYEE, PURCHASE_PRICE_PIECE, PURCHASE_PRICE_TOTAL, DATE_OF_PURCHASE, PURCHASE_AMOUNT) VALUES (2, 1, 1, 2.0, 4.0, '2022/11/13', 2);

-- Table: SALE
CREATE TABLE IF NOT EXISTS SALE (
  CUSTOMER_idCUSTOMER INTEGER  NOT NULL  ,
  ITEM_idITEM INTEGER  NOT NULL  ,
  EMPLOYEE_idEMPLOYEE INTEGER  NOT NULL  ,
  DATE_OF_SALE DATE  NOT NULL  ,
  SALE_AMOUNT INTEGER  NOT NULL  ,
  SALE_PRICE_PIECE FLOAT  NOT NULL  ,
  SALE_PRICE_TOTAL FLOAT  NOT NULL    ,
PRIMARY KEY(CUSTOMER_idCUSTOMER, ITEM_idITEM, EMPLOYEE_idEMPLOYEE),
  FOREIGN KEY(EMPLOYEE_idEMPLOYEE)
    REFERENCES EMPLOYEE(idEMPLOYEE)
      ON DELETE SET NULL
      ON UPDATE CASCADE,
  FOREIGN KEY(CUSTOMER_idCUSTOMER)
    REFERENCES CUSTOMER(idCUSTOMER)
      ON DELETE SET NULL
      ON UPDATE CASCADE,
  FOREIGN KEY(ITEM_idITEM)
    REFERENCES ITEM(idITEM)
      ON DELETE SET NULL
      ON UPDATE CASCADE);
INSERT INTO SALE (CUSTOMER_idCUSTOMER, ITEM_idITEM, EMPLOYEE_idEMPLOYEE, DATE_OF_SALE, SALE_AMOUNT, SALE_PRICE_PIECE, SALE_PRICE_TOTAL) VALUES (1, 1, 3, '2022/12/31', 2, 6.0, 12.0);
INSERT INTO SALE (CUSTOMER_idCUSTOMER, ITEM_idITEM, EMPLOYEE_idEMPLOYEE, DATE_OF_SALE, SALE_AMOUNT, SALE_PRICE_PIECE, SALE_PRICE_TOTAL) VALUES (2, 3, 1, '2022/12/15', 5, 3.0, 15.0);
INSERT INTO SALE (CUSTOMER_idCUSTOMER, ITEM_idITEM, EMPLOYEE_idEMPLOYEE, DATE_OF_SALE, SALE_AMOUNT, SALE_PRICE_PIECE, SALE_PRICE_TOTAL) VALUES (2, 2, 1, '2022/10/01', 1, 7.0, 7.0);
INSERT INTO SALE (CUSTOMER_idCUSTOMER, ITEM_idITEM, EMPLOYEE_idEMPLOYEE, DATE_OF_SALE, SALE_AMOUNT, SALE_PRICE_PIECE, SALE_PRICE_TOTAL) VALUES (3, 1, 2, '2022/10/03', 3, 5.0, 15.0);

-- Table: SUPPLIER
CREATE TABLE IF NOT EXISTS SUPPLIER (
  idSUPPLIER INTEGER  NOT NULL  ,
  SUPPLIER_NAME VARCHAR  NOT NULL  ,
  SUPPLIER_CITY VARCHAR    ,
  SUPPLIER_STATE VARCHAR    ,
  SUPPLIER_ADDRESS VARCHAR  NOT NULL  ,
  SUPPLIER_ADDRESS_NUM INTEGER  NOT NULL  ,
  SUPPLIER_POSTAL_CODE INTEGER  NOT NULL  ,
  SUPPLIER_PHONE_NUM BIGINT  NOT NULL    ,
PRIMARY KEY(idSUPPLIER));
INSERT INTO SUPPLIER (idSUPPLIER, SUPPLIER_NAME, SUPPLIER_CITY, SUPPLIER_STATE, SUPPLIER_ADDRESS, SUPPLIER_ADDRESS_NUM, SUPPLIER_POSTAL_CODE, SUPPLIER_PHONE_NUM) VALUES (1, 'KAKOBIOLHS', 'KSANTHI', 'RODOPI', 'MANAS', 123, 67100, 69622);
INSERT INTO SUPPLIER (idSUPPLIER, SUPPLIER_NAME, SUPPLIER_CITY, SUPPLIER_STATE, SUPPLIER_ADDRESS, SUPPLIER_ADDRESS_NUM, SUPPLIER_POSTAL_CODE, SUPPLIER_PHONE_NUM) VALUES (2, 'KAKOBOULOS', 'KATERINI', 'PIERIA', 'ZZZ FSS', 999, 60100, 87263);
INSERT INTO SUPPLIER (idSUPPLIER, SUPPLIER_NAME, SUPPLIER_CITY, SUPPLIER_STATE, SUPPLIER_ADDRESS, SUPPLIER_ADDRESS_NUM, SUPPLIER_POSTAL_CODE, SUPPLIER_PHONE_NUM) VALUES (3, 'LAZARIKOS', 'UGGIOS', 'PAPAFHS', 'ZAZOPOULOS', 76, 98342, 82341);

COMMIT TRANSACTION;
PRAGMA foreign_keys = on;
