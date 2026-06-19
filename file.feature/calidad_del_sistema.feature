Feature: Requisitos no funcionales: seguridad, rendimiento, disponibilidad y compatibilidad
# US47: Seguridad y cifrado de datos del paciente
  Scenario: Escenario 1: Cifrado de datos en tránsito
    Given que el sistema transmite datos clínicos entre el servidor y la aplicación
    When el sistema procesa las solicitudes de datos del paciente
    Then todas las comunicaciones deben realizarse mediante protocolo HTTPS con cifrado TLS 1.2 o superior
    And ningún dato clínico debe transmitirse en texto plano
  Scenario: Escenario 2: Acceso denegado a datos de pacientes no asignados
    Given que un fisioterapeuta autenticado intenta acceder al perfil de un paciente no asignado a él
    When realiza la solicitud desde la aplicación
    Then el sistema devuelve un error 403 Forbidden
    And registra el intento de acceso no autorizado en el log de auditoría
# US48: Rendimiento y tiempo de respuesta de la aplicación
  Scenario: Escenario 1: Tiempo de respuesta dentro del límite aceptable
    Given que el deportista ejecuta cualquier acción dentro de la aplicación durante una sesión activa
    When el sistema procesa la solicitud
    Then la respuesta debe entregarse en menos de 2 segundos bajo condiciones normales de red
    And el monitoreo por cámara no debe superar 100 ms de latencia en la detección de movimiento
  Scenario: Escenario 2: Degradación controlada con conexión lenta
    Given que el deportista usa la aplicación con una conexión a internet lenta
    When el sistema detecta la latencia elevada
    Then reduce automáticamente la calidad del streaming de video sin interrumpir el monitoreo de ejercicios
    And muestra un indicador de calidad de conexión en la pantalla
# US49: Disponibilidad y tolerancia a fallos del sistema
  Scenario: Escenario 1: Sistema disponible durante ventana de servicio
    Given que el fisioterapeuta accede a la plataforma en cualquier momento del día
    When el sistema recibe la solicitud
    Then debe estar disponible con una disponibilidad mínima del 99.5% mensual
    And en caso de mantenimiento programado, el sistema notifica con al menos 24 horas de anticipación
  Scenario: Escenario 2: Recuperación automática ante fallo del servidor
    Given que ocurre un fallo en el servidor de la plataforma
    When el sistema de monitoreo detecta la caída
    Then el sistema debe recuperarse automáticamente en menos de 5 minutos
    And los datos no guardados durante el fallo son recuperados del último estado sincronizado
# US50: Compatibilidad multiplataforma de la aplicación
  Scenario: Escenario 1: Funcionamiento correcto en dispositivos Android
    Given que el deportista accede a la aplicación desde un dispositivo Android con versión 8.0 o superior
    When navega por las funcionalidades principales (rutina, monitoreo, chat y progreso)
    Then todas las funciones operan correctamente sin errores de compatibilidad
    And el monitoreo por cámara funciona en dispositivos con cámara trasera de al menos 8 MP
  Scenario: Escenario 2: Funcionamiento correcto en dispositivos iOS
    Given que el deportista accede a la aplicación desde un dispositivo iOS con versión 14 o superior
    When utiliza las funcionalidades de monitoreo y gestión de rutinas
    Then todas las funciones operan de forma equivalente a la versión Android
    And la interfaz se adapta correctamente a las distintas resoluciones de pantalla de dispositivos Apple
