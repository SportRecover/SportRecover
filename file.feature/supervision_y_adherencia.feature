Feature: Supervisión del progreso y adherencia de pacientes por el fisioterapeuta
#US28: Supervisión remota del progreso del paciente
  Scenario 1: Visualización del perfil de progreso del paciente
    Given que el fisioterapeuta selecciona a un paciente del listado
    When accede al perfil detallado
    Then el sistema muestra las sesiones completadas, porcentaje de ejercicios correctos, métricas articulares, reportes de dolor y gráficas de evolución semanal
    Scenario 2: Comparativa de progreso entre semanas
    Given que el fisioterapeuta visualiza el perfil de un paciente
    When selecciona el rango de fechas de dos semanas distintas
    Then el sistema muestra una comparativa gráfica de las métricas clave entre ambas semanas
    And destaca las mejoras o retrocesos más significativos
#US36: Evaluación de adherencia global de pacientes
  Scenario 1: Dashboard de adherencia global
    Given que el fisioterapeuta accede al panel de control
    When el sistema carga el resumen general
    Then muestra un ranking de pacientes ordenado por nivel de adherencia
    And clasifica a los pacientes en tres categorías: alta adherencia (verde), media adherencia (amarillo) y baja adherencia (rojo)
  Scenario 2: Detalle de adherencia semanal por paciente
    Given que el fisioterapeuta selecciona a un paciente del ranking de adherencia
    When accede al detalle
    Then el sistema muestra el porcentaje de adherencia semana a semana en un gráfico de barras
    And destaca las semanas con mayor y menor cumplimiento
#US45: Notificación de hito de recuperación del paciente
  Scenario 1: Notificación de hito de recuperación recibida
    Given que un paciente completa la primera fase de su rehabilitación
    When el sistema valida el cumplimiento de todos los criterios de la fase
    Then el fisioterapeuta recibe una notificación indicando que el paciente ha completado la Fase 1
    And el sistema sugiere revisar y aprobar el avance a la fase siguiente
  Scenario 2: Revisión y aprobación del avance de fase
    Given que el fisioterapeuta recibe la notificación de hito completado
    When revisa las métricas del paciente y presiona "Aprobar avance de fase"
    Then el sistema actualiza la fase del paciente
    And notifica al deportista que ha avanzado a la siguiente fase con los nuevos ejercicios asignados
#US46: Acceso al historial de sesiones por paciente
  Scenario 1: Visualización del historial de sesiones
    Given que el fisioterapeuta accede al perfil de un paciente y selecciona "Historial de sesiones"
    When el sistema carga el historial
    Then muestra todas las sesiones registradas con fecha, duración, ejercicios completados, porcentaje de correctitud y nivel de esfuerzo reportado
    And permite filtrar por rango de fechas o fase de recuperación
  Scenario 2: Detalle de sesión individual
    Given que el fisioterapeuta selecciona una sesión específica del historial
    When accede al detalle
    Then el sistema muestra el desglose por ejercicio con métricas individuales, alertas generadas y comentarios registrados durante la sesión
