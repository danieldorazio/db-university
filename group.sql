-- Contare quanti iscritti ci sono stati ogni anno 
SELECT COUNT(*), YEAR(`students`.`enrolment_date`)
FROM `students`
GROUP BY YEAR(`students`.`enrolment_date`);

-- Contare gli insegnanti che hanno l'ufficio nello stesso edificio
SELECT COUNT(*) AS `num_teachers`, `teachers`.`office_address`
FROM `teachers`
GROUP BY (`teachers`.`office_address`);

-- Calcolare la media dei voti di ogni appello d'esame 
SELECT `exam_student`.`exam_id`,AVG (`exam_student`.`vote`)  AS `vote_avg`
FROM `exam_student`
GROUP BY (`exam_student`.`exam_id`);

-- Contare quanti corsi di laurea ci sono per ogni dipartimento 
SELECT `degrees`.`department_id`, COUNT(`degrees`.`department_id`) AS `num_degress`
FROM `degrees`
GROUP BY (`degrees`.`department_id`);
