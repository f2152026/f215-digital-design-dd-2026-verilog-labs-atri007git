// tb.v
// Starter testbench template -- YOU complete this file.

module tb;

  // TODO: declare the inputs and outputs
  reg [1:0] A,B;
  wire lt,gt,eq;
  integer i,j;
  // TODO: instantiate DUT here
  comp2 DUT(
    .A(A),
    .B(B),
    .LT(lt),
    .GT(gt),
    .EQ(eq)
  );
  // Waveform dump configuration (DO NOT CHANGE)
  string vcd_file;
  initial begin
    if ($value$plusargs("vcd=%s", vcd_file)) begin
      $dumpfile(vcd_file);
      $dumpvars(0, DUT);
    end
  end

  initial begin
    // TODO: apply different input combinations
    A = 0; B = 0;
    for(i = 0; i < 4; i = i+1) begin
     for(j = 0; j < 4; j = j+1) begin
      
      A = i;
      B = j;
      // $display("A = %b, B = %b",A,B);
      // if(A > B)begin
      // if(gt == 1 && lt == 0 && eq == 0)
      // $display("Pass");
      // else
      // $display("Fail: Expected GT = 1, LT = 0, EQ = 0 found GT = %b, LT = %b, EQ = %b", gt,lt,eq);
      // end
      // else if(A < B) begin
      // if(gt == 0 && lt == 1 && eq == 0)
      // $display("Pass");
      // else
      // $display("Fail: Expected GT = 0, LT = 1, EQ = 0 found GT = %b, LT = %b, EQ = %b", gt,lt,eq);
      // end
      // else begin
      // if(gt == 0 && lt == 0 && eq == 1)
      // $display("Pass");
      // else
      // $display("Fail: Expected GT = 0, LT = 0, EQ = 1 found GT = %b, LT = %b, EQ = %b", gt,lt,eq);
      // end
      #5;

     end
    end
    
    $finish;
  end

  initial
    $monitor($time, " A=%b B=%b | LT=%b GT=%b EQ=%b",A,B,lt,gt,eq); // change as required

endmodule
