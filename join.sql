-- Selezionare tutti gli studenti iscritti al Corso di Laurea in Economia
SELECT `students`.`name`,`students`.`surname`,`students`.`registration_number`,`degrees`.`name`
FROM `students`
INNER JOIN `degrees`
ON `students`.`degree_id` = `degrees`.`id`
WHERE `degrees`.`name` = "Corso di Laurea in Economia"
ORDER BY `students`.`id`;

-- Selezionare tutti i Corsi di Laurea Magistrale del Dipartimento di Neuroscienze 
SELECT `degrees`.`name`, `degrees`.`level`, `departments`.`name`, `departments`.`address`
FROM `degrees`
JOIN `departments`
ON `degrees`.`department_id` = `departments`.`id`
WHERE `degrees`.`level` = 'magistrale'
AND `departments`.`name` = 'Dipartimento di Neuroscienze';

-- Selezionare tutti i corsi in cui insegna Fulvio Amato (id=44)
SELECT `courses`.`name`, `courses`.`period`,`courses`.`year`, `teachers`.`name`,`teachers`.`surname`,`teachers`.`office_address`
FROM `courses`
JOIN `course_teacher`
ON `courses`.`id` = `course_teacher`.`course_id`
JOIN `teachers`
ON `course_teacher`.`teacher_id` = `teachers`.`id`
WHERE `teachers`.`id` = 44

-- Seleziona tutti gli studenti con i dati relativi al corso di laurea a cui sonno iscritti e il relativo dipartimento, in ordine alfabetico per cognome e nome 
SELECT `students`.`surname`, `students`.`name`, `degrees`.`name`,`degrees`.`level`, `departments`.`name`
FROM `students`
JOIN `degrees`
ON `students`.`degree_id` = `degrees`.`id`
JOIN `departments`
ON `degrees`.`department_id` = `departments`.`id`
ORDER BY (`students`.`surname`);

-- Selezionare tutti i corsi di laurea con i relativi corsi e insegnanti
SELECT `degrees`.`name`,`degrees`.`level`,`courses`.`name`,`courses`.`period`,`courses`.`year`,`teachers`.`surname`,`teachers`.`name`,`teachers`.`office_address` FROM `degrees` 
JOIN `courses` 
ON `degrees`.`id` = `courses`.`degree_id` 
JOIN `course_teacher` 
ON `courses`.`id` = `course_teacher`.`course_id` 
JOIN `teachers` 
ON `course_teacher`.`teacher_id` = `teachers`.`id` 
ORDER BY (`degrees`.`name`) ASC;

-- Selezionare tutti i docenti che insegnano nel Dipartimenti di Matematica (54)
SELECT DISTINCT `teachers`.`id`, `teachers`.`surname`, `teachers`.`name`, `departments`.`name`
FROM `teachers` 
JOIN `course_teacher` 
ON `teachers`.`id` = `course_teacher`.`teacher_id` 
JOIN `courses` 
ON `course_teacher`.`course_id` = `courses`.`id` 
JOIN`degrees` 
ON `courses`.`degree_id` = `degrees`.`id` 
JOIN `departments` 
ON `degrees`.`department_id` = `departments`.`id`
WHERE `departments`.`name` = 'Dipartimento di Matematica'
ORDER BY `teachers`.`id` ASC;

-- Selezionare per ogni studente quanti tentativi d'esame ha sostenuto per superare ciascuno dei suoi esami
SELECT `students`.`id`,`students`.`name`,`students`.`surname`, `exam_student`.`vote`, `courses`.`id`,`courses`.`name`
FROM `students`
JOIN `exam_student`
ON `students`.`id` = `exam_student`.`student_id`
JOIN `exams`
ON `exam_student`.`exam_id` = `exams`.`id`
JOIN `courses`
ON `exams`.`course_id` = `courses`.`id`
ORDER BY `students`.`id` ASC
