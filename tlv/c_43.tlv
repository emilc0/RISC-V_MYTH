\m5_TLV_version 1d: tl-x.org
\m5
   
   // =================================================
   // Welcome!  New to Makerchip? Try the "Learn" menu.
   // =================================================
   
   //use(m5-1.0)   /// uncomment to use M5 macro library.
\SV
   m4_include_lib(['https://raw.githubusercontent.com/stevehoover/RISC-V_MYTH_Workshop/ecba3769fff373ef6b8f66b3347e8940c859792d/tlv_lib/calculator_shell_lib.tlv'])

   // Macro providing required top-level module definition, random
   // stimulus support, and Verilator config.
   m5_makerchip_module   // (Expanded in Nav-TLV pane.)
\TLV
   |calc
      @0
         $reset = *reset;
      @1
         $valid = $reset? '0 : >>1$valid + 1;
         $valid_or_reset = $valid || $reset;
      ?$valid_or_reset
         @1
            $val2[31:0] = $rand_val2[3:0];
            //$op[2:0] = $rand_op[2:0]; 
            $op[2:0] = ($rand_op[31:0]%(5-0+1))+0; //($urandom%(max-min+1))+min;
            
            $val1[31:0] = >>2$out;
            $sum[31:0]  = $val1 + $val2;
            $diff[31:0] = $val1 - $val2;
            $prod[31:0] = $val1 * $val2;
            $quot[31:0] = $val1 / $val2;
         @2
            $out[31:0] =
               $reset? '0 :
               $op==0? $sum :
               $op==1? $diff :
               $op==2? $prod :
               $op==3? $quot :
               $op==4? >>2$mem[31:0] :
                       >>2$out ;
            $mem[31:0] =
               $reset? '0 :
               //$op==5? >>2$out : // >>2$out = $val1
               $op==5? $val1 :
                       >>2$mem ;             
   m4+cal_viz(@3)
   
   // Assert these to end simulation (before Makerchip cycle limit).
   *passed = *cyc_cnt > 40;
   *failed = 1'b0;
\SV
   endmodule
