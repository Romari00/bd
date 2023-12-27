create definer = root@localhost trigger schema_name.before_insert_studyplan
    before insert
    on schema_name.studyplan
    for each row
BEGIN
    DECLARE current_year INT;

    -- Получаем текущий год
    SET current_year = YEAR(NOW());

    -- Проверяем, что год набора не ранее текущего года
    IF NEW.YearOfEnter < current_year THEN
        SIGNAL SQLSTATE '45000'
        SET MESSAGE_TEXT = 'Год набора учебного плана не может быть ранее текущего года';
    END IF;
END;

