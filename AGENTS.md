# AGENTS.md

App Flutter de práctica de la sesión 11 del Seminario: una lista de tracks
guardada en la tabla `tracks` de Supabase.

## Estructura

- `lib/main.dart`: `MaterialApp` con la tabla de rutas nombradas.
- `lib/models/track.dart`: el modelo `Track`, con `fromMap`, `toMap` y `copyWith`.
- `lib/components/`: widgets reutilizables.
- `lib/screens/`: pantallas con `Scaffold` (`HomeScreen`, `AddTrackScreen`,
  `TrackDetailScreen`).
- `lib/services/track_services.dart`: `TrackService`, la única clase que habla
  con Supabase.

## La tabla tracks

- `id` uuid, llave primaria, la genera la base de datos.
- `name` text, obligatorio.
- `artist_name` text, obligatorio.
- `image_url` text, por defecto `https://picsum.photos/400`.

## Reglas

- Solo `TrackService` llama a Supabase. Las pantallas llaman a `TrackService`.
- Cada método de `TrackService` devuelve un `Future` y se usa con `await`.
- Sin paginación, sin filtros y sin manejo de estado con paquetes: solo `setState`.
- Código en inglés; textos de la interfaz en español.
- Imports del proyecto con `package:track_app/`, nunca relativos.
- Sin comentarios en el código, salvo una línea `///` por clase pública.
- `Function()` y `Function(Tipo)` en vez de `VoidCallback` y `ValueChanged`.
