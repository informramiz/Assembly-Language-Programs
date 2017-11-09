 .MODEL SMALL
 .STACK 100H
 .DATA
	STRING 				DB	80 DUP ( 0 )
	BUBBLE_OPTION		DB	0AH,0DH,'1. BUBBLE SORT $'
	SELECTION_OPTION 	DB	0AH,0DH,'2. SELECTION SORT $'
	INSERTION_OPTION 	DB	0AH,0DH,'3. INSERTION SORT $'
	GNUM_OPTION			DB	0AH,0DH, '4. GNOM SORT $'
	MINIMUM_OPTION		DB	0AH,0DH, '5. MINIMUM ELEMENT SORT $'
	
	OPTION_INPUT		DB	0AH,0DH,'ENTER OPTION NUMBER : $'
	INVALID_OPTION		DB	0AH,0DH,'INVALID OPTION ',0AH,0DH,'$'

	ITERATION_MSG		DB	0AH,0DH,'AFTER ONE ITERATION : $'
	INPUT_MSG			DB	0AH,0DH,'ENTER A STRING: $'
	OUTPUT_MSG			DB	0AH,0DH,'SORTED STRING IS: $'
	INPUT_AGAIN			DB	0AH,0DH,0AH,0DH,'DO YOU WANT TO CONTINUE ( 0/1 ) ? : $'
	
	VALUE				DW	?
	
.CODE

include minimumElement.asm
include bubble.asm
include insertion.asm
include selection.asm
include option1.asm
include swap.asm
include input.asm
include output.asm
include iteration.asm
INCLUDE GNUM.ASM

 MAIN PROC
	
	;making the DS to point to data segment

	MOV AX,@DATA
	MOV DS,AX
	MOV ES,AX
	
	CALL OPTION1
	     	
EXIT:
	MOV AH,4CH
	INT 21H	

MAIN ENDP



	END MAIN