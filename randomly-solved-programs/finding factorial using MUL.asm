 .MODEL SMALL
 .STACK 100H
 .DATA
	INPUT_MSG 	DB	0ah,0dh,'Enter a number: $'
	OUTPUT_MSG	DB	0AH,0DH,'Factorial of number is: $'
	
 .CODE
 MAIN PROC
	
	;making the DS to point to data segment

	MOV AX,@DATA
	MOV DS,AX
	
	CALL INPUT
	CALL FACTORIAL
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
	AND AX,0FH
	JMP RETURN

	LETTER:
		SUB AX,37H
	RETURN:
		MOV CX,AX
		RET

INPUT ENDP

OUTPUT PROC

	LEA DX, OUTPUT_MSG
	MOV AH,9
	INT 21H

	CMP AX,9H
	JG CHARACTER
	OR AX,30H
	JMP DISPLAY
	
	CHARACTER:
		ADD AX,37H
	DISPLAY:
		MOV DX,AX
		MOV AH,2
		INT 21H
		
		RET

OUTPUT ENDP

factorial proc
	
	MOV AX,1
	
	TOP:
	     MUL CX
	     LOOP TOP
	     RET	

factorial endp

	END MAIN
	
	

