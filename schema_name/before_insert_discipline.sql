create definer = root@localhost trigger schema_name.before_insert_discipline
    before insert
    on schema_name.discipline
    for each row
BEGIN
    -- Проверяем, что количество часов больше 0
    IF NEW.CountTime <= 0 THEN
        SIGNAL SQLSTATE '45000'
        SET MESSAGE_TEXT = 'Количество часов дисциплины должно быть больше 0';
    END IF;
END;

