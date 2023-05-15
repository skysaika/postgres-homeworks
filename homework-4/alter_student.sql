-- 1. Создать таблицу student с полями student_id serial, first_name varchar, last_name varchar, birthday date, phone varchar
CREATE TABLE public.student
(
	student_id serial,
	first_name varchar,
	last_name varchar,
	birthday date,
	phone varchar
);

-- 2. Добавить в таблицу student колонку middle_name varchar
ALTER TABLE public.student ADD COLUMN middle_name varchar;

-- 3. Удалить колонку middle_name
ALTER TABLE public.student DROP COLUMN middle_name;

-- 4. Переименовать колонку birthday в birth_date
ALTER TABLE public.student RENAME birthday TO birth_date;

-- 5. Изменить тип данных колонки phone на varchar(32)
ALTER TABLE public.student ALTER COLUMN phone SET DATA TYPE varchar(32);

-- 6. Вставить три любых записи с автогенерацией идентификатора

INSERT INTO public.student (first_name, last_name, birth_date, phone)
VALUES
    ('Saysuu', 'Ichin-Norbu', '1981-11-10', +7991),
	('Elena', 'Harlamova', '2005-04-11', +7992),
	('Isabella', 'Saplina', '1988-09-27', +7993);

-- 7. Удалить все данные из таблицы со сбросом идентификатор в исходное состояние
TRUNCATE TABLE public.student RESTART IDENTITY;