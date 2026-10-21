# Documentación del Amplificador de Audio (TC8002D) – FPGBC

* **Amplificador:** TC8002D (Amplificador de potencia de audio mono de 3W, Clase AB)
* **Voltaje de Operación:** 2.0V ~ 5.5V
* **Entrada:** Señal de audio proveniente del pin PWM de la FPGA (con red de filtrado).
* **Salida:** Conexión directa al altavoz/parlante de la consola.

## Documentos de referencia
| Documento | Descripción | Enlace |
| :--- | :--- | :--- |
| **Hoja de datos TC8002D** | Pinout, ganancias externas, modo de apagado (*shutdown*) y curvas de distorsión | [PDF](https://www.alldatasheet.com/html-pdf/1147207/FUMAN/TC8002D/174/1/TC8002D.html) |

## Esquematico TC8002D
<img width="624" height="455" alt="image" src="https://github.com/user-attachments/assets/b3676836-b2c5-4d30-a130-49cc913eed2b" />

## Conexiones y Pines Involucrados
| Pin del TC8002D | Nombre / Función | Conectado a / Descripción |
| :--- | :--- | :--- |
| Pin 1 | **SD (Shutdown)** | Control de apagado para ahorro de energía (puede ir a GND o a un pin de control de la FPGA) |
| Pin 2 | **BYPASS** | Condensador de desacoplo para el reference voltage interno |
| Pin 3 | **IN +** | Entrada de audio positiva (recibe la señal filtrada desde la FPGA) |
| Pin 4 | **IN -** | Entrada de audio negativa (comúnmente a tierra a través de capacitor) |
| Pin 5 | **VO1** | Salida diferencial hacia el parlante (+) |
| Pin 6 | **VDD** | Alimentación (3.3V o 5V) |
| Pin 7 | **GND** | Tierra |
| Pin 8 | **VO2** | Salida diferencial hacia el parlante (-) |

Descripción Funcional y Estrategia de Integración con la FPGA

A diferencia de los componentes puramente digitales del SoC (como los registros de la APU o el procesador `femtoRV32`), la etapa de salida hacia el altavoz involucra una transición de señales digitales a analógicas.

### Naturaleza del Circuito Integrado
El **TC8002D** es un amplificador de audio mono de **Clase AB** diseñado para dispositivos portátiles. Es importante resaltar que **este circuito integrado no es un dispositivo programable digitalmente**; no posee registros internos ni protocolos de comunicación (como I2C/SPI), sino que opera de manera estrictamente analógica para amplificar la potencia hacia el altavoz.

### Modulación por Ancho de Pulsos (PWM) y Filtrado
Dado que la FPGA opera con lógica digital (0V y 3.3V) y carece de un Conversor Digital-Analógico (DAC) nativo, la síntesis de audio se ejecuta mediante **PWM**:
1. **Mezclador APU:** La lógica digital combina los canales de la FPGBC.
2. **Generador PWM:** Un contador interno modula el ciclo de trabajo (*duty cycle*) en función de la muestra de audio.
3. **Filtro RC:** La señal digital rápida pasa por una red de resistencias y condensadores que la convierte en una onda de voltaje analógica continua.

### Control Lógico del Pin de *Shutdown* (Pin 1)
Aunque el amplificador es analógico, cuenta con el pin digital **SD (Shutdown)**:
* **Control desde la FPGA:** Este pin se vincula a un bit de control dentro de los registros gestionados por la APU en el SoC LiteX.
* **Operación:** Si el firmware escribe un `0`, el amplificador se desactiva (`SD = LOW`) para ahorrar energía y evitar chasquidos al encender/apagar; al escribir un `1`, se habilita (`SD = HIGH`) para reproducir el audio con normalidad.
