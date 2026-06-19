Feature: Alertas por dolor, reportes de síntomas y seguimiento clínico reactivo
#US11: Reporte de dolor o molestia
  Scenario 1: Registro exitoso de reporte de dolor
    Given que el deportista se encuentra en una sesión activa
    When selecciona "Reportar molestia" e indica el nivel de dolor y la zona afectada
    Then el sistema registra el reporte con la fecha, hora y descripción correspondiente
    And notifica automáticamente al fisioterapeuta asignado
  Scenario 2: Reporte de dolor crítico
    Given que el deportista reporta un nivel de dolor igual o mayor al umbral crítico establecido
    When confirma el reporte
    Then el sistema muestra una advertencia recomendando detener la actividad
    And genera una alerta para el fisioterapeuta responsable
#US24: Acceso al historial de reportes de dolor
  Scenario 1: Visualización del historial de reportes
    Given que el deportista accede a la sección "Historial de síntomas"
    When el sistema carga los reportes registrados
    Then muestra una lista cronológica con fecha, zona afectada, nivel de dolor y observaciones
    And permite filtrar la información por fecha o zona corporal
  Scenario 2: Historial sin registros previos
    Given que el deportista no ha registrado síntomas anteriormente
    When accede a la sección "Historial de síntomas"
    Then el sistema muestra el mensaje "Aún no tienes reportes registrados"
    And ofrece la opción de crear un nuevo reporte
#US31: Revisión de reportes de dolor del paciente
  Scenario 1: Visualización de reportes de dolor
    Given que el fisioterapeuta accede al perfil de un paciente
    When consulta la sección de reportes clínicos
    Then el sistema muestra los reportes registrados con fecha, nivel de dolor, zona afectada y descripción
    And destaca aquellos reportes considerados de alta prioridad
  Scenario 2: Gestión de un reporte de dolor crítico
    Given que el fisioterapeuta recibe una alerta de dolor crítico
    When revisa el reporte y registra una acción clínica
    Then el sistema guarda la decisión tomada
    And notifica al paciente sobre las indicaciones correspondientes
#US35: Visualización de alertas de riesgo del paciente
  Scenario 1: Recepción de alerta por dolor crítico
    Given que un paciente registra un nivel de dolor considerado crítico
    When el sistema procesa el reporte
    Then el fisioterapeuta recibe una notificación prioritaria
    And la alerta aparece destacada en su panel principal
  Scenario 2: Alerta por inactividad del paciente
    Given que un paciente no registra actividad durante el período definido
    When el sistema detecta la inactividad
    Then genera una alerta para el fisioterapeuta
    And sugiere acciones de seguimiento para contactar al paciente
