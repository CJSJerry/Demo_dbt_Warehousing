create table country (
    id      int,
    name    varchar,
    region  varchar,

    constraint pk_country primary key (id)
);

insert into country values
    (1000, 'Belgium', 'Europe'),
    (1001, 'Spain', 'Europe'),
    (1002, 'Pakistan', 'Asia'),
    (1003, 'Senegal', 'Africa'),
    (1004, 'Greece', 'Europe'),
    (1005, 'Poland', 'Europe'),
    (1006, 'Argentina', 'America'),
    (1007, 'Canada', 'America'),
    (1008, 'Vietnam', 'Asia');

create table customer (
    id                  int,
    name                varchar,
    email               varchar,
    country_id          int,
    premium_customer    varchar,

    constraint pk_customer primary key (id),
    constraint fk_country foreign key (country_id) references country (id)
);

insert into customer values
    (1000, 'Alberto Alvaro', 'alberto@alvaro.com', 1001, 'yes'),
    (1001, 'Quoc Dat Pham', 'qd.pham@bigprojects.com', 1008, 'yes'),
    (1002, 'John Smith', 'john@pocahontas.ca', 1007, 'no'),
    (1003, 'Yiannis Constantinos', 'constantinos@hwb.com', 1004, 'yes'),
    (1004, 'Maxime Van Buyten', 'mvb@city.brussels', 1000, 'no'),
    (1005, 'Jane Doe', 'jdoe@skynet.be', 1000, 'yes');


create table product_category (
    id int,
    name varchar,

    constraint pk_product_category primary key (id)
);

insert into product_category values
    (1000, 'Medical Device'),
    (1001, 'IT & Network Stuff'),
    (1002, 'Dangerous Items'),
    (1003, 'Beauty Accessories'),
    (1004, 'Art & Creativity'),
    (1005, 'Miscellaneous');

create table product (
    id          int,
    reference   varchar,
    name        varchar,
    category_id int,
    price       varchar,

    constraint pk_product primary key (id),
    constraint fk_category foreign key (category_id) references product_category (id)
);

insert into product values
    (1000, 'Prd-75891', 'Awesome product', 1002, '12345'),
    (1001, 'Prd-84970', 'Amazing product', 1000, '4'),
    (1002, 'Prd-94932', 'Splendid product', 1005, '12'),
    (1003, 'Prd-74818', 'Beautiful product', 1003, '90'),
    (1004, 'Prd-33231', 'Extraordinary product', 1003, '5'),
    (1005, 'Prd-74815', 'Phenomenal product', 1001, '789');


create table installation (
    id                  int,
    name                varchar,
    description         varchar,
    product_id          int,
    customer_id         int,
    installation_date   date,

    constraint pk_installation primary key (id),
    constraint fk_product foreign key (product_id) references product (id),
    constraint fk_customer foreign key (customer_id) references customer (id)
);

insert into installation values
    (1000, 'Inst-98037', 'Last minute installation', 1005, 1004, '2021-10-22'),
    (1001, 'Inst-51519', 'Customer request #12345', 1003, 1005, '2021-10-05'),
    (1002, 'Inst-12762', 'Preventive Maintenance', 1000, 1000, '2021-09-01'),
    (1003, 'Inst-22034', 'Unexpectedly broken', 1000, 1001, '2021-09-06'),
    (1004, 'Inst-97278', 'Previous item missing', 1002, 1002, '2021-08-02'),
    (1005, 'Inst-12476', 'Change after bad behavior', 1005, 1003, '2021-08-25'),
    (1006, 'Inst-51115', 'Promotion', 1005, 1004, '2021-07-21'),
    (1007, 'Inst-97282', 'Fidelity offer', 1004, 1001, '2021-07-14'),
    (1008, 'Inst-44740', 'Customer call #4578', 1003, 1000, '2021-10-09'),
    (1009, 'Inst-11213', 'Sale #88', 1004, 1004, '2021-05-10'),
    (1010, 'Inst-51600', 'New customer installation', 1000, 1002, '2021-05-17'),
    (1011, 'Inst-97281', 'Pilot', 1001, 1005, '2021-09-30'),
    (1012, 'Inst-95758', 'Replacement of product', 1005, 1004, '2021-09-01'),
    (1013, 'Inst-12438', 'Upgrade to the latest version', 1003, 1005, '2021-07-02'),
    (1014, 'Inst-30279', 'False alert, but still we installed the new product', 1000, 1000, '2021-08-03'),
    (1015, 'Inst-90761', 'Installation went good', 1000, 1001, '2021-07-04'),
    (1016, 'Inst-12460', 'July 30th: smooth installation', 1002, 1002, '2021-07-30'),
    (1017, 'Inst-00407', 'I missed parts but found a solution', 1005, 1003, '2021-08-06'),
    (1018, 'Inst-08372', 'Free installation', 1005, 1004, '2021-08-07'),
    (1019, 'Inst-04729', 'Customer happy', 1004, 1001, '2021-10-08'),
    (1020, 'Inst-34075', 'Customer request #56789', 1003, 1000, '2021-09-09'),
    (1021, 'Inst-88728', 'Customer request #56715', 1004, 1004, '2021-04-10'),
    (1022, 'Inst-10436', 'Pilot #2', 1000, 1002, '2021-10-11'),
    (1023, 'Inst-47571', 'Final version', 1001, 1005, '2021-09-12'),
    (1024, 'Inst-75801', 'Final Final version', 1005, 1004, '2021-10-13'),
    (1025, 'Inst-34816', 'Final version for good', 1003, 1005, '2021-10-14'),
    (1026, 'Inst-04702', 'New customer installation', 1000, 1000, '2021-09-15'),
    (1027, 'Inst-23592', 'Promotion', 1000, 1001, '2021-10-16'),
    (1028, 'Inst-38164', 'Obsolescence', 1002, 1002, '2021-08-18'),
    (1029, 'Inst-04809', 'Installation for the king', 1005, 1003, '2021-08-19'),
    (1030, 'Inst-38097', 'Sale #47', 1005, 1004, '2021-09-20'),
    (1031, 'Inst-70549', 'Sale #93', 1004, 1001, '2021-08-21'),
    (1032, 'Inst-03780', 'Training', 1003, 1000, '2021-04-22'),
    (1033, 'Inst-90182', 'Test', 1004, 1004, '2021-06-23'),
    (1034, 'Inst-09112', 'Install new product', 1000, 1002, '2021-10-24'),
    (1035, 'Inst-88972', 'Work during weekend', 1001, 1005, '2021-10-16');
