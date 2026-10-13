# Teoría de la APU (Audio Processing Unit) - Game Boy Color

## 1. Arquitectura General del Sonido
La APU de la Game Boy genera sonido de manera digital mediante 4 canales independientes sintetizados por hardware:

1. **Canal 1 (Pulse/Square Wave 1):** Genera ondas cuadradas con modulador de frecuencia (Sweep), temporizador de longitud y envolvente de volumen (Envelope).
2. **Canal 2 (Pulse/Square Wave 2):** Genera ondas cuadradas similar al Canal 1, pero sin el módulo de Sweep.
3. **Canal 3 (Wave Output):** Permite reproducir formas de onda arbitrarias/personalizadas de 32 muestras de 4 bits guardadas en la RAM de onda (*Wave RAM*).
4. **Canal 4 (Noise):** Genera ruido blanco o efectos de percusión usando un Registro de Desplazamiento con Retroalimentación Lineal (LFSR).

---

## 2. Mapa Teórico de Registros (Direcciones `0xFF10` - `0xFF3F`)

| Registro | Módulo | Función Teórica |
| :--- | :--- | :--- |
| `0xFF10 - 0xFF14` | Canal 1 | Control de Sweep, Duty Cycle, Envolvente y Frecuencia |
| `0xFF16 - 0xFF19` | Canal 2 | Duty Cycle, Envolvente y Frecuencia |
| `0xFF1A - 0xFF1E` | Canal 3 | Activación, Longitud, Nivel de salida y Frecuencia |
| `0xFF20 - 0xFF23` | Canal 4 | Longitud, Envolvente y Parámetros del LFSR (Ruido) |
| `0xFF24 - 0xFF26` | Control / Mezclador | Volumen Maestro, Selección Estéreo (L/R) y Encendido APU |
| `0xFF30 - 0xFF3F` | RAM Canal 3 | Tabla de muestras de onda personalizada (32 nibbles) |

---

## 3. Diagrama del Esquemático
