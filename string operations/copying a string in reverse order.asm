 .MODEL SMALL
 .STACK 100H
 .DATA
	STRING1 	DB	'RAMIZ$'
	STRING2		DB	'RESUL$'
	
 .CODE
 MAIN PROC
	
	;making the DS to point to data segment

	MOV AX,@DATA
	MOV DS,AX
	MOV ES,AX

	STD
	LEA SI,STRING1+4
	LEA DI,STRING2
	
	MOV CX,5

	TOP:
		MOVSB
		ADD DI,2
		LOOP TOP

	CALL OUTPUT	     	
EXIT:
	MOV AH,4CH
	INT 21H	

MAIN ENDp

OUTPUT PROC
	
	PUSH AX
	PUSH DX
	
	MOV AH,9
	LEA DX,STRING2
	INT 21H
	
	POP DX
	POP AX
	RET

OUTPUT ENDP

	END MAIN
	
	
