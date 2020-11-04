DROP TABLE restaurant CASCADE CONSTRAINTS;
CREATE TABLE restaurant (
    rest_name   varchar2(50)    not null,
    rest_id     number(4)       not null,
    hours       char(15)        not null, --format: 10:00am-12:00am
    seat_cap    number(4)       not null,
    primary key (rest_id)
);

DROP TABLE waiter CASCADE CONSTRAINTS;
CREATE TABLE waiter (
    Wfname      varchar2(25)    not null,
    Wlname      varchar2(25)    not null,
    Wssn        char(9)         not null,
    Wrest_id    number(4)       not null,
    primary key (Wssn),
    foreign key (Wrest_id) references restaurant(rest_id)
);

DROP TABLE host CASCADE CONSTRAINTS;
CREATE TABLE host (
    Hfname      varchar2(25)    not null,
    Hlname      varchar2(25)    not null,
    Hssn        char(9)         not null,
    Hrest_id    number(4)       not null,
    primary key (Hssn),
    foreign key (Hrest_id) references restaurant(rest_id)
);

DROP TABLE menu CASCADE CONSTRAINTS;
CREATE TABLE menu (
    Menu_id     number(4)       not null,
    Mitem_name  varchar2(25)    not null,
    Mrest_id    number(4)       not null,
    Mcost       number(5,2)     not null,
    primary key (Menu_id),
    foreign key (Mrest_id) references restaurant(rest_id)
);

DROP TABLE reservation CASCADE CONSTRAINTS;
CREATE TABLE reservation (
    Reservation_id  number(9)   not null,
    Rrest_id        number(4)   not null,
    Rdate           date        not null,
    Rtime           char(15)    not null,
    Rgroup_size     number(2)   not null,
    Rwaiter_ssn     char(9)     not null,
    Rhost_ssn       char(9)     not null,
    primary key (Reservation_id),
    foreign key (Rwaiter_ssn) references waiter(Wssn),
    foreign key (Rhost_ssn) references host(Hssn)
);