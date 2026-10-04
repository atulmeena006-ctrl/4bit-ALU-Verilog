module alu_4bit (
    input  [3:0] A,
    input  [3:0] B,
    input  [2:0] ALU_Sel,
    output reg [3:0] Result,
    output reg       Carry
);

always @(*) begin
    Result = 4'b0000;
    Carry  = 1'b0;

    case (ALU_Sel)
        3'b000: begin
            {Carry, Result} = A + B;
        end
        3'b001: begin
            {Carry, Result} = A - B;
        end
        3'b010: begin
            Result = A & B;
        end
        3'b011: begin
            Result = A | B;
        end
        3'b100: begin
            Result = A ^ B;
        end
        3'b101: begin
            Result = ~A;
        end
        3'b110: begin
            Result = A << 1;
        end
        3'b111: begin
            Result = A >> 1;
        end
        default: begin
            Result = 4'b0000;
            Carry  = 1'b0;
        end
    endcase
end

endmodule
