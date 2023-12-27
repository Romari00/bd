create table schema_name.condlesson
(
    idCondLesson int      not null
        primary key,
    idDiscipline smallint not null,
    idGroup      smallint not null,
    idTeacher    smallint not null,
    idLesson     int      null,
    constraint CondLesson_Discipline_idDiscipline_fk
        foreign key (idDiscipline) references schema_name.discipline (idDiscipline),
    constraint CondLesson_Group_idGroup_fk
        foreign key (idGroup) references schema_name.`group` (idGroup),
    constraint CondLesson_Teachers_idTeacher_fk
        foreign key (idTeacher) references schema_name.teachers (idTeacher),
    constraint idLesson
        foreign key (idLesson) references schema_name.lesson (idLesson)
);

