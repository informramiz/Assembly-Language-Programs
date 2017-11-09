 .MODEL SMALL
 .STACK 100H
 .DATA
	INPUT_MSG 	DB	0ah,0dh,'Enter a binary number: $'
	OUTPUT_MSG	DB	0AH,0DH,'Hex number is: $'
	
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
	xor bx,bx
	LEA DX , INPUT_MSG
	MOV AH,9
	INT 21H
	
	MOV ah,1
	MOV Cl,16
	
TOP:
	INT 21H
	CMP AL,0DH
	JE RETURN
	
	CMP AL,31H
	JG Return
	
	sub al,30h
	SHL BX,1
	OR BL,AL
	LOOP TOP
RETURN:
	RET

INPUT ENDP

OUTPUT PROC

	LEA DX, OUTPUT_MSG
	MOV AH,9
	INT 21H

	MOV CL,4
	MOV CH,4
	
	MOV AH,2
TOP1:
	MOV Dl,bH
	SHR DL,CL
	
	CMP DL,9H
	JG LETTER
	
	OR DL,30H
	CMP DL,'0'
	JE NEXT

	JMP PRINT
LETTER:
	ADD DL,37H
	
PRINT:
	INT 21H
NEXT:
	ROL BX,CL
	DEC CH
	JNZ TOP1
	RET

OUTPUT ENDP
	END MAIN
	
	

