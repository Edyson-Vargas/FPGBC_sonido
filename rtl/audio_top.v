module audio_top (
    input  wire       clk,
    input  wire       rst,
    output wire       audio_out
);
    // Módulo base para el subsistema de sonido
    assign audio_out = 1'b0;

endmodule
