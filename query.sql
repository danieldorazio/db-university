-- Selezionare tutti gli studenti nati nel 1990
SELECT*
FROM `students`
WHERE `date_of_birth` BETWEEN '1990-01-01' AND '1990-12-31'
ORDER BY 'date_of_birth' ASC;


-- Selezionare tutti i corsi che valgono più di 10 crediti
SELECT *
FROM `courses`
WHERE `cfu` > 10
ORDER BY `cfu` ASC;

-- Selezionare tutti gli studenti che hanno più di 30 anni 
SELECT TIMESTAMPDIFF(YEAR, CURRENT_DATE, `date_of_birth`)
FROM `students`;

-- Selezionare tutti i corsi del primo semestre del primo anno di un qualsiasi corso di laurea 
SELECT *
FROM `courses`
WHERE `period` = 'I semestre' AND `year` = '1'
ORDER BY `cfu` ASC;

-- Selezionare tutti gli appelli d'esame che avvengono nel pomeriggio (dopo le 14) del 20/06/2020
SELECT *
FROM `exams` 
WHERE `date` BETWEEN '20-06-20' AND '20-06-20'
AND `hour` BETWEEN '14:00:00' AND '24:00:00'
ORDER BY `date` ASC;

-- Selezionare tutti i corsi di laurea magistrale 
SELECT *
FROM `degrees`
WHERE `level` = 'magistrale'
ORDER BY `level` ASC;

-- Da quanti dipartimenti è composta l'università?
SELECT COUNT(*) AS `num_departments`
FROM `departments`;

-- Quanti sono gli insegnanti che non hanno il numero di telefono
SELECT COUNT(*) AS `prof_no_tel`
FROM `teachers`
WHERE `phone` IS NULL;