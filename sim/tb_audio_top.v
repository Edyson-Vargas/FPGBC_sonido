`timescale 1ns / 1ps

module tb_audio_top();

    // Señales de prueba
    reg clk;
    reg rst;
    wire audio_out;

    // Instancia del módulo principal de sonido
    audio_top uut (
        .clk(clk),
        .rst(rst),
        .audio_out(audio_out)
    );

    // Generador de reloj (ejemplo a 50 MHz -> periodo de 20ns)
    always #10 clk = ~clk;

    initial begin
        // Configuración inicial
        clk = 0;
        rst = 1;
        #100;
        rst = 0;
        
        // Tiempo de ejecución de la simulación
        #2000;
        $finish;
    end

endmodule
