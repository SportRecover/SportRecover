Feature: Gestión del plan terapéutico, carga documental y generación de rutinas por IA
US03: Carga de documentos médicos
Scenario 1: Carga de documentos exitosa
Given que el deportista se encuentra en la sección "Mis documentos"
When selecciona el archivo en formato PDF o imagen y presiona "Subir documento"
Then el sistema procesa y almacena el archivo
And muestra una confirmación "Documento cargado exitosamente"
And el archivo queda disponible para análisis de la IA
Scenario 2: Carga fallida por formato no soportado
Given que el deportista intenta subir un archivo en formato no permitido
When selecciona el archivo y presiona "Subir"
Then el sistema muestra el mensaje "Formato de archivo no permitido. Use PDF o imagen"
And no procesa el archivo
US04: Generación de rutina personalizada por IA
Scenario 1: Generación exitosa de rutina
Given que el deportista ha cargado su diagnóstico y documentos médicos
When el sistema analiza la información mediante IA
Then genera una rutina personalizada con ejercicios, repeticiones, series y tiempos de descanso
And muestra la rutina en la sección "Mi plan de rehabilitación"
Scenario 2: Generación fallida por documentos incompletos
Given que el deportista no ha subido todos los documentos requeridos
When intenta generar la rutina
Then el sistema muestra el mensaje "Faltan documentos necesarios para generar tu plan"
And lista los documentos pendientes de carga
US05: Visualización de rutina diaria
Scenario 1: Visualización correcta de la rutina diaria
Given que el deportista accede a la sección "Hoy" de la aplicación
When el sistema carga la rutina del día
Then muestra la lista de ejercicios con nombre, número de repeticiones, series, duración y descripción
And cada ejercicio incluye un video demostrativo de la técnica correcta
Scenario 2: Rutina sin ejercicios asignados para el día
Given que el deportista no tiene ejercicios programados para ese día
When accede a la sección "Hoy"
Then el sistema muestra el mensaje "Hoy es tu día de descanso. ¡Sigue así!"
And ofrece consejos de recuperación activa
US16: Consulta del plan fisioterapéutico asignado
Scenario 1: Visualización del plan fisioterapéutico completo
Given que el deportista accede a la sección "Mi plan"
When el sistema carga el plan validado por el fisioterapeuta
Then muestra las fases del plan, objetivos por fase, ejercicios asociados, duración estimada y criterios de avance de fase
And permite navegar entre las distintas fases
Scenario 2: Plan fisioterapéutico pendiente de validación
Given que el fisioterapeuta aún no ha validado el plan generado por IA
When el deportista accede a "Mi plan"
Then el sistema muestra el mensaje "Tu plan está en revisión por tu fisioterapeuta"
And indica el tiempo estimado de respuesta
US17: Recepción de ajuste de rutina por el fisioterapeuta
Scenario 1: Notificación de ajuste de rutina recibida
Given que el fisioterapeuta modifica la rutina del deportista
When los cambios son guardados en el sistema
Then el deportista recibe una notificación push indicando "Tu fisioterapeuta ha actualizado tu rutina"
And al ingresar a la aplicación, la rutina actualizada está disponible con los cambios resaltados
Scenario 2: Comparativa entre rutina anterior y nueva
Given que el deportista recibió una notificación de ajuste de rutina
When accede a la sección "Mi plan actualizado"
Then el sistema muestra lado a lado los ejercicios anteriores y los nuevos
And resalta en verde los ejercicios agregados y en rojo los eliminados
US22: Confirmación de inicio de rehabilitación
Scenario 1: Confirmación de inicio exitosa
Given que el fisioterapeuta ha validado el plan de rehabilitación del deportista
When el deportista presiona "Iniciar mi rehabilitación"
Then el sistema registra la fecha de inicio
And activa el seguimiento del calendario adaptativo desde ese día
Scenario 2: Intento de inicio sin plan validado
Given que el plan del deportista aún no ha sido validado por el fisioterapeuta
When intenta iniciar la rehabilitación
Then el sistema muestra el mensaje "Tu plan aún no ha sido aprobado por tu fisioterapeuta"
And bloquea el inicio hasta obtener la validación
US23: Visualización de fase actual de recuperación
Scenario 1: Visualización de fase de recuperación activa
Given que el deportista accede a la sección "Mi progreso"
When el sistema evalúa el avance según las métricas registradas
Then muestra la fase actual (por ejemplo, "Fase 2: Fortalecimiento"), el porcentaje completado de esa fase y los criterios para avanzar a la siguiente
And presenta recomendaciones para alcanzar los objetivos de la fase
Scenario 2: Transición automática a siguiente fase
Given que el deportista ha cumplido todos los criterios de avance de la fase actual
When el sistema valida el cumplimiento
Then notifica al deportista "¡Has avanzado a la Fase 3!"
And actualiza el plan con los ejercicios de la nueva fase
