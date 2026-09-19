// tb.v
// Starter testbench template -- YOU complete this file.

module tb;

  // TODO: declare the inputs and outputs
  reg [3:0] a,b;
  reg op;
  wire [3:0] result;
  integer x,y,p;
  integer fail;
  reg  [3:0] expected;
  // TODO: instantiate DUT here
  alu DUT(
    .a(a),
    .b(b),
    .op(op),
    .result(result)
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
    a = 0; b = 0; op = 0;
    fail = 0;
    for(x = 0; x < 16; x = x+1) begin
        a = x;
        for(y = 0; y < 16; y = y+1) begin
          b = y;
          for(p = 0; p < 2; p = p+1) begin
           op = p;
          $display("a = %b, b = %b, op = %b", a,b,op);
          #1 // waiting is very important
          if(p == 0) begin
            expected = a+b;
            if(result == expected)
            $display("Pass");
            else begin
            $display("Fail Expected = %b, found = %b", expected,result);
            fail = fail + 1;
            end
          end
          else begin
            expected = a-b;
            if(result == expected)
            $display("Pass");
            else begin
            $display("Fail Expected = %b, found = %b", expected,result);
            fail = fail + 1;
            end
          end
        end
        #4;
      end
    end
    $display("Fail count = %d", fail);
    $finish;
  end

  // initial
  //   $monitor($time, " A=%b B=%b | LT=%b GT=%b EQ=%b",A,B,lt,gt,eq); // change as required

endmodule
