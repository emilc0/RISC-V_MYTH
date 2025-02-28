# RISC-V Based MYTH Workshop, 19-28 Feb 2025

## RISC-V & GNU Toolchain; ABI & Verification

### D1_SK2_L1
_gedit sum1ton.c &_  
![image](https://github.com/user-attachments/assets/5694ed38-b4c2-4308-85f7-1d3493cf4814)

_gcc sum1ton.c && ./a.out_  
![image](https://github.com/user-attachments/assets/9823db04-45a3-4ee1-a83c-d2f28857816c)

![image](https://github.com/user-attachments/assets/30ce2dce-7049-4739-9f25-0d2095b1d19f)


### D1_SK2_L2

_riscv64-unknown-elf-gcc -O1 -mabi=lp64 -march=rv64i -o sum1ton.o sum1ton.c_  
![image](https://github.com/user-attachments/assets/5678ba2c-93c3-4fc2-ab8d-b01437ab09fb)

_riscv64-unknown-elf-objdump -d sum1ton.o | less_  
![image](https://github.com/user-attachments/assets/f651c020-85be-40ab-bcd5-a25e346dedce)

/main  
![image](https://github.com/user-attachments/assets/027dc23f-a4da-46e4-9712-f2c14a228e00)

n  
![image](https://github.com/user-attachments/assets/55da01fb-3412-4eb3-8787-b740ecdd6528)
-O1 option => 15 instructions in "main" 
(0x101c0-0x10184)/4 = 15

or:  
_riscv64-unknown-elf-nm -S sum1ton.o | grep main_
![image](https://github.com/user-attachments/assets/092ff295-3027-44ca-97c7-c0c8b77e74b6)
length of main functions: 0x3c bytes = 0x3c/4=0xf instructions  


_riscv64-unknown-elf-gcc -Ofast -mabi=lp64 -march=rv64i -o sum1ton.o sum1ton.c_  
![image](https://github.com/user-attachments/assets/9c3352ee-8d59-4237-a844-a476c9b4de8a)

![image](https://github.com/user-attachments/assets/acd85e10-0181-4188-943a-88145891a8bd)
-Ofast option => 0x100e0-0x100b0=0x30 => 12 instructions  

or:  
_riscv64-unknown-elf-nm -S sum1ton.o | grep main_  
![image](https://github.com/user-attachments/assets/d269c0f5-21f6-484e-9a12-d15f7ec00325)
0x30 => 12 instructions  

### D1_SK2_L3

_spike pk sum1ton.o_  
![image](https://github.com/user-attachments/assets/f9ab843a-c151-4cda-bcd8-2b63b9d4e7dc)

_spike -d pk sum1ton.o_  
![image](https://github.com/user-attachments/assets/cb5522bd-593d-44c9-8b6e-6886ddb0c5bf)


until pc 0 100b0  
reg 0 a2  
“enter”  
reg 0 a2  
reg 0 a0  
“enter”  
reg 0 a0  
reg 0 sp  
“enter”  
reg 0 sp  
q  
![image](https://github.com/user-attachments/assets/90687f30-c024-4709-884e-c4499e431cca)


### D1_SK3_L3

_nedit unsignedHighest.c &_  
![image](https://github.com/user-attachments/assets/b02eab5a-e07d-4f47-a700-301c4a7f9622)

_riscv64-unknown-elf-gcc -Ofast -mabi=lp64 -march=rv64i -o unsignedHighest.o unsignedHighest.c_  
_spike pk unsignedHighest.o_  
![image](https://github.com/user-attachments/assets/43c99681-2a00-4415-aa3d-735c0558d069)

![image](https://github.com/user-attachments/assets/0a4c7c2a-bcec-44b7-9023-6d38843d381a)

![image](https://github.com/user-attachments/assets/bceb53e3-8162-477e-8aaa-3a76452ceef1)

_riscv64-unknown-elf-gcc -Ofast -mabi=lp64 -march=rv64i -o unsignedHighest.o unsignedHighest.c && spike pk unsignedHighest.o_  
_gcc unsignedHighest.c && ./a.out_  
![image](https://github.com/user-attachments/assets/c167b5f6-66b2-4222-9ea2-5fd9a80fb00f)

Task: find the bug on the presentation:  
![image](https://github.com/user-attachments/assets/5a0907d8-31cb-40b2-8674-863a68361648)

![image](https://github.com/user-attachments/assets/11dea8cc-2678-4fe3-aa5f-d008809c7b5e)


### D2_SK2_L2

_nedit 1to9_custom.c &_  
![image](https://github.com/user-attachments/assets/e6d0705c-9f8d-409a-ac99-963de94869a2)

_nedit load.S &_  
![image](https://github.com/user-attachments/assets/14f949a1-b96b-40d7-9f9b-ff2856d17cfa)


### D2_SK2_L2

_riscv64-unknown-elf-gcc -Ofast -mabi=lp64 -march=rv64i -o 1to9_custom.o 1to9_custom.c load.S && spike pk 1to9_custom.o_  
![image](https://github.com/user-attachments/assets/d6693cf6-5f81-446e-9f49-e36606bad353)

_riscv64-unknown-elf-objdump -d 1to9_custom.o | less_  
![image](https://github.com/user-attachments/assets/f16ab169-aa4f-4e0f-b585-f48d010d9f2a)

### D2_SK3_L1

_cd riscv_workshop_collaterals/lab_  
_./rv32im.sh_  
![image](https://github.com/user-attachments/assets/6ab3f221-ca21-4866-8fa7-9268a2762a5e)



## Makerchip


### D3_SK1_L3 
__Makerchip Platform__ Slide 12
https://makerchip.com/sandbox/00Rf2h2jZ/00ghO7

__Combinatorial Logic__ Slide 13
https://makerchip.com/sandbox/00Rf2h2jZ/0g5hXz

__Vectors__ Slide 14
https://makerchip.com/sandbox/00Rf2h2jZ/0nZh8l

__Mux__ Slide 15
https://makerchip.com/sandbox/00Rf2h2jZ/0oYhOK

__Combinatorial Calculator__ Slide 16
https://makerchip.com/sandbox/00Rf2h2jZ/0pghYA

### D3_SK2_L1
__Counter__ Slide 21
https://makerchip.com/sandbox/00Rf2h2jZ/0qjhqk#

__Sequential Calculator__ Slide 23
https://makerchip.com/sandbox/00Rf2h2jZ/0xGhYj

### D3_SK3_L3
__Pipeline__ Slide 34
https://makerchip.com/sandbox/00Rf2h2jZ/0Anhkx

### D3_SK3_L4
__Counter and Calculator in Pipeline__ Slide 35
https://makerchip.com/sandbox/00Rf2h2jZ/0GZhv5#

__2-Cycle Calculator__ Slide 36
https://makerchip.com/sandbox/00Rf2h2jZ/0KOhVw#

## D3_SK4_L4
__2-Cycle Calculator with Validity__ Slide 41
https://makerchip.com/sandbox/00Rf2h2jZ/0mwhgE#

## D3_SK4_L5
__Calculator with Single-Value Memory__ Slide 43
https://makerchip.com/sandbox/00Rf2h2jZ/0Bghwp#

### D3_SK5_L1
__Hierarchy__ Slide 45
https://makerchip.com/sandbox/00Rf2h2jZ/0DRhEq

### D4_SK2_L1
__Next PC__ Slide 6
https://makerchip.com/sandbox/00Rf2h2jZ/0pghnNo#

__Fetch (part 1)__ Slide 7
https://makerchip.com/sandbox/00Rf2h2jZ/0pghnNo#

__Fetch (part 2)__ Slide 8
https://makerchip.com/sandbox/00Rf2h2jZ/0qjh8Pr#

### D4_SK2_L3
__Instruction Type Decode__ Slide 10
https://makerchip.com/sandbox/00Rf2h2jZ/0xGh148#

### D4_SK2_L4
__Instruction Immediate Decode__ Slide 10
https://makerchip.com/sandbox/00Rf2h2jZ/0y8hrzR#

### D4_SK2_L5
__Instruction Decode__ Slide 11
https://makerchip.com/sandbox/00Rf2h2jZ/0DRh5KE#

### D4_SK2_L6
__RISC-V Instruction Field Decode__ Slide 12
https://makerchip.com/sandbox/00Rf2h2jZ/0Bgh79Y#

### D4_SK2_L7
__Instruction Decode__ Slide 13
https://makerchip.com/sandbox/00Rf2h2jZ/0Elh3JZ#

### D4_SK3_L1
__Register File Read__ Slide 16
https://makerchip.com/sandbox/00Rf2h2jZ/0Nxh00M#

### D4_SK3_L2
__Register File Read (part 2)__ Slide 17
https://makerchip.com/sandbox/00Rf2h2jZ/0Vmhxxz#

### D4_SK3_L3
__ALU__ Slide 18
https://makerchip.com/sandbox/00Rf2h2jZ/0Z4h55n

### D4_SK3_L4
__Register File Write__ Slide 20
https://makerchip.com/sandbox/00Rf2h2jZ/01jhMMj#

### D4_SK3_L6
__Branches__ Slide 21
https://makerchip.com/sandbox/00Rf2h2jZ/03lhpp0#

### D4_SK3_L7
__Branches__ Slide 22
https://makerchip.com/sandbox/00Rf2h2jZ/0j2hnn4#

### D4_SK3_L8
__Testbench__ Slide 25
https://makerchip.com/sandbox/00Rf2h2jZ/0k5hOOD#

### D5_SK1_L2
__3-Cycle $valid__ Slide 33
https://makerchip.com/sandbox/00Rf2h2jZ/0lOh220#

### D5_SK1_L3
__3-Cycle RISC-V__ Slide 36
https://makerchip.com/sandbox/00Rf2h2jZ/0qjh88r#

### D5_SK1_L4
__3-Cycle RISC-V__ Slide 37
https://makerchip.com/sandbox/00Rf2h2jZ/0wjhGGj#

### D5_SK2_L1
__Register File Bypass__ Slide 39
https://makerchip.com/sandbox/00Rf2h2jZ/0y8hrrR#

### D5_SK2_L2
__Branches__ Slide 42
https://makerchip.com/sandbox/00Rf2h2jZ/0k5hOOV#

### D5_SK2_L3
__Complete Instruction Decode__ Slide 44
https://makerchip.com/sandbox/00Rf2h2jZ/0mwhjjg#

### D5_SK2_L4
__Complete ALU__ Slide 45
https://makerchip.com/sandbox/00Rf2h2jZ/0nZh77R#

### D5_SK3_L1
__Redirect Loads__ Slide 48
https://makerchip.com/sandbox/00Rf2h2jZ/0pghnzn#

### D5_SK3_L2
__Load Data__ Slide 49
https://makerchip.com/sandbox/00Rf2h2jZ/0qjh8OO#

### D5_SK3_L3
__Load Data__ Slide 51
https://makerchip.com/sandbox/00Rf2h2jZ/0KOh2qA#

### D5_SK3_L4
__Load/Store in Program__ Slide 52
https://makerchip.com/sandbox/00Rf2h2jZ/0LghRPE#

### D5_SK3_L5
__Jumps__ Slide 53
https://makerchip.com/sandbox/00Rf2h2jZ/0Mjhq5W#



## Acknowledgements
Kunal Ghosh, Co-founder of VLSI System Design (VSD) Corp. Pvt. Ltd.

Steve Hoover, founder of Redwood EDA






