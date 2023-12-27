create table schema_name.discipline
(
    idDiscipline smallint not null
        primary key,
    Term         tinyint  not null,
    CountTime    tinyint  not null,
    idSubject    smallint not null,
    idStudyPlan  smallint not null,
    constraint Discipline_StudyPlan_idStudyPlan_fk
        foreign key (idStudyPlan) references schema_name.studyplan (idStudyPlan),
    constraint Discipline_Subject_idSubject_fk
        foreign key (idSubject) references schema_name.subject (idSubject)
);

