 .MODEL SMALL
 .STACK 100H
 .DATA
	INPUT_MSG DB	'Enter hex numbers: $'
	BIT_MSG   DB	0AH,0DH,'Entered number is:$'
 .CODE
 MAIN PROC
	
	;making the DS to point to data segment

	MOV AX,@DATA
	MOV DS,AX

	LEA DX,INPUT_MSG
	MOV AH,9	
	INT 21H
	
	XOR BX,BX
	MOV CL,4
	MOV AH,1
	INT 21H
		
	WHILE_:
		CMP AL,0DH
		JE END_WHILE_
		
		CMP AL,39H
		JG LETTER
		AND AL,0FH
		JMP SHIFT
	LETTER:
		SUB AL,37H
	SHIFT:
		SHL BX,CL
		OR BL,AL
		INT 21H
		JMP WHILE_
		

	END_WHILE_:
		LEA DX,BIT_MSG
		MOV AH,9
		INT 21H

		MOV CH,4
		MOV AH,2
		
	TOP:
		MOV DL,BH
		SHR DL,CL
		CMP DL,9H
		JG CHARACTER
		
		OR DL,30H
		INT 21H
		ROL BX,CL 
		DEC CH
		JNZ TOP
		JMP EXIT
	
	CHARACTER:
		ADD DL,37H
		INT 21H
		ROL BX,CL
		DEC CH
		JNZ TOP
	EXIT:
		MOV AH,4CH
		INT 21H	
	
 MAIN ENDP
	END MAIN
	
	

