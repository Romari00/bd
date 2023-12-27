create definer = root@localhost trigger schema_name.EnsureHeadStudentInGroup
    before insert
    on schema_name.`group`
    for each row
BEGIN
    DECLARE headStudentCount INT;

    -- Проверка, что староста принадлежит группе
    SELECT COUNT(*)
    INTO headStudentCount
    FROM student
    WHERE id_№_idStudent = NEW.id_№_idStudent AND idGroup = NEW.idGroup;

    -- Если староста не принадлежит группе, генерировать ошибку
    IF headStudentCount = 0 THEN
        SIGNAL SQLSTATE '45000'
        SET MESSAGE_TEXT = 'Староста должен быть студентом этой группы';
    END IF;
END;

