 .MODEL SMALL
 .STACK 100H
 .DATA
	INPUT_MSG DB	0AH,0DH,'Enter a number ( 0 to 9 ) : $'
	SORRY_MSG DB	0AH,0DH,'Sorry you have entered a wrong number $'
	AGAIN_MSG DB	0AH,0DH,'Do you want to exit (y) or restart(n) : $'
	END_MSG   DB	0AH,0DH,'You haver entered a wrong number 3 times consequently, so the ',0AH,0DH,'program is forcefully aborted $'
	END_LINE  DB	0AH,0DH,' $'
	COUNTER   DB	0H
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
		MOV BL,AL
		MOV CL,30H
		MOV AH,2
	
	CHECK:
		CMP BL,30H
		JL SORRY
		CMP BL,39H
		JG SORRY
	
	PRINT:
		MOV COUNTER,0H

		LEA DX,END_LINE
		MOV AH,9
		INT 21H

		MOV AH,2
		MOV DL,CL
		INT 21H
		INC CL
		CMP CL,BL
		JNG PRINT
	
	AGAIN:
		LEA DX,AGAIN_MSG
		MOV AH,9
		INT 21H
		
		MOV AH,1
		INT 21H
		CMP AL,'y'
		JE EXIT
		CMP AL,'n'
		JE INPUT
		JMP EXIT
	
	SORRY:
		INC COUNTER
		CMP COUNTER,3H
		JE  END_

		LEA DX,SORRY_MSG
		MOV AH,9
		INT 21H
		JMP AGAIN	

	END_:
		LEA DX,END_LINE
		MOV AH,9
		INT 21H
		LEA DX,END_MSG
		INT 21H
	
	EXIT:
		MOV AH,4CH
		INT 21H	
	
 MAIN ENDP
	END MAIN
	
	

