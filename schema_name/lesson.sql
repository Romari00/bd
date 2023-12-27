create table schema_name.lesson
(
    DateOfLesson   date        not null,
    NumOfLesson    tinyint(1)  not null,
    Theme          varchar(60) not null,
    idLesson       int         not null
        primary key,
    idKindOfLesson tinyint(1)  not null,
    idDiscipline   smallint    null,
    constraint idDiscipline
        foreign key (idDiscipline) references schema_name.discipline (idDiscipline),
    constraint lesson_kindoflesson_idKindOfLesson_fk
        foreign key (idKindOfLesson) references schema_name.kindoflesson (idKindOfLesson)
);

