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