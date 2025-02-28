\m5_TLV_version 1d: tl-x.org
\m5
   
   // =================================================
   // Welcome!  New to Makerchip? Try the "Learn" menu.
   // =================================================
   
   //use(m5-1.0)   /// uncomment to use M5 macro library.
\SV
   // Macro providing required top-level module definition, random
   // stimulus support, and Verilator config.
   m5_makerchip_module   // (Expanded in Nav-TLV pane.)
\TLV
   $reset = *reset;
   
   $out = ! $in1;
   
   $buffer = $in1;
   $and_gate = $in1 && $in2;
   $or_gate = $in1 || $in2;
   $xor_gate = $in1 ^ $in2;
   
   $inv_gate = ! $in1;
   $nand_gate = !($in1 && $in2);
   $nor_gate = !($in1 || $in2);
   $xnor_gate = !($in1 ^ $in2);
   
   // Assert these to end simulation (before Makerchip cycle limit).
   *passed = *cyc_cnt > 40;
   *failed = 1'b0;
\SV
   endmodule
