\m4_TLV_version 1d: tl-x.org
\SV
   `include "sqrt32.v";
   
   m4_makerchip_module
\TLV
   
   // Stimulus
   |calc
      @0
         $valid = & $rand_valid[1:0];  // Valid with 1/4 probability
                                       // (& over two random bits).
   
   // DUT (Design Under Test)
   |calc
      // [+] ?$valid
      @1                                  // [>>>]
         $aa_sq[7:0] = $aa[3:0] ** 2;     // [>>>]
         $bb_sq[7:0] = $bb[3:0] ** 2;     // [>>>]
      @2                                  // [>>>]
         $cc_sq[8:0] = $aa_sq + $bb_sq;   // [>>>]
      @3                                  // [>>>]
         $cc[4:0] = sqrt($cc_sq);         // [>>>]


   // Print
   |calc
      @3
         \SV_plus
            always_ff @(posedge clk) begin
               // [+] if ($valid)
                  \$display("sqrt((\%2d ^ 2) + (\%2d ^ 2)) = \%2d", $aa, $bb, $cc);
            end

\SV
   endmodule


