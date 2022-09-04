SET SQL_SAFE_UPDATES = 0;
delete from form_entity_sections;
delete from form_entity;
delete from section_entity;
delete from question_entity_choice_entity_list;
delete from choice_entity;
delete from question_entity;
--- SECCION 0
INSERT INTO QUESTION_ENTITY (dtype,id,description,image_url,is_mandatory,question_type,title,next_if_false_id,next_if_true_id,next_question_id) 
    VALUES ("TextQuestionEntity",1,"pregunta de texto no obligatoria",NULL,0,"TEXT_TYPE","pregunta 1",NULL,NULL,NULL);

INSERT INTO QUESTION_ENTITY (dtype,id,description,image_url,is_mandatory,question_type,title,next_if_false_id,next_if_true_id,next_question_id)
    VALUES ("TextQuestionEntity",0,"pregunta de texto obligatoria",NULL,1,"TEXT_TYPE","pregunta 0",NULL,NULL,1);

insert into section_entity (id, description, name, question_id) 
    values (0, "preguntas de texto obligatorias y no obligatorias", "preguntas de texto", 0);

--- SECCION 1
INSERT INTO QUESTION_ENTITY (dtype,id,description,image_url,is_mandatory,question_type,title,next_if_false_id,next_if_true_id,next_question_id)
    VALUES ("TextQuestionEntity",4,"esta pregunta sale si has marcado falso en la anterior",NULL,1,"TEXT_TYPE","pregunta 4",NULL,NULL,NULL);

INSERT INTO QUESTION_ENTITY (dtype,id,description,image_url,is_mandatory,question_type,title,next_if_false_id,next_if_true_id,next_question_id) 
    VALUES ("TextQuestionEntity",3,"esta pregunta sale si has marcado verdadero en la anterior",NULL,0,"TEXT_TYPE","pregunta 3",NULL,NULL,NULL);

INSERT INTO QUESTION_ENTITY (dtype,id,description,image_url,is_mandatory,question_type,title,next_if_false_id,next_if_true_id,next_question_id) 
    VALUES ("BoolQuestionEntity",2,"pregunta de verdadero o falso",NULL,0,"BOOL_TYPE","pregunta 2",4,3,NULL);

insert into section_entity (id, description, name, question_id)
    values (1, "preguntas con respuestas de verdadero o falso con flujos distintos según la elección", "preguntas verdader o falso", 2);

--- SECCION 2
INSERT INTO QUESTION_ENTITY (dtype,id,description,image_url,is_mandatory,question_type,title,next_if_false_id,next_if_true_id,next_question_id)
    VALUES ("TextQuestionEntity",10,"esta pregunta sale siempre",NULL,1,"TEXT_TYPE","pregunta 10",NULL,NULL,NULL);

insert into choice_entity (id, name, next_question_id) values (4, "opcion 1", 10);
insert into choice_entity (id, name, next_question_id) values (5, "opcion 2", 10);
insert into choice_entity (id, name, next_question_id) values (6, "opcion 3", 10);
insert into choice_entity (id, name, next_question_id) values (7, "opcion 4", 10);
insert into choice_entity (id, name, next_question_id) values (8, "opcion 5", 10);


INSERT INTO QUESTION_ENTITY (dtype,id,description,image_url,is_mandatory,question_type,title,next_if_false_id,next_if_true_id,next_question_id, allow_multiple, default_question_id)
    VALUES ("MultipleChoiceQuestionEntity",9,"pregunta con opciones multiples",NULL,1,"MULTIPLE_TYPE","pregunta 9",NULL,NULL,NULL, 1, 10);

insert into question_entity_choice_entity_list (multiple_choice_question_entity_id, choice_entity_list_id)
    values(9, 4);
insert into question_entity_choice_entity_list (multiple_choice_question_entity_id, choice_entity_list_id)
    values(9, 5);
insert into question_entity_choice_entity_list (multiple_choice_question_entity_id, choice_entity_list_id)
    values(9, 6);
insert into question_entity_choice_entity_list (multiple_choice_question_entity_id, choice_entity_list_id)
    values(9, 7);
insert into question_entity_choice_entity_list (multiple_choice_question_entity_id, choice_entity_list_id)
    values(9, 8);


INSERT INTO QUESTION_ENTITY (dtype,id,description,image_url,is_mandatory,question_type,title,next_if_false_id,next_if_true_id,next_question_id)
    VALUES ("TextQuestionEntity",8,"esta pregunta sale si no has elegido ninguna",NULL,1,"TEXT_TYPE","pregunta 8",NULL,NULL,9);

INSERT INTO QUESTION_ENTITY (dtype,id,description,image_url,is_mandatory,question_type,title,next_if_false_id,next_if_true_id,next_question_id)
    VALUES ("TextQuestionEntity",7,"esta pregunta sale si has elegido la opcion 1",NULL,1,"TEXT_TYPE","pregunta 7",NULL,NULL,9);

INSERT INTO QUESTION_ENTITY (dtype,id,description,image_url,is_mandatory,question_type,title,next_if_false_id,next_if_true_id,next_question_id)
    VALUES ("TextQuestionEntity",6,"esta pregunta sale si has elegido la opcion 2",NULL,1,"TEXT_TYPE","pregunta 6",NULL,NULL,9);

insert into choice_entity (id, name, next_question_id) values (0, "opcion 1", 7);
insert into choice_entity (id, name, next_question_id) values (1, "opcion 2", 6);
insert into choice_entity (id, name, next_question_id) values (2, "opcion 3", 9);
insert into choice_entity (id, name, next_question_id) values (3, "opcion 4", 9);

INSERT INTO QUESTION_ENTITY (dtype,id,description,image_url,is_mandatory,question_type,title,next_if_false_id,next_if_true_id,next_question_id, allow_multiple, default_question_id)
    VALUES ("MultipleChoiceQuestionEntity",5,"pregunta con opciones multiples",NULL,0,"MULTIPLE_TYPE","pregunta 5",NULL,NULL,NULL, 0, 8);

insert into question_entity_choice_entity_list (multiple_choice_question_entity_id, choice_entity_list_id)
    values(5, 0);
insert into question_entity_choice_entity_list (multiple_choice_question_entity_id, choice_entity_list_id)
    values(5, 1);
insert into question_entity_choice_entity_list (multiple_choice_question_entity_id, choice_entity_list_id)
    values(5, 2);
insert into question_entity_choice_entity_list (multiple_choice_question_entity_id, choice_entity_list_id)
    values(5, 3);


insert into section_entity (id, description, name, question_id)
    values (2, "pruebas con preguntas de multiples opciones", "Preguntas multiples opciones", 5);


--- FORMULARIO
insert into form_entity (id, description, name) values (0, "descripcion del formulario 1", "formulario 1");
insert into form_entity_sections (form_entity_id, sections_id) values (0, 0);
insert into form_entity_sections (form_entity_id, sections_id) values (0, 1);
insert into form_entity_sections (form_entity_id, sections_id) values (0, 2);
