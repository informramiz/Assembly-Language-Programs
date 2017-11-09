 .MODEL SMALL
 .STACK 100H
 .DATA
	INPUT_MSG DB	'Enter a string : $'
	OUTPUT_MSG   DB	0AH,0DH,'Entered string is :$'
 .CODE
 MAIN PROC
	
	;making the DS to point to data segment

	MOV AX,@DATA
	MOV DS,AX

	LEA DX,INPUT_MSG
	MOV AH,9	
	INT 21H
	
	XOR cX,cX
	MOV AH,1
	INT 21H
		
	WHILE_:
		CMP AL,0DH
		JE END_WHILE_
		PUSH AX
		INC CX
		INT 21H
		JMP WHILE_
		
	END_WHILE_:
		LEA DX,OUTPUT_MSG
		MOV AH,9
		INT 21H

		MOV AH,2
		JCXZ EXIT
	TOP:
		POP DX
		INT 21H
		LOOP TOP
		
	EXIT:
		MOV AH,4CH
		INT 21H	
	
 MAIN ENDP
	END MAIN
	
	

