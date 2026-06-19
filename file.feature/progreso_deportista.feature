Feature: Seguimiento del progreso, historial, métricas y gamificación del deportista
#US09: Visualización del calendario de progreso
  Scenario 1: Visualización correcta del calendario de sesiones
    Given que el deportista accede a la sección "Mi progreso"
    When el sistema carga el historial de sesiones
    Then muestra un calendario mensual donde cada día completado aparece marcado con color verde
    And los días sin sesión se muestran en gris
    And al seleccionar un día, muestra el detalle de los ejercicios realizados
  Scenario 2: Visualización de estadísticas de adherencia
    Given que el deportista accede al calendario de progreso
    When el sistema calcula la adherencia semanal
    Then muestra el porcentaje de sesiones completadas en la semana actual
    And muestra una comparativa con la semana anterior
#US10: Recepción de alertas de recordatorio
  Scenario 1: Envío de notificación de recordatorio en horario configurado
    Given que el deportista ha configurado un horario de recordatorio
    When llega la hora programada y el deportista no ha iniciado la sesión del día
    Then el sistema envía una notificación push con el mensaje "¡Es hora de tu sesión de rehabilitación!"
    And al tocar la notificación redirige directamente a la rutina del día
  Scenario 2: Supresión de recordatorio en día de descanso
    Given que el día actual está marcado como día de descanso en el plan
    When llega el horario configurado de recordatorio
    Then el sistema no envía la notificación de ejercicio
    And puede enviar un mensaje motivacional alternativo
#US13: Seguimiento de progreso físico semanal
  Scenario 1: Visualización del resumen semanal
    Given que el deportista accede a la sección "Progreso semanal"
    When el sistema calcula las métricas de la semana actual
    Then muestra sesiones completadas, porcentaje de ejercicios correctos, tiempo total entrenado y comparativa con la semana anterior
    And presenta los datos en gráficos visuales intuitivos
  Scenario 2: Alerta de baja adherencia semanal
    Given que el deportista ha completado menos del 50% de las sesiones de la semana
    When el sistema evalúa la adherencia al finalizar la semana
    Then muestra una notificación motivacional indicando el porcentaje alcanzado
    And sugiere estrategias para mejorar la constancia la siguiente semana
#US18: Evaluación de nivel de esfuerzo post-sesión
  Scenario 1: Registro de nivel de esfuerzo post-sesión
    Given que el deportista finaliza una sesión de ejercicios
    When el sistema muestra la pantalla de evaluación post-sesión
    Then el deportista puede seleccionar su nivel de esfuerzo en una escala de 1 a 5
    And el sistema registra la calificación y la considera en el ajuste adaptativo de la siguiente sesión
  Scenario 2: Ajuste automático de dificultad por esfuerzo bajo repetido
    Given que el deportista ha calificado el esfuerzo como 1 o 2 durante tres sesiones consecutivas
    When el sistema procesa los datos de adherencia y esfuerzo
    Then notifica al fisioterapeuta sugiriendo un incremento progresivo de la dificultad
    And muestra al deportista un mensaje motivacional de avance
#US20: Acceso a consejos de recuperación
  Scenario 1: Visualización de consejos personalizados
    Given que el deportista accede a la sección "Consejos de recuperación"
    When el sistema carga el contenido según el tipo de lesión registrada
    Then muestra artículos y recomendaciones personalizadas sobre hidratación, descanso, alimentación y manejo del dolor
    And el contenido está clasificado por categorías navegables
  Scenario 2: Consejo diario en el dashboard
    Given que el deportista ingresa al dashboard principal
    When el sistema carga la pantalla de inicio
    Then muestra un consejo de recuperación diferente cada día en un banner destacado
    And ofrece la opción de guardar el consejo en favoritos
#US25: Motivación mediante logros y recompensas
  Scenario 1: Otorgamiento de logro al completar hito
    Given que el deportista completa 7 sesiones consecutivas sin fallar
    When el sistema detecta el hito alcanzado
    Then muestra una animación de celebración con el logro "¡Racha de 7 días!"
    And agrega el logro al perfil del deportista con la fecha obtenida
  Scenario 2: Visualización de galería de logros obtenidos
    Given que el deportista accede a la sección "Mis logros"
    When el sistema carga la galería
    Then muestra todos los logros obtenidos con fecha y descripción
    And los logros pendientes aparecen bloqueados con los criterios para desbloquearlos
