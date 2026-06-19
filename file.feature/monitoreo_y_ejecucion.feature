Feature: Monitoreo de ejercicios mediante cámara, retroalimentación, videos y wearables
#US06: Monitoreo de ejercicios mediante cámara
  Scenario 1: Monitoreo en tiempo real activado
    Given que el deportista inicia un ejercicio y concede permisos de cámara
    When el sistema activa el monitoreo mediante IA
    Then captura los movimientos en tiempo real
    And compara la postura del deportista con el modelo de referencia del ejercicio
    And muestra indicadores visuales de corrección sobre la imagen
  Scenario 2: Detección de postura incorrecta
    Given que el deportista ejecuta un ejercicio con postura inadecuada
    When el sistema detecta la desviación respecto al modelo
    Then emite una alerta visual y sonora indicando la corrección necesaria
    And muestra el mensaje específico del error detectado (por ejemplo, "Mantén la espalda recta")
#US07: Retroalimentación inmediata durante ejercicio
  Scenario 1: Retroalimentación correcta positiva
    Given que el deportista ejecuta correctamente el ejercicio según el modelo de referencia
    When el sistema analiza los movimientos en tiempo real
    Then muestra un indicador verde con el mensaje "Excelente postura"
    And contabiliza la repetición como válida en el contador de la pantalla
  Scenario 2: Retroalimentación con corrección específica
    Given que el deportista ejecuta un movimiento con error en el ángulo articular
    When el sistema detecta la desviación mayor al umbral configurado
    Then muestra una alerta en pantalla con la corrección específica
    And la repetición no se contabiliza hasta que se ejecute correctamente
#US08: Registro de sesión completada
    Scenario 1: Registro automático de sesión completada
    Given que el deportista completa todos los ejercicios de la sesión del día
    When presiona "Finalizar sesión"
    Then el sistema registra automáticamente la fecha, duración, ejercicios completados y porcentaje de correctitud
    And muestra un resumen de la sesión con el mensaje "¡Sesión completada!"
    Scenario 2: Registro parcial de sesión interrumpida
    Given que el deportista completa solo algunos ejercicios y cierra la aplicación
    When vuelve a ingresar
    Then el sistema muestra el progreso parcial de la sesión del día
    And permite continuar desde donde lo dejó
    US12: Visualización de video tutorial de ejercicio
  Scenario 1: Reproducción de video tutorial exitosa
    Given que el deportista selecciona un ejercicio de su rutina diaria
    When presiona "Ver tutorial"
    Then el sistema reproduce un video demostrativo con la técnica correcta del ejercicio
    And muestra controles de pausa, reproducción y velocidad
  Scenario 2: Video tutorial no disponible por falta de conexión
    Given que el deportista no tiene conexión a internet
    When intenta reproducir el tutorial del ejercicio
    Then el sistema muestra el mensaje "Video no disponible sin conexión"
    And ofrece la descripción textual e imágenes del ejercicio como alternativa
#US19: Visualización de métricas de rendimiento físico
  Scenario 1: Visualización de métricas en tiempo real durante ejercicio
    Given que el deportista inicia una sesión con monitoreo por cámara activo
    When ejecuta el ejercicio
    Then el sistema muestra en pantalla el ángulo articular actual, repeticiones válidas contabilizadas y una barra de progreso de la sesión en tiempo real
  Scenario 2: Reporte de métricas históricas de rendimiento
    Given que el deportista accede a la sección "Mis métricas"
    When el sistema procesa el historial de sesiones
    Then muestra gráficas de evolución de repeticiones correctas y ángulo articular por semana
    And permite filtrar por ejercicio específico o rango de fechas
#US51: Evidencia fotográfica de ejercicio realizado
  Scenario 1: Carga de fotografía de evidencia exitosa
    Given que el deportista acaba de completar un ejercicio de su rutina diaria
    And el sistema muestra la opción "Subir evidencia" al finalizar la actividad
    When el deportista toma o selecciona una fotografía desde su galería y presiona "Confirmar"
    Then el sistema carga la imagen y la asocia al ejercicio completado con fecha y hora
    And notifica al fisioterapeuta asignado que hay nueva evidencia disponible para revisión
  Scenario 2: Intento de carga sin fotografía adjunta
    Given que el deportista intenta confirmar el ejercicio sin adjuntar ninguna fotografía
    When presiona "Confirmar" sin haber seleccionado imagen
    Then el sistema muestra el mensaje "Debes adjuntar una fotografía para registrar este ejercicio"
    And no registra el ejercicio como completado hasta que se adjunte la evidencia
#US52: Vinculación de dispositivo wearable
  Scenario 1: Vinculación exitosa de dispositivo wearable
    Given que el deportista accede a la sección "Dispositivos" dentro de la configuración de la app
    And el sistema detecta dispositivos wearable compatibles disponibles mediante Bluetooth
    When el deportista selecciona su dispositivo y confirma la vinculación
    Then el sistema establece la conexión y muestra el mensaje "Dispositivo vinculado correctamente"
    And a partir de ese momento sincroniza automáticamente las métricas del dispositivo durante cada sesión
  Scenario 2: Fallo de vinculación por dispositivo no compatible
    Given que el deportista intenta vincular un dispositivo no compatible con la plataforma
    When el sistema intenta establecer la conexión
    Then muestra el mensaje "Este dispositivo no es compatible con SportRecover"
    And sugiere una lista de dispositivos compatibles para referencia del usuario
