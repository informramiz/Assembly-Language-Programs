.MODEL SMALL
.STACK 100H
.DATA
	INPUT_MSG 	DB		0AH,0DH,'Enter a character: $'
	OUTPUT_MSG 	DB		0AH,0DH,'Its reverse character is: $'
.CODE

MAIN PROC
	
	MOV AX,@DATA
	MOV DS,AX
	
INPUT:
	LEA DX,INPUT_MSG
	MOV AH,9
	INT 21H
	
	MOV AH,1
	INT 21H
	
	CMP AL,0DH
	JE EXIT

	CMP AL,41H
	JL EXIT
	CMP AL,7AH
	JG EXIT
	
	MOV BL,AL


	LEA DX,OUTPUT_MSG
	MOV AH,9
	INT 21H

	MOV DL,BL
	MOV AH,2

	CMP BL,61H
	JNL LOWER_LETTER
	OR DL,20H
	JMP PRINT
	
LOWER_LETTER:
		AND DL,0DFH

PRINT:
	INT 21H
	JMP INPUT
EXIT:
	MOV AH,4CH
	INT 21H

MAIN ENDP
	END MAIN