DROP TABLE restaurant CASCADE CONSTRAINTS;
CREATE TABLE restaurant (
    rest_name   varchar2(50)    not null,
    rest_id     number(4)       not null,
    seat_cap    number(4)       not null,
    primary key (rest_id)
);

DROP TABLE waiter CASCADE CONSTRAINTS;
CREATE TABLE waiter (
    Wfname      varchar2(25)    not null,
    Wlname      varchar2(25)    not null,
    Wssn        number(9)         not null,
    Wrest_id    number(4)       not null,
    primary key (Wssn),
    foreign key (Wrest_id) references restaurant(rest_id)
);

DROP TABLE host CASCADE CONSTRAINTS;
CREATE TABLE host (
    Hfname      varchar2(25)    not null,
    Hlname      varchar2(25)    not null,
    Hssn        number(9)         not null,
    Hrest_id    number(4)       not null,
    primary key (Hssn),
    foreign key (Hrest_id) references restaurant(rest_id)
);

DROP TABLE menu CASCADE CONSTRAINTS;
CREATE TABLE menu (
    Menu_id     number(4)       not null,
    Mitem_name  varchar2(60)    not null,
    Mrest_id    number(4)       not null,
    Mcost       number(5,2)     not null,
    primary key (Menu_id),
    foreign key (Mrest_id) references restaurant(rest_id)
);

DROP TABLE reservation CASCADE CONSTRAINTS;
CREATE TABLE reservation (
    Reservation_id  number(9)   not null,
    Rrest_id        number(4)   not null,
    Rdatetime       date        not null,
    Rgroup_size     number(2)   not null check (Rgroup_size < 9),
    Rwaiter_ssn     number(9)     not null,
    Rhost_ssn       number(9)     not null,
    primary key (Reservation_id),
    foreign key (Rrest_id) references restaurant(rest_id),
    foreign key (Rwaiter_ssn) references waiter(Wssn),
    foreign key (Rhost_ssn) references host(Hssn)
);

DROP TABLE order_item CASCADE CONSTRAINTS;
CREATE TABLE order_item (
    Oreservation_id number(9)   not null,
    Omenu_id        number(4)   not null,
    primary key (Oreservation_id,Omenu_id),
    foreign key (Oreservation_id) references reservation(Reservation_id),
    foreign key (Omenu_id) references menu(Menu_id)
);

DROP VIEW order_summary;
CREATE VIEW order_summary(reservation_id, subtotal, tax, tip, total)
AS SELECT reservation_id, sum(Mcost), sum(Mcost) * 0.05, sum(Mcost) * 0.2, sum(Mcost) * 1.25
FROM ((reservation JOIN order_item ON Reservation_id = Oreservation_id)
JOIN menu ON Menu_id = Omenu_id)
GROUP BY reservation_id;
