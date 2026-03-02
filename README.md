# RME Comunidad (MVP inicial)

Base de desarrollo para una app móvil estilo red social cristiana/juvenil.

## Estado actual
Se implementó una primera versión visual del MVP con Flutter:
- Flujo inicial de registro (nombre, club, ciudad).
- Home con navegación inferior a:
  - Feed
  - Radio
  - Noticias
  - Perfil
- Botón de subida en Feed (placeholder).
- Tema claro/oscuro con Material 3.

## Estructura
- `lib/main.dart`: punto de entrada.
- `lib/app.dart`: app root, flujo registro y navegación principal.
- `lib/features/auth/`: registro inicial.
- `lib/features/feed/`: feed visual con historias/publicaciones demo.
- `lib/features/radio/`: módulo radio (MVP visual).
- `lib/features/news/`: listado de noticias con detalle modal.
- `lib/features/profile/`: perfil y opciones de seguridad/ahorro.
- `lib/core/theme/`: tema global.

## Abrir en Android Studio (paso a paso)
1. Instala Flutter SDK y Android Studio.
2. En Android Studio, instala los plugins **Flutter** y **Dart**.
3. Abre el proyecto (`File > Open`) en esta carpeta raíz.
4. Si todavía no existe la carpeta `android/`, ejecútalo una sola vez:
   ```bash
   flutter create .
   ```
5. Descarga dependencias:
   ```bash
   flutter pub get
   ```
6. Verifica dispositivos disponibles:
   ```bash
   flutter devices
   ```
7. Ejecuta el MVP en emulador o teléfono:
   ```bash
   flutter run
   ```

## Generar APK para probar avance
> Comando recomendado para build de pruebas (APK release):

```bash
flutter build apk --release
```

APK generado en:
`build/app/outputs/flutter-apk/app-release.apk`

Opcional (más liviano por arquitectura):
```bash
flutter build apk --split-per-abi
```

Esto genera varios APK en la misma carpeta (`app-armeabi-v7a-release.apk`, `app-arm64-v8a-release.apk`, etc.).

## Próximos pasos
1. Integrar Firebase Auth (correo, Google, teléfono).
2. Conectar Firestore para posts/noticias/comentarios.
3. Integrar Firebase Storage para multimedia.
4. Integrar streaming real para radio (Icecast/URL mp3/aac).
5. Notificaciones push (FCM) y moderación básica.
6. Soporte offline con caché local.
