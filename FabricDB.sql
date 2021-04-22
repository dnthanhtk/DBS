CREATE TABLE supplier (
    s_id          INT PRIMARY KEY,
    name          VARCHAR(20) NOT NULL,
    address       VARCHAR(30),
    bank_account  VARCHAR(20),
    tax_code      CHAR(10),
    phone         CHAR(10)
);

CREATE TABLE categorys (
    cat_id    INT NOT NULL,
    cat_name  VARCHAR(20) NOT NULL,
    color     VARCHAR(15),
    price     DECIMAL(10, 2),
    cat_date  DATE,
    quantity  INT,
    s_id      INT NOT NULL,
    PRIMARY KEY ( cat_id ),
    CONSTRAINT fk_cate_sup_s_id FOREIGN KEY ( s_id )
        REFERENCES supplier ( s_id )
            ON DELETE SET NULL
    DEFERRABLE
);

CREATE TABLE employee (
    e_id     INT NOT NULL PRIMARY KEY,
    fname    VARCHAR(15) NOT NULL,
    lname    VARCHAR(10) NOT NULL,
    gender    VARCHAR(6),
    address  VARCHAR(20),
    phone    CHAR(10)
);

CREATE TABLE customer (
    cus_id        INT NOT NULL PRIMARY KEY,
    fname         VARCHAR(15) NOT NULL,
    lname         VARCHAR(10),
    address       VARCHAR(20),
    phone_number  CHAR(10),
    arreage       DECIMAL(10, 2),
    money         DECIMAL(10, 2),
    cus_date      DATE
);



CREATE TABLE orders (
    o_id         INT NOT NULL PRIMARY KEY,
    total_price  DECIMAL(10, 2),
    cus_id       INT,
    e_id         INT,
    CONSTRAINT fk_order_cus_cus_id FOREIGN KEY ( cus_id )
        REFERENCES customer ( cus_id )
            ON DELETE SET NULL
    DEFERRABLE,
    CONSTRAINT fk_order_emp_e_id FOREIGN KEY ( e_id )
        REFERENCES employee ( e_id )
            ON DELETE SET NULL
    DEFERRABLE
);

CREATE TABLE bolt (
    b_id     INT NOT NULL,
    cat_id   INT NOT NULL,
    o_id     INT,
    blength  DECIMAL(10, 3),
    PRIMARY KEY ( b_id,
                  cat_id ),
    CONSTRAINT fk_bolt_cate_cat_id FOREIGN KEY ( cat_id )
        REFERENCES categorys ( cat_id )
            ON DELETE SET NULL
    DEFERRABLE,
    CONSTRAINT fk_bolt_order_o_id FOREIGN KEY ( o_id )
        REFERENCES orders ( o_id )
            ON DELETE SET NULL
    DEFERRABLE
);

CREATE TABLE provide (
    cat_id          INT,
    s_id            INT,
    quantity        INT,
    prov_date       DATE,
    purchase_price  DECIMAL(10, 2),
    PRIMARY KEY ( cat_id,
                  s_id ),
    CONSTRAINT fk_prov_cate_cat_id FOREIGN KEY ( cat_id )
        REFERENCES categorys ( cat_id )
            ON DELETE SET NULL
    DEFERRABLE,
    CONSTRAINT fk_prov_sup_s_id FOREIGN KEY ( s_id )
        REFERENCES supplier ( s_id )
            ON DELETE SET NULL
    DEFERRABLE
);

CREATE TABLE process (
    e_id       INT,
    o_id       INT,
    proc_date  DATE,
    proc_time  TIMESTAMP,
    PRIMARY KEY ( e_id,
                  o_id ),
    CONSTRAINT fk_proc_order_o_id FOREIGN KEY ( o_id )
        REFERENCES orders ( o_id )
            ON DELETE SET NULL
    DEFERRABLE,
    CONSTRAINT fk_proc_emp_e_id FOREIGN KEY ( e_id )
        REFERENCES employee ( e_id )
            ON DELETE SET NULL
    DEFERRABLE
);

-------------Insert data-------------------------------
INSERT INTO supplier VALUES (
    1,
    'Silk Agency',
    'KTX Khu B',
    '1814315',
    194647390,
    0826755114
);

INSERT INTO supplier VALUES (
    2,
    'Damask Agency',
    'Duong',
    '1814113',
    194647777,
    0826755123
);

INSERT INTO supplier VALUES (
    3,
    'Khaki Agency',
    'Gan Khu B',
    '1814114',
    194647888,
    0826755124
);

INSERT INTO supplier VALUES (
    4,
    'Thuan',
    'Nha Tro',
    '1814115',
    194647999,
    0826755113
);

INSERT INTO supplier VALUES (
    5,
    'Tin',
    'Quan 10',
    '1814116',
    194647555,
    0826755115
);

INSERT INTO categorys VALUES (
    1,
    'Damask',
    'Blue',
    100000,
    ( TO_DATE('20/06/2000', 'DD/MM/YYYY') ),
    440,
    2
);

INSERT INTO categorys VALUES (
    2,
    'Silk',
    'Gray',
    100000,
    ( TO_DATE('20/06/2000', 'DD/MM/YYYY') ),
    350,
    4
);

INSERT INTO categorys VALUES (
    3,
    'Jacquard',
    'Blue',
    150000,
    ( TO_DATE('20/06/2000', 'DD/MM/YYYY') ),
    520,
    3
);

INSERT INTO categorys VALUES (
    4,
    'Faux silk',
    'Gray',
    150000,
    ( TO_DATE('20/06/2000', 'DD/MM/YYYY') ),
    430,
    1
);

INSERT INTO categorys VALUES (
    5,
    'Khaki',
    'Black',
    123000,
    ( TO_DATE('26/06/2000', 'DD/MM/YYYY') ),
    4200,
    5
);

INSERT INTO categorys VALUES (
    6,
    'Crewel',
    'White',
    123000,
    ( TO_DATE('26/06/2000', 'DD/MM/YYYY') ),
    12345,
    3
);


INSERT INTO employee VALUES (
    1,
    'Luu Van',
    'Tien',
    'Female',
    'Quang Binh',
    '0123456789'
);

INSERT INTO employee VALUES (
    2,
    'Nguyen Van',
    'Thin',
    'Male',
    'Quang Binh',
    '0123123123'
);

INSERT INTO employee VALUES (
    3,
    'Cao Van',
    'Tin',
    'Female',
    'Binh Dinh',
    '0123456456'
);

INSERT INTO employee VALUES (
    4,
    'Doan Nhat',
    'Thanh',
    'Female',
    'Quang Binh',
    '0123789789'
);

INSERT INTO employee VALUES (
    5,
    'Hua Phuoc',
    'Thuan',
    'Female',
    'Kien Giang',
    '0987654321'
);

INSERT INTO customer VALUES(
    1,
    'Nguyen Van',
    'Thanh',
    '15 Thanh Thai',
    '0918459234',
    0,
    1500000,
    ( TO_DATE('12/04/2020', 'DD/MM/YYYY') )
);

INSERT INTO customer VALUES(
    2,
    'Nguyen Trung',
    'Hau',
    '69 Dong Da',
    '0903728453',
    500000,
    2000000,
    ( TO_DATE('20/04/2020', 'DD/MM/YYYY') )
);

INSERT INTO customer VALUES(
    3,
    'Tran Thanh',
    'Trung',
    '238 Ly Tu Trong',
    '0943829542',
    250000,
    1950000,
    ( TO_DATE('17/06/2020', 'DD/MM/YYYY') )
);

INSERT INTO customer VALUES(
    4,
    'Nguyen Tuan',
    'Huy',
    '57 Hung Vuong',
    '0982634728',
    1500000,
    500000,
    ( TO_DATE('18/06/2020', 'DD/MM/YYYY') )
);

INSERT INTO customer VALUES(
    5,
    'Le Bao',
    'Tram',
    '167 Tran Phu',
    '0909182394',
    4500000,
    5000000,
    ( TO_DATE('20/07/2020', 'DD/MM/YYYY') )
);


INSERT INTO orders VALUES(
    1,
    1500000,
    1,
    3
);

INSERT INTO orders VALUES(
    2,
    2500000,
    2,
    1
);

INSERT INTO orders VALUES(
    3,
    2200000,
    3,
    5
);

INSERT INTO orders VALUES(
    4,
    2000000,
    4,
    4
);

INSERT INTO orders VALUES(
    5,
    9500000,
    5,
    2
);

INSERT INTO orders VALUES(
    6,
    1500000,
    1,
    5
);

INSERT INTO orders VALUES(
    7,
    5500000,
    2,
    1
);

INSERT INTO orders VALUES(
    8,
    4500000,
    5,
    3
);

INSERT INTO orders VALUES(
    9,
    20000000,
    4,
    4
);

INSERT INTO orders VALUES(
    10,
    6250000,
    3,
    2
);

INSERT INTO bolt VALUES(
    1,
    1,
    1,
    10
);

INSERT INTO bolt VALUES(
    2,
    1,
    2,
    7
);

INSERT INTO bolt VALUES(
    1,
    2,
    3,
    5
);

INSERT INTO bolt VALUES(
    2,
    2,
    4,
    14
);

INSERT INTO bolt VALUES(
    1,
    3,
    5,
    3
);

INSERT INTO bolt VALUES(
    2,
    3,
    3,
    11
);

INSERT INTO bolt VALUES(
    1,
    4,
    7,
    16
);

INSERT INTO bolt VALUES(
    2,
    4,
    8,
    13
);

INSERT INTO bolt VALUES(
    1,
    5,
    7,
    6
);

INSERT INTO bolt VALUES(
    2,
    5,
    10,
    8
);

INSERT INTO bolt VALUES(
    1,
    6,
    9,
    35
);

INSERT INTO bolt VALUES(
    2,
    6,
    6,
    16
);

INSERT INTO provide VALUES(
    1,
    1,
    10,
    ( TO_DATE('20/07/2020', 'DD/MM/YYYY') ),
    1000000
);

INSERT INTO provide VALUES(
    6,
    1,
    10,
    ( TO_DATE('25/07/2020', 'DD/MM/YYYY') ),
    1000000
);

INSERT INTO provide VALUES(
    2,
    1,
    14,
    ( TO_DATE('30/07/2020', 'DD/MM/YYYY') ),
    2500000
);

INSERT INTO provide VALUES(
    2,
    2,
    17,
    ( TO_DATE('2/08/2020', 'DD/MM/YYYY') ),
    3250000
);

INSERT INTO provide VALUES(
    3,
    2,
    12,
    ( TO_DATE('14/08/2020', 'DD/MM/YYYY') ),
    2550000
);

INSERT INTO provide VALUES(
    4,
    2,
    7,
    ( TO_DATE('22/08/2020', 'DD/MM/YYYY') ),
    1350000
);

INSERT INTO provide VALUES(
    5,
    3,
    9,
    ( TO_DATE('31/08/2020', 'DD/MM/YYYY') ),
    1925000
);

INSERT INTO provide VALUES(
    6,
    3,
    12,
    ( TO_DATE('14/09/2020', 'DD/MM/YYYY') ),
    2950000
);

INSERT INTO provide VALUES(
    2,
    4,
    17,
    ( TO_DATE('25/09/2020', 'DD/MM/YYYY') ),
    1970000
);

INSERT INTO provide VALUES(
    6,
    5,
    12,
    ( TO_DATE('14/12/2020', 'DD/MM/YYYY') ),
    1125000
);

INSERT INTO process VALUES(
    1,
    1,
    ( TO_DATE('14/12/2020', 'DD/MM/YYYY') ),
    ( TO_DATE('04:20:00', 'HH24:MI:SS') )
);

INSERT INTO process VALUES(
    2,
    1,
    ( TO_DATE('14/12/2020', 'DD/MM/YYYY') ),
    ( TO_DATE('04:20:00', 'HH24:MI:SS') )
);

INSERT INTO process VALUES(
    3,
    2,
    ( TO_DATE('14/12/2020', 'DD/MM/YYYY') ),
    ( TO_DATE('04:20:00', 'HH24:MI:SS') )
);

INSERT INTO process VALUES(
    2,
    3,
    ( TO_DATE('20/08/2020', 'DD/MM/YYYY') ),
    ( TO_DATE('04:20:00', 'HH24:MI:SS') )
);

INSERT INTO process VALUES(
    4,
    5,
    ( TO_DATE('25/08/2020', 'DD/MM/YYYY') ),
    ( TO_DATE('14:20:00', 'HH24:MI:SS') )
);

INSERT INTO process VALUES(
    2,
    7,
    ( TO_DATE('12/09/2020', 'DD/MM/YYYY') ),
    ( TO_DATE('12:30:00', 'HH24:MI:SS') )
);

INSERT INTO process VALUES(
    3,
    10,
    ( TO_DATE('24/09/2020', 'DD/MM/YYYY') ),
    ( TO_DATE('06:35:00', 'HH24:MI:SS') )
);

INSERT INTO process VALUES(
    2,
    10,
    ( TO_DATE('1/10/2020', 'DD/MM/YYYY') ),
    ( TO_DATE('14:45:00', 'HH24:MI:SS') )
);

--------------------------------------
CREATE TABLE ACCOUNTMANAGER(
    USERNAME VARCHAR(20) NOT NULL PRIMARY KEY,
    PASS VARCHAR(20) NOT NULL,
    FULLNAME VARCHAR(30),
    ADDRESS VARCHAR(20),
    PHONE NUMBER
);

INSERT INTO ACCOUNTMANAGER VALUES(
    'saohoa',
    'thinpro2k',
    'Nguyen Van thin',
    'Quang binh',
    12415235
);
COMMIT;
