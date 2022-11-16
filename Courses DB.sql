/* CREAR TODAS LAS TABLAS */

CREATE TABLE "users" (
    "id" uuid PRIMARY KEY,
    "name" varchar,
    "email" varchar,
    "password" varchar,
    "age" int
);

CREATE TABLE "course_users" (
    "id" uuid PRIMARY KEY,
    "course_id" uuid,
    "user_id" uuid,
    "course_progress" int,
    "course_feedback" text
);

CREATE TABLE "courses" (
    "id" uuid PRIMARY KEY,
    "title" varchar,
    "description" text,
    "price" float
);

CREATE TABLE "course_levels" (
    "id" uuid PRIMARY KEY,
    "level_id" int,
    "course_id" uuid
);

CREATE TABLE "levels" (
    "id" serial PRIMARY KEY,
    "name" varchar
);

CREATE TABLE "course_videos" (
    "id" uuid PRIMARY KEY,
    "course_id" uuid,
    "video_id" uuid
);

CREATE TABLE "videos" (
    "id" uuid PRIMARY KEY,
    "title" varchar,
    "url_video" varchar
);

CREATE TABLE "course_categories" (
    "id" uuid PRIMARY KEY,
    "category_id" int,
    "course_id" uuid
);

CREATE TABLE "categories" (
    "id" serial PRIMARY KEY,
    "name" varchar
);

CREATE TABLE "user_roles" (
    "id" uuid PRIMARY KEY,
    "rol_id" int,
    "user_id" uuid
);

CREATE TABLE "roles" (
    "id" serial PRIMARY KEY,
    "name" varchar
);

/* CREAR LLAVES FORANEAS */

ALTER TABLE "course_videos" ADD FOREIGN KEY ("course_id") REFERENCES "courses" ("id");

ALTER TABLE "course_users" ADD FOREIGN KEY ("course_id") REFERENCES "courses" ("id");

ALTER TABLE "course_users" ADD FOREIGN KEY ("user_id") REFERENCES "users" ("id");

ALTER TABLE "course_levels" ADD FOREIGN KEY ("level_id") REFERENCES "levels" ("id");

ALTER TABLE "course_levels" ADD FOREIGN KEY ("course_id") REFERENCES "courses" ("id");

ALTER TABLE "course_categories" ADD FOREIGN KEY ("course_id") REFERENCES "courses" ("id");

ALTER TABLE "course_categories" ADD FOREIGN KEY ("category_id") REFERENCES "categories" ("id");

ALTER TABLE "course_videos" ADD FOREIGN KEY ("video_id") REFERENCES "videos" ("id");

ALTER TABLE "user_roles" ADD FOREIGN KEY ("rol_id") REFERENCES "roles" ("id");

ALTER TABLE "user_roles" ADD FOREIGN KEY ("user_id") REFERENCES "users" ("id");

/* CREAR LOS DATOS PARA LAS TABLAS */

INSERT INTO categories (
	"name"
) VALUES ( 'Diseño' ), ( 'Programación' );

INSERT INTO levels (
	"name"
) VALUES ( 'Basico' ), ( 'Intermedio' ), ( 'Avanzado' );

INSERT INTO courses (
	id,
	title,
	description,
	price
) VALUES (
	'a197f0bf-6144-44e5-88e1-1b224742821a',
	'HTML Basico - Intermedio',
	'Curso donde aprederemos las bases de HTML para empezar a construir un sitio web.'
	,9.99
), (
	'71f1ef60-fe23-4770-806c-020c80b2877f',
	'Photoshop Avanzado',
	'Curso donde aprenderemos sobre todos los usos que podemos darle a esta herramienta de Adobe.'
	,14.99
);

INSERT INTO videos (
	id,
	title,url_video
) VALUES (
	'7c885a14-c15d-4c85-a67b-14fac551e43c',
	'Aprende HTML en 15 Minutos',
	'https://www.youtube.com/watch?v=mNbnV3aN3KA'
), (
	'823f3d53-7b5f-45cf-a737-4ce64bf02b3c',
	'Photoshop Avanzado - Diseño publicitario y manipulación digital.',
	'https://www.youtube.com/watch?v=eIY3ut1RMHM'
);

INSERT INTO users (
	id,
	"name",
	email,
	"password",
	age
) VALUES (
	'a31fec63-3029-4d8d-9936-60fec436186a',
	'Alessandro Fernandez',
	'ariagt191000@gmail.com',
	'carachama12',
	19
), (
	'73483f01-5ca1-460a-8ec6-f533ae5cf56f',
	'Carlos Sesma',
	'carlosarte@gmail.com',
	'carlosroot',
	26
), (
	'c4ac97a3-cda0-4c6b-93e3-e12d28da7944',
	'Victor Robles',
	'vicroblesweb@gmail.com',
	'vicroot',
	35
);

INSERT INTO roles ("name") VALUES
    ('Estudiante'),
    ('Maestro'),
    ('Admin');

INSERT INTO course_categories (
	id,
	category_id,
	course_id
) VALUES (
	'5e3a400c-aa34-4168-8e55-3808f7cc87f3',
	2,
	'a197f0bf-6144-44e5-88e1-1b224742821a'
), (
	'a90fa5d6-8948-43ad-8cf6-1aa9f7332692',
	1,
	'71f1ef60-fe23-4770-806c-020c80b2877f'
);

INSERT INTO course_levels (
	id,
	level_id,
	course_id
) VALUES (
    '5044b4f0-e227-4731-a744-93959afbedf5',
    1,
    'a197f0bf-6144-44e5-88e1-1b224742821a'
), (
    '7242d0d0-50fd-4267-a676-9cc9a5c748c1',
    3,
    '71f1ef60-fe23-4770-806c-020c80b2877f'
);

INSERT INTO course_videos (
	id,
	course_id,
	video_id
) VALUES (
	'1a5c7403-1253-4bb3-875b-968634c6cd6a',
	'a197f0bf-6144-44e5-88e1-1b224742821a',
	'7c885a14-c15d-4c85-a67b-14fac551e43c'
), (
	'a59e05fe-d451-4e0c-9ff9-05c232b1751c',
	'71f1ef60-fe23-4770-806c-020c80b2877f',
	'823f3d53-7b5f-45cf-a737-4ce64bf02b3c'
);

INSERT INTO course_users (
	id,
	course_id,
	user_id,
	course_progress,
	course_feedback
) VALUES (
	'0ff0f134-45ad-4a3c-a48c-61f7cda8321d',
	'a197f0bf-6144-44e5-88e1-1b224742821a',
	'c4ac97a3-cda0-4c6b-93e3-e12d28da7944',
	NULL,
	NULL
), (
	'ed9b7c59-23d4-49f1-8cf0-1b1f0445e1e9',
	'71f1ef60-fe23-4770-806c-020c80b2877f',
	'73483f01-5ca1-460a-8ec6-f533ae5cf56f',
	NULL,
	NULL
);

INSERT INTO user_roles (
	id,
	rol_id,
	user_id
) VALUES (
	'71b85844-5a74-4d6a-8919-4afcdaf9600d',
	3,
	'a31fec63-3029-4d8d-9936-60fec436186a'
), (
	'11c6fffd-912d-4c85-b814-3ed21f43e0e0',
	2,
	'c4ac97a3-cda0-4c6b-93e3-e12d28da7944'
), (
	'5e2eb155-9f48-4742-a586-ebe1f17a9660',
	2,
	'73483f01-5ca1-460a-8ec6-f533ae5cf56f'
);

SELECT 
	courses.title AS course_title,
	categories."name" AS category,
	levels."name" AS level,
	videos.title AS video_title,
	users.name AS course_teacher
FROM
	courses
INNER JOIN course_videos ON courses.id = course_videos.course_id
INNER JOIN videos ON course_videos.video_id = videos.id
INNER JOIN course_levels ON courses.id = course_levels.course_id
INNER JOIN levels ON course_levels.level_id = levels.id
INNER JOIN course_categories ON courses.id = course_categories.course_id
INNER JOIN categories ON course_categories.category_id = categories.id
INNER JOIN course_users ON courses.id = course_users.course_id
INNER JOIN users ON course_users.user_id = users.id
INNER JOIN user_roles ON users.id = user_roles.user_id
INNER JOIN roles ON user_roles.rol_id = roles.id
