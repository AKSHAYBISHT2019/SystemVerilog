module async_clock_gen #(
    parameter int DIV_A = 3,
    parameter int DIV_B = 5
) (
    input  logic clk_in,
    input  logic rst_n,
    output logic clk_a,
    output logic clk_b
);
    localparam int WIDTH_A = $clog2(DIV_A);
    localparam int WIDTH_B = $clog2(DIV_B);

    logic [WIDTH_A-1:0] cnt_a;
    logic [WIDTH_B-1:0] cnt_b;

    always_ff @(posedge clk_in or negedge rst_n) begin
        if (!rst_n) begin
            cnt_a <= '0;
            clk_a <= 1'b0;
        end else if (cnt_a == DIV_A - 1) begin
            cnt_a <= '0;
            clk_a <= ~clk_a;
        end else begin
            cnt_a <= cnt_a + 1'b1;
        end
    end

    always_ff @(posedge clk_in or negedge rst_n) begin
        if (!rst_n) begin
            cnt_b <= '0;
            clk_b <= 1'b0;
        end else if (cnt_b == DIV_B - 1) begin
            cnt_b <= '0;
            clk_b <= ~clk_b;
        end else begin
            cnt_b <= cnt_b + 1'b1;
        end
    end
endmodule
