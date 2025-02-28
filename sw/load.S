.section .text
.global load
.type load, @function

load:
  add  a4, a0, zero // initialize sum register a4 with a0 (initial count)
  add  a2, a0, a1   // store final count (a0= start + a1=count) in register a2
  add  a3, a0, zero // initialize counter a3 with 0
loop:
  add  a4, a3, a4   // addition
  addi a3, a3, 1    // increment counter
  blt  a3, a2, loop // if a3 < a2 branch to loop
  add  a0, a4, zero // store and return final result in a0
  ret
  
