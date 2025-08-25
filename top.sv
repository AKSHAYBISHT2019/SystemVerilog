module top (
    input  logic clk,
    input  logic rst_n,
    output logic clk_a,
    output logic clk_b
);
    async_clock_gen #(
        .DIV_A(3),
        .DIV_B(5)
    ) u_gen (
        .clk_in (clk),
        .rst_n  (rst_n),
        .clk_a  (clk_a),
        .clk_b  (clk_b)
    );
endmodule
