Feature: Gestión clínica, validación de planes, ajustes terapéuticos y seguimiento especializado
#US27: Visualización del listado de pacientes
  Scenario 1: Listado de pacientes cargado correctamente
    Given que el fisioterapeuta accede al panel principal
    When el sistema carga el módulo de pacientes
    Then muestra una lista con nombre, tipo de lesión, fase actual, último acceso y porcentaje de adherencia de cada paciente
    And permite ordenar la lista por nombre, adherencia o fase
  Scenario 2: Filtrado de pacientes por estado
    Given que el fisioterapeuta desea ver solo pacientes con baja adherencia
    When aplica el filtro "Adherencia menor al 50%"
    Then el sistema actualiza la lista mostrando solo los pacientes que cumplen el criterio
    And resalta los casos con menor adherencia
#US29: Validación del plan de rehabilitación generado por IA
  Scenario 1: Validación exitosa del plan generado
    Given que el fisioterapeuta accede al plan pendiente de validación de un paciente
    When revisa los ejercicios propuestos y presiona "Aprobar plan"
    Then el sistema registra la validación con fecha y nombre del fisioterapeuta
    And notifica al paciente que su plan ha sido aprobado
    And activa el plan en la aplicación del paciente
  Scenario 2: Rechazo y solicitud de regeneración del plan
    Given que el fisioterapeuta considera que el plan generado no es adecuado para el paciente
    When presiona "Rechazar plan" e ingresa el motivo del rechazo
    Then el sistema registra la observación
    And marca el plan como "Pendiente de revisión"
#US30: Ajuste remoto de la rutina del paciente
  Scenario 1: Modificación exitosa de ejercicios de la rutina
    Given que el fisioterapeuta accede a la rutina activa de un paciente
    When modifica la cantidad de repeticiones, series o agrega un nuevo ejercicio y presiona "Guardar cambios"
    Then el sistema actualiza la rutina en la aplicación del paciente
    And notifica al paciente sobre la modificación realizada
  Scenario 2: Eliminación de ejercicio contraindicado
    Given que el fisioterapeuta identifica un ejercicio contraindicado para el estado actual del paciente
    When selecciona el ejercicio y presiona "Eliminar"
    Then el sistema elimina el ejercicio de la rutina activa
    And registra el motivo de eliminación en el historial clínico del paciente
#US33: Asignación de fisioterapeuta a paciente
  Scenario 1: Asignación exitosa de paciente
    Given que un paciente ha sido asignado al fisioterapeuta
    When el fisioterapeuta inicia sesión
    Then el nuevo paciente aparece en su listado con estado "Nuevo"
    And recibe una notificación de la nueva asignación
  Scenario 2: Visualización de pacientes asignados
    Given que el fisioterapeuta tiene pacientes asignados
    When accede al módulo de pacientes
    Then el sistema muestra únicamente los pacientes asociados a su cuenta profesional
#US37: Registro de notas clínicas por paciente
  Scenario 1: Registro exitoso de nota clínica
    Given que el fisioterapeuta accede al perfil de un paciente
    When escribe una nota clínica y presiona "Guardar nota"
    Then el sistema registra la nota con fecha, hora y autor
    And la nota queda disponible en el historial clínico del paciente
  Scenario 2: Edición de nota clínica registrada
    Given que el fisioterapeuta desea corregir una nota clínica previamente guardada
    When selecciona la nota y presiona "Editar"
    Then puede modificar el contenido y guardar los cambios
    And el sistema registra la actualización correspondiente
#US39: Revisión de videos de ejercicios del paciente
  Scenario 1: Reproducción de video de ejercicio del paciente
    Given que el fisioterapeuta accede al historial de sesiones de un paciente
    When selecciona una sesión y un ejercicio específico
    Then el sistema reproduce el video asociado al ejercicio
    And muestra las métricas registradas durante la ejecución
  Scenario 2: Adición de comentario de corrección al video
    Given que el fisioterapeuta revisa un video y detecta una mejora necesaria
    When registra un comentario de retroalimentación
    Then el sistema guarda la observación
    And notifica al paciente que tiene nueva retroalimentación disponible
#US40: Visualización de avance de fases del paciente
  Scenario 1: Visualización del estado de fase del paciente
    Given que el fisioterapeuta accede al perfil de un paciente
    When consulta la sección de fases
    Then el sistema muestra la fase actual, criterios cumplidos y pendientes
    And muestra el progreso general del proceso de rehabilitación
  Scenario 2: Actualización de fase del paciente
    Given que el fisioterapeuta determina que el paciente debe cambiar de fase
    When realiza la actualización correspondiente
    Then el sistema registra el cambio
    And actualiza los ejercicios asociados a la nueva fase
#US41: Configuración de umbrales de alerta personalizados
  Scenario 1: Configuración de umbral de dolor personalizado
    Given que el fisioterapeuta accede a la configuración clínica de un paciente
    When establece un nuevo nivel de dolor para generar alertas
    Then el sistema guarda la configuración personalizada
    And la utiliza para futuras notificaciones
  Scenario 2: Configuración de umbral de inactividad
    Given que el fisioterapeuta desea monitorear la inactividad de un paciente
    When configura un límite personalizado de días sin actividad
    Then el sistema registra la configuración
    And genera alertas cuando se supera dicho límite
#US43: Dashboard de métricas clínicas del panel profesional
  Scenario 1: Carga correcta del dashboard de métricas
    Given que el fisioterapeuta accede al panel principal
    When el sistema carga el dashboard
    Then muestra indicadores de pacientes activos, alertas pendientes y adherencia
    And permite acceder al detalle de cada indicador
  Scenario 2: Actualización del dashboard
    Given que existen nuevas actividades registradas por los pacientes
    When el sistema procesa la información
    Then actualiza las métricas mostradas en el dashboard
    And refleja los cambios más recientes
#US44: Gestión de plantillas de rutina
  Scenario 1: Creación exitosa de plantilla de rutina
    Given que el fisioterapeuta accede a la sección "Mis plantillas"
    When crea una nueva plantilla y presiona "Guardar plantilla"
    Then el sistema registra la plantilla con un nombre identificador
    And la deja disponible para futuras asignaciones
  Scenario 2: Aplicación de plantilla a un paciente
    Given que existe una plantilla compatible con el tratamiento del paciente
    When el fisioterapeuta selecciona "Aplicar plantilla"
    Then el sistema carga los ejercicios definidos en la plantilla
    And permite realizar ajustes antes de confirmar el plan
