 .MODEL SMALL
 .STACK 100H
 .DATA
	STRING 		DB	80 DUP ( 0 )
	FIRST_OPTION	DB	0AH,0DH,'1. BUBBLE SORT $'
	SECOND_OPTION	DB	0AH,0DH,'2. SELECTION SORT $'
	OPTION_INPUT	DB	0AH,0DH,'ENTER OPTION NUMBER : $'
	INVALID_OPTION	DB	0AH,0DH,'INVALID OPTION ',0AH,0DH,'$'

	ITERATION_MSG	DB	0AH,0DH,'AFTER ONE ITERATION : $'
	INPUT_MSG	DB	0AH,0DH,'ENTER A STRING: $'
	OUTPUT_MSG	DB	0AH,0DH,'SORTED STRING IS: $'
	
	VALUE		DW	?
	
.CODE

include bubble.asm
include insertion.asm
include selection.asm
include option.asm
include swap.asm
include input.asm
include output.asm
include iteration.asm

 MAIN PROC
	
	;making the DS to point to data segment

	MOV AX,@DATA
	MOV DS,AX
	MOV ES,AX

	LEA DX,INPUT_MSG
	MOV AH,9
	INT 21H
	
	LEA DI,STRING
	CALL INPUT
	
	LEA SI,STRING
	
	CALL bubble_sort
	
	LEA DX,OUTPUT_MSG
	MOV AH,9
	INT 21H

	CALL OUTPUT
	
	     	
EXIT:
	MOV AH,4CH
	INT 21H	

MAIN ENDP

	END MAIN