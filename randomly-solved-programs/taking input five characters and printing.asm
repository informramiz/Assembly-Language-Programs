 .MODEL SMALL
 .STACK 100H
 .DATA
	MSG DB		'ENTER CHARACTERS: $'
	ARRAY DB 	0,0,0,0,0
 .CODE
 MAIN PROC
	
	MOV AX,@DATA
	MOV DS,AX
	
	LEA DX,MSG
	MOV AH,9
	INT 21H

	MOV AH,1
	MOV CX,5
	
	LEA DI,ARRAY

 TOP:
	INT 21H
	MOV [DI],AL
	INC DI
	LOOP TOP

END_LINE:
	MOV AH,2
	MOV DL,0DH
	INT 21H
	
	MOV DL,0AH
	INT 21H

	MOV CX,5	
	LEA DI,ARRAY
PRINT:
	MOV DL,[DI]
	INT 21H
	INC DI
	LOOP PRINT
	
	
 EXIT:

	MOV AH,4CH
	INT 21H	
	
 MAIN ENDP
	END MAIN
	
	

