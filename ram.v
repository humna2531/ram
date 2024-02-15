module ram (
    input wire        clk,
    input wire [1:0]  addr,
    input wire [71:0] data,
    input wire        enb,
    input wire        wr,
    output reg [71:0] r_data   
); 
    reg [4:0] mem [71:0];

    always @ (posedge clk) begin
        if (enb) begin
            if (wr) begin
                mem [addr]= data ;
            end
            else begin
                r_data <= mem[addr];
            end
        end
    end 
endmodule
