create definer = root@localhost trigger schema_name.before_insert_visit
    before insert
    on schema_name.visit
    for each row
BEGIN
    DECLARE is_lesson_in_studyplan INT;

    -- Проверяем, есть ли урок в учебном плане группы студента
    SELECT COUNT(*) INTO is_lesson_in_studyplan
    FROM discipline d
    INNER JOIN studyplan sp ON d.idStudyPlan = sp.idStudyPlan
    INNER JOIN `group` g ON sp.idStudyPlan = g.idStudyPlan
    INNER JOIN lesson l ON d.idDiscipline = l.idDiscipline
    WHERE l.idLesson = NEW.idLesson AND g.idGroup = NEW.id_№_idStudent;

    -- Если урок не найден в учебном плане группы, генерируем ошибку
    IF is_lesson_in_studyplan = 0 THEN
        SIGNAL SQLSTATE '45000'
        SET MESSAGE_TEXT = 'Студент должен отмечаться на занятиях только своей группы';
    END IF;
END;

