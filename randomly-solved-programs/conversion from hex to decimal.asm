 .MODEL SMALL
 .STACK 100H
 .DATA
	MSG1 DB 'ENTER A NUMBER IN HEX (A-F) : $'
	MSG2 DB 0DH,0AH,'NUMBER IN DECIMAL IS: $'
 .CODE

 MAIN PROC
	
	MOV AX,@DATA
	MOV DS,AX
	
	MOV AX,0
	MOV BX,0	
	
	LEA DX,MSG1
	MOV AH,9
	INT 21H

	MOV AH,1
	INT 21H
	
	CMP AL,'A'
	JNGE EXIT
	
	CMP AL,'F'
	JNLE EXIT
	
	SUB AL,31H
	MOV AH,0H

	MOV BL,10H
	DIV BL
	
	ADD AL,30H
	ADD AH,30H

	MOV BL,AL
	MOV BH,AH
	
	LEA DX,MSG2
	MOV AH,9
	INT 21H
	
	MOV DL,BL
	MOV AH,2
	INT 21H

	MOV DL,BH
	INT 21H

EXIT:
	MOV AH,4CH
	INT 21H	
	
 MAIN ENDP
	END MAIN
	
	

