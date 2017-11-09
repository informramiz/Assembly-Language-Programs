 .MODEL SMALL
 .STACK 100H
 .DATA
	INPUT_MSG DB	'Enter a number: $'
	BIT_MSG   DB	0AH,0DH,'Number of 1 bits are:$'
 .CODE
 MAIN PROC
	
	;making the DS to point to data segment

	MOV AX,@DATA
	MOV DS,AX
	
	XOR BX,BX
	MOV AH,1
	INT 21H
		
	INPUT:
		CMP AL,0DH
		JE END_WHILE_
		
		AND AL,01H
		SHL BX,1
		OR BL,AL
		INT 21H
		JMP INPUT

	END_WHILE_:

		MOV AH,2
		MOV CX,16

	PRINT:
		ROL BX,1
		JC ONE
		JNC ZERO

	ONE :

		MOV DL,'1'
		INT 21H
		LOOP PRINT
		JMP EXIT
	
 	ZERO:
		MOV DL,'0'
		INT 21H
		LOOP PRINT
		
	EXIT:
		MOV AH,4CH
		INT 21H	
	
 MAIN ENDP
	END MAIN
	
	

