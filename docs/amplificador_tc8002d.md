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
