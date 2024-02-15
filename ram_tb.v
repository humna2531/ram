module ram_tb ();
   reg       clk;
   reg       enb;
   reg       wr;
   reg  [1:0] addr;
   reg  [71:0] data;
   wire [71:0] r_data;

   ram RAM (.*);

   always begin
    clk =1'b0;
    #5;
    clk =1'b1;
    #5;
   end
   

   initial begin
      addr = 2'b00;
      data = 72'b00000000000000000000000000000000;
      enb = 1'b0;
      wr = 1'b0;
        #10; 
      // Write to memory
      enb = 1'b1;
      wr = 1'b1;
      addr = 2'b11;
      data = 72'b00000000000000000000000000000000;
      
      #10;
      enb = 1'b1;
      wr = 1'b0;
      addr = 2'b11;
      #10;
      #20;
     $finish();
   end
  
     
    initial begin
      $dumpfile("ram.vcd");
      $dumpvars(0,ram_tb);
    end
endmodule
