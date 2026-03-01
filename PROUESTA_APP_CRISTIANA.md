# Propuesta técnica – App móvil tipo Instagram para comunidad cristiana/juvenil

## 1) Objetivo del producto
Crear una red social visual segura y positiva para jóvenes, clubes y comunidades cristianas (ej. Conquistadores), con tres pilares:
- Feed social (fotos, videos cortos, historias).
- Radio en vivo integrada.
- Noticias oficiales del club/iglesia.

## 2) Stack recomendado (moderno y ligero)
- **Frontend:** Flutter (recomendado por rendimiento y única base iOS/Android).
- **Backend BaaS:** Firebase.
- **Base de datos:** Cloud Firestore.
- **Auth:** Firebase Authentication (correo, Google, teléfono).
- **Multimedia:** Firebase Storage (JPG/PNG/MP4).
- **Push:** Firebase Cloud Messaging (FCM).
- **Streaming radio:** URL Icecast/SHOUTcast (AAC/MP3) consumida desde app.
- **Analítica/errores:** Firebase Analytics + Crashlytics.

> Alternativa válida: React Native + Expo si el equipo domina JavaScript/TypeScript.

## 3) Arquitectura sugerida
### Frontend (Flutter)
Arquitectura por capas + manejo de estado simple y escalable:
- `presentation/` (pantallas, widgets)
- `application/` (casos de uso, providers)
- `domain/` (entidades y contratos)
- `data/` (repositorios, Firebase, caché local)

**Librerías sugeridas:**
- Estado: Riverpod.
- Navegación: go_router.
- Caché offline: Hive o Isar + cache de Firestore.
- Video: video_player.
- Audio streaming: just_audio.
- Notificaciones locales: flutter_local_notifications.

### Backend (Firebase)
- **Firestore:** usuarios, posts, comentarios, likes, historias, noticias, programas de radio, reportes, eventos.
- **Storage:** media de publicaciones e historias.
- **Cloud Functions:** moderación automática, versículo del día, notificaciones programadas, contadores agregados.
- **Security Rules:** control por roles (Administrador, Editor Noticias, Usuario).

## 4) Módulos funcionales
### A. Registro y perfil
1. Onboarding.
2. Registro con correo/Google/teléfono.
3. Perfil inicial: foto, nombre, club, ciudad.
4. Redirección al feed.

### B. Feed tipo Instagram
- Scroll vertical de publicaciones.
- Like, comentar, compartir.
- Subida de foto/video (compresión previa).
- Historias 24h.
- Reacciones especiales: 🙏🔥✨.

### C. Radio en vivo 🎙
- Botón fijo en barra inferior.
- Mini reproductor al abrir:
  - Play / pausa
  - Título del programa
  - Estado: “En vivo”
  - Portada opcional
- Chat en vivo opcional (Firestore con moderación).
- Notificación push cuando inicia transmisión.
- Si la señal cae: mensaje amigable + reintento.

### D. Noticias 📰
- Tarjetas: imagen + título + resumen + fecha.
- Detalle completo al tocar.
- Filtros por categoría (club, iglesia, eventos, campamentos, comunicados).
- Publicación restringida a rol Editor Noticias/Admin.

## 5) Modelo de datos (Firestore)
Colecciones sugeridas:
- `users/{userId}`: nombre, foto, club, ciudad, rol, edad, parentalControl.
- `posts/{postId}`: authorId, mediaUrl, caption, likesCount, commentsCount, createdAt, visibility.
- `posts/{postId}/comments/{commentId}`: authorId, text, createdAt, status.
- `stories/{storyId}`: authorId, mediaUrl, expiresAt.
- `news/{newsId}`: title, summary, body, imageUrl, category, publishedBy, publishedAt.
- `radio/current`: streamUrl, programTitle, isLive, startedAt.
- `radioChat/{messageId}`: userId, message, createdAt, status.
- `reports/{reportId}`: reporterId, targetType, targetId, reason, status.
- `events/{eventId}`: title, place, startDate, endDate, clubId.
- `clubs/{clubId}`: name, city, followersCount.

## 6) Roles y permisos
- **Administrador:** gestiona usuarios, noticias, moderación, radio y configuraciones globales.
- **Editor Noticias:** crea/edita/publica noticias.
- **Usuario:** publica en feed, comenta, reacciona, reporta contenido.

Aplicar roles con custom claims de Firebase Auth + reglas Firestore/Storage.

## 7) Seguridad y moderación
- Filtro de lenguaje ofensivo (Cloud Functions + lista de términos).
- Sistema de reportes y revisión manual.
- Botón de emergencia para reportar contenido desde post/comentario/chat.
- Control parental opcional:
  - Limitar chat/comentarios.
  - Ocultar contenido sensible.
  - Horarios de uso.

## 8) Offline y resiliencia
- **Sin señal:** mostrar feed cacheado (últimos posts, últimas noticias).
- Cola de acciones offline (likes/comentarios) para sincronizar al reconectar.
- **Radio caída:** estado no disponible + botón “reintentar”.
- Placeholders ligeros y compresión de medios para datos móviles.

## 9) Optimización móvil
- Compresión automática de imágenes y videos antes de subir.
- Carga paginada (infinite scroll con cursores Firestore).
- Lazy loading de miniaturas.
- Modo ahorro de batería:
  - Menos refrescos en background.
  - Menor calidad de reproducción opcional en radio/video.

## 10) UI/UX
- Estética minimalista y juvenil.
- Colores vivos con buen contraste.
- Modo oscuro completo.
- Barra inferior sugerida:
  1. Inicio
  2. Buscar
  3. Subir
  4. **Radio**
  5. **Noticias**
  6. Perfil

## 11) Extras recomendados
- Versículo del día automático (Cloud Function programada).
- Contador de seguidores por club.
- Módulo de eventos y campamentos con recordatorios push.
- Insignias por participación positiva en comunidad.

## 12) Roadmap MVP (8–10 semanas)
### Fase 1 (Semanas 1–2)
- Auth + perfil + estructura base UI.

### Fase 2 (Semanas 3–4)
- Feed, likes, comentarios, subida de multimedia.

### Fase 3 (Semanas 5–6)
- Historias 24h + Noticias con roles.

### Fase 4 (Semanas 7–8)
- Radio en vivo + notificaciones + modo offline básico.

### Fase 5 (Semanas 9–10)
- Moderación, control parental opcional, optimización y lanzamiento beta.

## 13) KPIs iniciales
- Retención D1 / D7.
- Usuarios activos diarios (DAU).
- Tiempo medio en app.
- Reproducciones de radio por día.
- Tasa de reportes resueltos < 24h.

---

## Recomendación final
Para empezar rápido, con buen rendimiento y bajo costo operativo, usar **Flutter + Firebase** con arquitectura por capas y un **MVP** centrado en: Auth, Feed, Radio, Noticias y Moderación básica. Luego iterar con eventos, gamificación y herramientas de comunidad.
