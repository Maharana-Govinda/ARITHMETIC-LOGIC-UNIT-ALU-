// alu.v - 4-bit ALU with 5 operations
module ALU (
    input [3:0] A, B,
    input [2:0] Sel,
    output reg [3:0] Y,
    output reg Zero
);

always @(*) begin
    case (Sel)
        3'b000: Y = A + B;      // ADD
        3'b001: Y = A - B;      // SUB
        3'b010: Y = A & B;      // AND
        3'b011: Y = A | B;      // OR
        3'b100: Y = ~A;         // NOT A (ignores B)
        default: Y = 4'b0000;   // default/fault case
    endcase

    Zero = (Y == 4'b0000);      // Set Zero flag if output is 0
end

endmodule
