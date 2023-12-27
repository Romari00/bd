create table schema_name.student
(
    id_№_idStudent mediumint   not null
        primary key,
    Birth          year        not null,
    Adress         varchar(45) not null,
    TelefoneNummer varchar(11) not null,
    FIO            varchar(45) not null,
    YearOfEnter    year        not null,
    idGroup        smallint    not null,
    constraint Student_Group_idGroup_fk
        foreign key (idGroup) references schema_name.`group` (idGroup)
);

