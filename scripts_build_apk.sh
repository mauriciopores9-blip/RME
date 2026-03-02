#!/usr/bin/env bash
set -euo pipefail

if ! command -v flutter >/dev/null 2>&1; then
  echo "Error: Flutter no está instalado o no está en PATH." >&2
  exit 1
fi

if [[ ! -d android ]]; then
  echo "No existe carpeta android/. Ejecutando flutter create ."
  flutter create .
fi

flutter pub get
flutter build apk --release

echo "APK generado en: build/app/outputs/flutter-apk/app-release.apk"
