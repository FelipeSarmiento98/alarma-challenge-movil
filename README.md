# Alarma Challenge Móvil

Una aplicación Flutter para gestionar alarmas en dispositivos. Permite crear, editar y eliminar alarmas, así como gestionar dispositivos conectados.

## Características

- Gestión de alarmas con hora, tono y repetición
- Lista de dispositivos conectados
- Interfaz de usuario moderna con gradientes y animaciones
- Aplicación nativa para Android (mínimo API 21 - Android 5.0)

## Requisitos Previos

- Flutter SDK versión 3.5.3 o superior
- Dart SDK incluido con Flutter
- Android Studio o VS Code con extensiones de Flutter
- Dispositivo Android con API 21+ o emulador para pruebas

## Instalación

1. Clona el repositorio:
   ```bash
   git clone <url-del-repositorio>
   cd alarma-challenge
   ```

2. Instala las dependencias:
   ```bash
   flutter pub get
   ```

3. Genera los íconos del launcher (opcional, ya incluidos):
   ```bash
   flutter pub run flutter_launcher_icons:main
   ```

## Ejecutar la Aplicación

### En Modo Debug
```bash
flutter run
```

### En un Dispositivo Específico
```bash
flutter devices  # Para ver dispositivos conectados
flutter run -d <device-id>
```

## Construir APK para Android

```bash
flutter build apk
```

El APK se generará en `build/app/outputs/flutter-apk/app-release.apk`

## Dependencias Principales

- `provider`: Para gestión de estado
- `google_fonts`: Fuentes personalizadas
- `flutter_time_picker_spinner`: Selector de tiempo personalizado
- `intl`: Internacionalización

## Estructura del Proyecto

```
lib/
├── main.dart
├── src/
│   ├── classes/
│   │   ├── alarm.dart
│   │   └── device.dart
│   ├── pages/
│   │   ├── login_page.dart
│   │   ├── main_page.dart
│   │   ├── devices_page.dart
│   │   └── create_alarm_page.dart
│   ├── providers/
│   │   ├── alarm_provider.dart
│   │   └── devices_provider.dart
│   ├── utils/
│   │   └── responsive_app.dart
│   └── widgets/
│       ├── general_widgets/
│       └── alarm_card.dart
assets/
├── images/
│   ├── logo.png
│   ├── background1.png
│   ├── background2.png
│   └── empty_state.png
```

## Configuración

La aplicación utiliza Provider para la gestión de estado. Los proveedores principales son:

- `AlarmProvider`: Gestiona las alarmas
- `DevicesProvider`: Gestiona los dispositivos conectados

## Notas

- Asegúrate de tener configurado un dispositivo Android con API 21+ o emulador antes de ejecutar
- Los íconos del launcher se generan automáticamente desde `assets/images/logo.png`

## Solución de Problemas

Si encuentras errores de compilación:

1. Limpia el proyecto:
   ```bash
   flutter clean
   flutter pub get
   ```

2. Si hay problemas con los íconos:
   ```bash
   flutter pub run flutter_launcher_icons:main
   ```

3. Para errores de Gradle en Android:
   ```bash
   cd android
   ./gradlew clean
   cd ..
   flutter build apk
   ```

## Contribución

1. Fork el proyecto
2. Crea una rama para tu feature (`git checkout -b feature/nueva-funcionalidad`)
3. Commit tus cambios (`git commit -am 'Agrega nueva funcionalidad'`)
4. Push a la rama (`git push origin feature/nueva-funcionalidad`)
5. Abre un Pull Request

## Licencia

Este proyecto es privado y no está disponible para distribución pública.
