create definer = root@localhost trigger schema_name.before_insert_student
    before insert
    on schema_name.student
    for each row
BEGIN
    DECLARE current_year INT;
    DECLARE year_of_enter INT;

    -- Получаем текущий год
    SET current_year = YEAR(NOW());

    -- Получаем год поступления студента из вставляемой записи
    SET year_of_enter = NEW.YearOfEnter;

    -- Проверяем, что год поступления не превышает текущий год
    IF year_of_enter > current_year THEN
        SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'Год поступления студента не может превышать текущий год';
    END IF;
END;

