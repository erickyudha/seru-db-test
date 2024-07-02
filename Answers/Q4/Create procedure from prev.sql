CREATE OR REPLACE PROCEDURE create_sct_view()
LANGUAGE plpgsql
AS $$
BEGIN
    CREATE VIEW student_class_teacher AS
	SELECT 
	    students.name AS student_name,
	    classes.name AS class_name,
	    teachers.name AS teacher_name
	FROM 
	    students
	JOIN 
	    classes ON students.class_id = classes.id
	JOIN 
	    teachers ON classes.teacher_id = teachers.id;
END;
$$;

-- To call procedure, use:
--CALL create_sct_view();
