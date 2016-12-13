// This file is part of www.nand2tetris.org
// and the book "The Elements of Computing Systems"
// by Nisan and Schocken, MIT Press.
// File name: projects/04/Mult.asm

// Multiplies R0 and R1 and stores the result in R2.
// (R0, R1, R2 refer to RAM[0], RAM[1], and RAM[2], respectively.)

@R2
M=0
@R0
D=M
@n
M=D // n = RAM[0]
@sum
M=0 // sum = 0
@R0
D=M
@END
D;JEQ	//IF ONE PRODUCT IS ZERO
@R1
D=M
@END
D;JEQ	//IF ONE PRODUCT IS ZERO

(LOOP)
	@sum
	D=M
	@R1
	D=D+M
	@sum
	M=D // sum = sum + RAM[1]
	
	@n
	M=M-1 // n = n - 1
	D=M
	@LOOP
	D;JGT // if n > 0 goto LOOP

@sum
D=M
@R2
M=D // RAM[2] = sum

(END)
	@END
	0;JMP
