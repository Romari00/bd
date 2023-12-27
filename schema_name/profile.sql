create table schema_name.profile
(
    ProfileName varchar(45) not null,
    idProfile   smallint    not null
        primary key,
    idFaculty   tinyint     not null,
    idMajor     tinyint     not null,
    constraint Profile_Faculty_idFaculty_fk
        foreign key (idFaculty) references schema_name.faculty (idFaculty),
    constraint Profile_Major_idMajor_fk
        foreign key (idMajor) references schema_name.major (idMajor)
);

