# FPGBC_sonido
Módulo de Sonido para la FPGBC (Game Boy Color)
Asignatura: Electrónica Digital II - Universidad Nacional de Colombia (2026-2)

## Integrantes
- Cristian Camilo Niño Gutierrez
- Edyson Fabian Vargas camargo
- Ana Gabriela Caicedo Cangrejo

## 📋 Tabla de Contenidos
1. [Descripción General](#1-descripción-general)
2. [Arquitectura y Diagrama de Bloques](#2-arquitectura-y-diagrama-de-bloques)
3. [Ingeniería Inversa: Subsistema de Audio (APU)](#3-ingeniería-inversa-subsistema-de-audio-apu)
4. [Análisis del Esquemático y Conexiones Físicas](#4-análisis-del-esquemático-y-conexiones-físicas)
5. [Estructura del Repositorio](#5-estructura-del-repositorio)

---

## 1. Descripción General
Este repositorio contiene el diseño, la documentación teórica y la implementación en hardware del subsistema de sonido (APU) para el proyecto FPGBC. El módulo se encarga de sintetizar digitalmente los canales de audio de la Game Boy Color y gestionar la interfaz de conversión y amplificación hacia el hardware físico.

---

## 2. Arquitectura y Diagrama de Bloques 
<img width="1202" height="1001" alt="b5aa53dc-4c1e-4104-bc7b-0b5720a0a706" src="https://github.com/user-attachments/assets/64b72848-0c45-4774-9e23-929fea74eb06" />

---

## 3. Ingeniería Inversa: Subsistema de Audio (APU)
A partir del análisis del hardware original de la Game Boy Color y las especificaciones técnicas de la APU, se identificaron los 4 canales independientes de síntesis de sonido:
* **Canal 1 (Onda Cuadrada con Sweep):** Genera tonos cuadrados con control de barrido de frecuencia (*sweep*) y envolvente de volumen (*envelope*).
* **Canal 2 (Onda Cuadrada simple):** Genera tonos cuadrados con ciclo de trabajo configurable y envolvente, sin barrido de frecuencia.
* **Canal 3 (Tabla de Ondas):** Reproduce patrones de onda personalizados de 32 muestras almacenados en la RAM interna de onda (*Wave RAM*).
* **Canal 4 (Ruido Blanco):** Genera efectos de percusión y ruido mediante un registro de desplazamiento con retroalimentación lineal (LFSR).

---

## 4. Análisis del Esquemático y Conexiones Físicas
Durante el proceso de diseño esquemático y circuitería, se determinó la integración con la etapa de salida analógica:
* **Modulación PWM:** La señal digital combinada de los canales se procesa mediante un modulador por ancho de pulso desde la FPGA.
* **Amplificador de Audio (TC8002D):** La señal filtrada se acopla a la entrada del circuito integrado amplificador de audio mono Clase AB (TC8002D), diseñado para proporcionar potencia de salida eficiente hacia el altavoz físico de la consola.
* **Mapa Teórico de Registros (Direcciones `0xFF10` - `0xFF3F`):**
  - `0xFF10 - 0xFF14`: Control de canales y frecuencias (Canal 1).
  - `0xFF16 - 0xFF19`: Parámetros del Canal 2.
  - `0xFF1A - 0xFF1E`: Configuración y Wave RAM del Canal 3.
  - `0xFF20 - 0xFF23`: Configuración del Canal 4 (Ruido).
  - `0xFF24 - 0xFF26`: Control de volumen maestro, selección de canales estéreo/mono y encendido general de la APU.

---

## 5. Estructura del Repositorio
- `rtl/`: Archivos de descripción de hardware en Verilog correspondientes a la lógica digital de la APU.
- `documentos/`: Hojas de datos (datasheets del amplificador TC8002D), notas teóricas y documentación de ingeniería inversa.
- `sim/`: Archivos de simulación y testbenches para la verificación de los canales de audio.
