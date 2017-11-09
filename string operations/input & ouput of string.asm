 .MODEL SMALL
 .STACK 100H
 .DATA
	STRING 		DB	80 DUP ( 0 )
	INPUT_MSG	DB	0AH,0DH,'Enter a string: $'
	OUTPUT_MSG	DB	0AH,0DH,'String is: $'
	
 .CODE
 MAIN PROC

	MOV AX,@DATA
	MOV DS,AX
	MOV ES,AX
	

	LEA DX,INPUT_MSG
	CALL STR_OUTPUT
	
	LEA DI,STRING
	CALL INPUT

	LEA DX,OUTPUT_MSG
	CALL STR_OUTPUT

	LEA SI,STRING
	CALL OUTPUT	     	
EXIT:
	MOV AH,4CH
	INT 21H	

MAIN ENDp

INPUT PROC	;use di as input and gives output in bx

	PUSH DI
	PUSH AX
	XOR BX,BX
	
	CLD
	MOV AH,1
	INT 21H
	
	WHILE1:			;take input and store the characters
		CMP AL,0DH
		JE END_WHILE1
	
		CMP AL,8H		
		JNE ELSE1
		
		DEC DI
		DEC BX
		JMP NEXT
	
	ELSE1:
		STOSB
		INC BX
	NEXT:
		INT 21H
		JMP WHILE1
	
	END_WHILE1:
		
		POP AX
		POP DI
		RET	
INPUT ENDP

OUTPUT PROC	;use si and bx as input and print the string  

	PUSH AX
	PUSH BX
	PUSH CX
	PUSH DX
	PUSH SI
	
	MOV CX,BX
	JCXZ RETURN
	
	CLD
	MOV AH,2
	
	PRINT:		;prints the stored string
		LODSB
		MOV DL,AL
		INT 21H
		
		LOOP PRINT
	RETURN:
		POP SI
		POP DX
		POP CX
		POP BX
		POP AX
		RET	

OUTPUT ENDP

STR_OUTPUT PROC

	PUSH AX
	PUSH DX
	
	MOV AH,9
	INT 21H
	
	POP DX
	POP AX
	RET

STR_OUTPUT ENDP


	END MAIN
	
	

