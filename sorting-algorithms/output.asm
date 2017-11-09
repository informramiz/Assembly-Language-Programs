OUTPUT PROC		;use bx and si as input and print the string
	
	PUSH AX
	PUSH BX
	PUSH CX
	PUSH DX
	PUSH SI
	
	CLD
	MOV AH,2
	
	MOV CX,VALUE
	JCXZ RETURN

	PRINT:
		LODSB
		MOV DL,AL
		INT 21H
		
		mov dl,' '
		int 21h
		
		LOOP PRINT
	RETURN:
		POP SI
		POP DX
		POP CX
		POP BX
		POP AX
		RET
OUTPUT ENDP

	
	

