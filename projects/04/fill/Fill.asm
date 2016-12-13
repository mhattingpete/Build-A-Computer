// This file is part of www.nand2tetris.org
// and the book "The Elements of Computing Systems"
// by Nisan and Schocken, MIT Press.
// File name: projects/04/Fill.asm

// Runs an infinite loop that listens to the keyboard input.
// When a key is pressed (any key), the program blackens the screen,
// i.e. writes "black" in every pixel;
// the screen should remain fully black as long as the key is pressed. 
// When no key is pressed, the program clears the screen, i.e. writes
// "white" in every pixel;
// the screen should remain fully clear as long as no key is pressed.

(RESTART)
@SCREEN
D=A
@addr
M=D // addr = SCREEN base address

// KEYBOARD CHECK
(KBDCHECK)
	@KBD
	D=M
	@BLACK
	D;JGT // if any key is pressed goto BLACK
	@WHITE
	D;JEQ // else goto WHITE
	
	@KBDCHECK
	0;JMP
	
(BLACK)
	@fill
	M=-1 // fill = -1 = 1111111111111111, black color
	@CHANGE
	0;JMP

(WHITE)
	@fill
	M=0 // fill = 0 = 0000000000000000, white color
	@CHANGE
	0;JMP
	
(CHANGE)
	@fill
	D=M // retrieve fill value
	
	@addr
	A=M // Get address of screen pixel to fill
	M=D // fill pixel on address with fill value
	
	@addr
	D=M+1 // Set address to next pixel value
	@KBD
	D=A-D // KBD - SCREEN = A
	
	@addr
	M=M+1 // Set address to next pixel value
	A=M
	
	@CHANGE
	D;JGT // if A=0 stop loop as the whole screen is changed

@RESTART
0;JMP // infinite end loop