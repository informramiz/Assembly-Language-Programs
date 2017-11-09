 .MODEL SMALL
 .STACK 100H
 .DATA
	INPUT_MSG 	DB	'Enter a character: $'
	OUTPUT_MSG	DB 	0AH,0DH,'Entered character is: $'
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
	
	LEA DX,INPUT_MSG
	MOV AH,9
	INT 21H

	MOV AH,1
	INT 21H
	MOV BL,AL
	RET
 INPUT ENDP

	
 OUTPUT PROC
	
	LEA DX,OUTPUT_MSG
	MOV AH,9
	INT 21H
	
	MOV AH,2
	MOV DL,BL
	INT 21H
	RET

 OUTPUT ENDP

	END MAIN
	
	

