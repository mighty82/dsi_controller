`ifndef SYNC_2FF
`define SYNC_2FF

module sync_2ff #(
    parameter WIDTH     = 1
    )(
    input   wire clk_out                ,    // Clock

    input   wire [WIDTH-1:0] data_in    ,
    output  wire [WIDTH-1:0] data_out

);

reg [WIDTH-1:0] sync_reg_1;
reg [WIDTH-1:0] sync_reg_2;

genvar i;
generate
    for (i = 0; i < WIDTH; i = i + 1) begin :bits
        always @(posedge clk_out)
        begin
            sync_reg_1[i] <= data_in[i];
            sync_reg_2[i] <= sync_reg_1[i];
        end
    end
endgenerate

assign data_out = sync_reg_2;

endmodule

`endif