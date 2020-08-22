diagnosticar:-
diabetes(Enfermedad),
write('El diagnostico puede ser: '), write(Enfermedad),
nl,
write('Muchas Gracias! Vuelva Pronto.'),
deshacer.

%Reglas
%Tipos de Diabetes 1 y 2
diabetes(diabetes_tipo_1_paciente) :- diabetes_tipo_1_paciente.
diabetes(diabetes_tipo_2_paciente) :- diabetes_tipo_2_paciente.
diabetes(diabetes_tipo_1_medico) :- diabetes_tipo_1_medico.
diabetes(diabetes_tipo_2_medico) :- diabetes_tipo_2_medico.
diabetes(desconocido).

%Base de conocimiento
diabetes_tipo_1_paciente :- auth_paciente('paciente'), auth_paciente('menor de edad'),
verificar_paciente('niveles altos de glucosa en la sangre'),
verificar_paciente('niveles altos de glucosa en la orina'),
verificar_paciente('poca sed'),
verificar_paciente('orina frecuentemente'),
verificar_paciente('hambre extrema y poco peso corporal'),
verificar_paciente('vision borrosa'),
verificar_paciente('nausea y vomito'),
verificar_paciente('cansancio'),
verificar_paciente('irritabilidad y cambios de animo'),

write('Consejos para controlar la diabetes mellitus tipo 1 :'),
nl,
write('1: Realice un recuento de hidratos de carbono, grasa y proteínas.'),
nl,
write('2: Controle muy de cerca el azucar en la sangre.'),
nl,
write('3: Consuma alimentos saludables,'),
nl,
write('4: Haga ejercicio de forma regular y mantenga un peso saludable.'),
nl,nl.

diabetes_tipo_2_paciente :- auth_paciente('paciente'), auth_paciente('mayor de edad'),
verificar_paciente('infecciones frecuentes que no se curan fácilmente'),
verificar_paciente('piel reseca con comezon'),
verificar_paciente('hormigueo o pérdida de sensibilidad en las manos o en los pies'),
verificar_paciente('zonas de piel oscurecida, habitualmente en las axilas y el cuello'),
verificar_paciente('niveles altos de glucosa en la sangre'),
verificar_paciente('niveles altos de glucosa en la orina'),
verificar_paciente('poca sed'),
verificar_paciente('orina frecuentemente'),
verificar_paciente('hambre extrema y poco peso corporal'),
verificar_paciente('vision borrosa'),
verificar_paciente('nausea y vomito'),
verificar_paciente('cansancio'),
verificar_paciente('irritabilidad y cambios de animo'),

write('Consejos para controlar la diabetes mellitus tipo 2 :'),
nl,
write('1: Pierda peso si existe sobrepeso u obesidad.'),
nl,
write('2: Realice ejercicio físico, que en principio debe ser aeróbico, con una actividad mínima de 30 minutos, cuatro o cinco veces por semana.'),
nl,
write('3: Aliméntese con una dieta alimenticia pobre en sal y rica en frutas y verduras.'),
nl,
write('4: Reduzca las grasas saturadas y aumente los ácidos grasos insaturados.'),
nl,
write('5: Evite fumar y beber alcohol.'),
nl,nl.

diabetes_tipo_1_medico :- auth_medico('medico'),
verificar_medico('presencia de anticuerpos en analisis de sangre'),
verificar_medico('presencia de cetonas en analisis de sangre y orina'),
verificar_medico('examen de hemoglobina glicosilada (A1C) es >= a 6,5'),
verificar_medico('examen de glucemia plasmatica es >= a 200mg/dl'),
verificar_medico('examen de glucemia plasmatica en ayunas es >= a 126mg/dl'),

write('Medicamentos para controlar la glucemia en pacientes diagnosticados con diabetes mellitus tipo 1:'),
nl,
write('1: Insulina de accion breve, rapida, intermedia, prolongada'),
nl,
write('2: Inhibidores de la enzima convertidora de la angiotensina o bloqueadores de los receptores de angiotensina II'),
nl,
write('3: Aspirinas.'),
nl,nl.

diabetes_tipo_2_medico :- auth_medico('medico'),
verificar_medico('examen de hemoglobina glicosilada (A1C) es >= a 6,5'),
verificar_medico('examen de glucemia plasmatica es >= a 200mg/dl'),
verificar_medico('examen de glucemia plasmatica en ayunas es >= a 126mg/dl'),

write('Medicamentos para controlar la glucemia en pacientes diagnosticados con diabetes mellitus tipo 2:'),
nl,
write('1: Metformina (Glucophage, Glumetza, otros).'),
nl,
write('2: Sulfonilurea.s'),
nl,
write('3: Meglitinidas.'),
nl,
write('4: Tiazolidinadionas.'),
nl,
write('5: Inhibidores de la DPP-4.'),
nl,
write('6: Agonistas del receptor de la GLP-1.'),
nl,
write('7: Inhibidores de la SGLT2.'),
nl,
write('8: Insulina'),
nl,nl.

%Preguntas
es_paciente(Pregunta) :-
write('Es usted '),
write(Pregunta),
write('? '),
nl,
read(Respuesta),
nl,
((Respuesta == si)->assert(si(Pregunta)) ;assert(no(Pregunta)), fail).

:- dynamic si/1,no/1.

auth_paciente(S) :-
(si(S)->true ;(no(S)->fail ; es_paciente(S))).

es_medico(Pregunta) :-
write('Es usted '),
write(Pregunta),
write('? '),
nl,
read(Respuesta),
nl,
((Respuesta == si)->assert(si(Pregunta)) ;assert(no(Pregunta)), fail).

:- dynamic si/1,no/1.

auth_medico(S) :-
(si(S)->true ;(no(S)->fail ; es_medico(S))).


preguntar_paciente(Pregunta) :-
write('Usted tiene los siguentes sintomas: '),
write(Pregunta),
write('? '),
nl,
read(Respuesta),
nl,
((Respuesta == si)->assert(si(Pregunta)) ;assert(no(Pregunta)), fail).

:- dynamic si/1,no/1.

verificar_paciente(S) :-
(si(S)->true ;(no(S)->fail ; preguntar_paciente(S))).


preguntar_medico(Pregunta) :-
write('El paciente tiene las siguientes valoraciones: '),
write(Pregunta),
write('? '),
nl,
read(Respuesta),
nl,
((Respuesta == si)->assert(si(Pregunta)) ;assert(no(Pregunta)), fail).

:- dynamic si/1,no/1.

verificar_medico(S) :-
(si(S)->true ;(no(S)->fail ; preguntar_medico(S))).


deshacer :- retract(si(_)),fail.
deshacer :- retract(no(_)),fail.
deshacer.
