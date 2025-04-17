-- Create the 'students' table
CREATE TABLE students (
    student_id INT PRIMARY KEY,
    student_name VARCHAR(100),
    gender CHAR(1),
    class VARCHAR(20),
    total_score INT,
    admission_date DATE
);

SELECT * FROM students;

INSERT ALL
  INTO students VALUES (101, 'Jean Bosco', 'M', 'Grade 10', 78, TO_DATE('2020-09-01', 'YYYY-MM-DD'))
  INTO students VALUES (102, 'Marie Claire', 'F', 'Grade 10', 85, TO_DATE('2020-09-03', 'YYYY-MM-DD'))
  INTO students VALUES (103, 'Jacques Habimana', 'M', 'Grade 10', 90, TO_DATE('2020-09-02', 'YYYY-MM-DD'))
  INTO students VALUES (104, 'Aline Umutoni', 'F', 'Grade 10', 88, TO_DATE('2020-09-04', 'YYYY-MM-DD'))
  INTO students VALUES (105, 'Eric Mugisha', 'M', 'Grade 10', 92, TO_DATE('2020-09-05', 'YYYY-MM-DD'))
  INTO students VALUES (201, 'Alice Uwase', 'F', 'Grade 11', 80, TO_DATE('2019-09-01', 'YYYY-MM-DD'))
  INTO students VALUES (202, 'Claude Mukamana', 'M', 'Grade 11', 75, TO_DATE('2019-09-02', 'YYYY-MM-DD'))
  INTO students VALUES (203, 'Roger Nkurunziza', 'M', 'Grade 11', 85, TO_DATE('2019-09-03', 'YYYY-MM-DD'))
  INTO students VALUES (204, 'Solange Rwigema', 'F', 'Grade 11', 83, TO_DATE('2019-09-04', 'YYYY-MM-DD'))
  INTO students VALUES (205, 'Merveille Iyamuremye', 'F', 'Grade 11', 88, TO_DATE('2019-09-05', 'YYYY-MM-DD'))
  INTO students VALUES (301, 'Brenda Uwimana', 'F', 'Grade 12', 95, TO_DATE('2018-09-01', 'YYYY-MM-DD'))
  INTO students VALUES (302, 'Yves Rwasibo', 'M', 'Grade 12', 90, TO_DATE('2018-09-03', 'YYYY-MM-DD'))
  INTO students VALUES (303, 'Faith Kayitesi', 'F', 'Grade 12', 93, TO_DATE('2018-09-02', 'YYYY-MM-DD'))
  INTO students VALUES (304, 'Kamanzi Uwamahoro', 'M', 'Grade 12', 89, TO_DATE('2018-09-04', 'YYYY-MM-DD'))
  INTO students VALUES (305, 'Grace Rwigema', 'F', 'Grade 12', 94, TO_DATE('2018-09-05', 'YYYY-MM-DD'))
SELECT * FROM dual;


SELECT 
    student_id,
    student_name,
    class,
    total_score,
    LAG(total_score) OVER (PARTITION BY class ORDER BY total_score) AS previous_score,
    LEAD(total_score) OVER (PARTITION BY class ORDER BY total_score) AS next_score,
    CASE 
        WHEN total_score > LAG(total_score) OVER (PARTITION BY class ORDER BY total_score) THEN 'HIGHER'
        WHEN total_score < LAG(total_score) OVER (PARTITION BY class ORDER BY total_score) THEN 'LOWER'
        ELSE 'EQUAL'
    END AS compare_prev,
    CASE 
        WHEN total_score < LEAD(total_score) OVER (PARTITION BY class ORDER BY total_score) THEN 'LOWER'
        WHEN total_score > LEAD(total_score) OVER (PARTITION BY class ORDER BY total_score) THEN 'HIGHER'
        ELSE 'EQUAL'
    END AS compare_next
FROM students;

SELECT 
    student_id,
    student_name,
    class,
    total_score,
    RANK() OVER (PARTITION BY class ORDER BY total_score DESC) AS rank_score,
    DENSE_RANK() OVER (PARTITION BY class ORDER BY total_score DESC) AS dense_rank_score
FROM students;


SELECT *
FROM (
    SELECT 
        student_id,
        student_name,
        class,
        total_score,
        ROW_NUMBER() OVER (PARTITION BY class ORDER BY total_score DESC) AS row_num
    FROM students
)
WHERE row_num <= 3;


SELECT *
FROM (
    SELECT 
        student_id,
        student_name,
        class,
        admission_date,
        ROW_NUMBER() OVER (PARTITION BY class ORDER BY admission_date ASC) AS admission_rank
    FROM students
)
WHERE admission_rank <= 2;

SELECT 
    student_id,
    student_name,
    class,
    total_score,
    MAX(total_score) OVER (PARTITION BY class) AS max_score_class,
    MAX(total_score) OVER () AS max_score_overall
FROM students;
