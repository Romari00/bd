create table schema_name.studyplan
(
    idStudyPlan smallint not null
        primary key,
    YearOfEnter int      not null,
    idProfile   smallint not null,
    constraint StudyPlan_Profile_idProfile_fk
        foreign key (idProfile) references schema_name.profile (idProfile)
);

