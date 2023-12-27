create table schema_name.`group`
(
    NameOfGroup    varchar(6) not null,
    idGroup        smallint   not null
        primary key,
    id_№_idStudent mediumint  null,
    idStudyPlan    smallint   not null,
    constraint Group_Student_id_№_idStudent_fk
        foreign key (id_№_idStudent) references schema_name.student (id_№_idStudent),
    constraint Group_StudyPlan_idStudyPlan_fk
        foreign key (idStudyPlan) references schema_name.studyplan (idStudyPlan)
);

