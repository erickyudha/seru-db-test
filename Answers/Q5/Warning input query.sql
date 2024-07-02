CREATE OR REPLACE FUNCTION insert_unique_student(input_name VARCHAR, input_age INT, input_class_id INT)
RETURNS VOID AS $$
BEGIN
    IF EXISTS (
        SELECT 1 
        FROM students 
        WHERE name = input_name AND age = input_age AND class_id = input_class_id
    ) THEN
        RAISE EXCEPTION 'Student with the same exact data already exists';
    ELSE
        INSERT INTO students (name, age, class_id) VALUES (input_name, input_age, input_class_id);
    END IF;
END;
$$ LANGUAGE plpgsql;

-- To call procedure, use:
SELECT insert_unique_student('Budi', 16, 1);