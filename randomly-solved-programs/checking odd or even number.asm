 .MODEL SMALL
 .STACK 100H
 .DATA
	INPUT_MSG DB	'Enter a number: $'
	EVEN_MSG  DB	0AH,0DH,'Number is even: $'
	ODD_MSG   DB	0AH,0DH,'Number is odd: $'
 .CODE
 MAIN PROC
	
	;making the DS to point to data segment

	MOV AX,@DATA
	MOV DS,AX
	
	INPUT:
		LEA DX,INPUT_MSG
		MOV AH,9
		INT 21H
		
		MOV AH,1
		INT 21H
	
		TEST AL,1
		JZ EVEN_
		JMP ODD

	EVEN_:
		LEA DX,EVEN_MSG
		MOV AH,9
		INT 21H
		JMP EXIT

	ODD:
		LEA DX,ODD_MSG
		MOV AH,9
		INT 21H
	
	EXIT:
		MOV AH,4CH
		INT 21H	
	
 MAIN ENDP
	END MAIN
	
	

