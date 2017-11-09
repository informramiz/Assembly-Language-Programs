 .MODEL SMALL
 .STACK 100H
 .DATA
	INPUT_MSG 	DB	0ah,0dh,'Enter a hex number: $'
	OUTPUT_MSG	DB	0AH,0DH,'Decimal number is: $'
	
 .CODE
 MAIN PROC
	
	;making the DS to point to data segment

	MOV AX,@DATA
	MOV DS,AX
	
	CALL INPUT
	CALL OUTPUT	

EXIT:
	MOV AH,4CH
	INT 21H	

 MAIN ENDP

INPUT PROC

	LEA DX , INPUT_MSG
	MOV AH,9
	INT 21H

	MOV AH,1
	INT 21H
	
	
	CMP AL,41H	
	JNL LETTER
	
	sub al,30h
	JMP RETURN

	LETTER:
		CMP AL,61H
		JNL LOWER
		SUB AL,31H
	
	LOWER:
		SUB AL,51H
	RETURN:
		MOV BL,AL
		RET

INPUT ENDP

OUTPUT PROC

	LEA DX, OUTPUT_MSG
	MOV AH,9
	INT 21H

	CHARACTER:
		MOV AH,2
		MOV CL,4
		MOV CH,2
	
	PRINT:
		MOV DL,BL
		SHR DL,CL
		
		ADD DL,30H
		INT 21H
		ROL BL,CL
		
		DEC CH
		JNZ PRINT
	BACK:
		RET
OUTPUT ENDP



	END MAIN
	
	

