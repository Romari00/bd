create table schema_name.visit
(
    idVisit        int        not null
        primary key,
    Absent         tinyint(1) null,
    Cause          tinyint(1) null,
    id_№_idStudent mediumint  not null,
    idLesson       int        not null,
    constraint Visit_Lesson_idLesson_fk
        foreign key (idLesson) references schema_name.lesson (idLesson),
    constraint Visit_Student_id_№_idStudent_fk
        foreign key (id_№_idStudent) references schema_name.student (id_№_idStudent)
);

