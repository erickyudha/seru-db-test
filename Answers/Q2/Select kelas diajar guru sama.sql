INSERT INTO classes (name, teacher_id) VALUES ('Kelas 10B', 2);
INSERT INTO classes (name, teacher_id) VALUES ('Kelas 11A', 3);
-- For testing this question only

SELECT 
    teachers.name AS teacher_name,
    string_agg(classes.name, ', ') AS classes_taught
FROM 
    classes
JOIN 
    teachers ON classes.teacher_id = teachers.id
GROUP BY 
    teachers.name;
