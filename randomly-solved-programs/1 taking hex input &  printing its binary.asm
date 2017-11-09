 .MODEL SMALL
 .STACK 100H
 .DATA
	INPUT_MSG 	DB	0ah,0dh,'Enter a hex number: $'
	OUTPUT_MSG	DB	0AH,0DH,'Hex number is: $'
	
 .CODE
 MAIN PROC
	
	;making the DS to point to data segment

	MOV AX,@DATA
	MOV DS,AX
	
	LEA DX , INPUT_MSG
	MOV AH,9
	INT 21H
	
	MOV Cl,4
	MOV CH,4

	MOV AH,1
 TOP1:
	INT 21H
	CMP AL, 0DH
	JE output

	CMP AL,41H
	JNL LETTER
	
	AND AL,0FH
	JMP SHIFT

LETTER:
	CMP AL,61H
	JNL LOWER
	
	SUB AL,37H
	JMP SHIFT
LOWER:
	SUB AL,57H
SHIFT:
	SHL Bx,CL
	OR BL,AL
	DEc CH
	JNZ TOP1

output:
	LEA DX, OUTPUT_MSG
	MOV AH,9
	INT 21H
	
	MOV CX,16
	MOV AH,2
TOP2:
	ROL BX,1
	JNC ZERO
	MOV DL,'1'
	JMP NEXT
	
ZERO:
	MOV DL,'0'
NEXT:
	INT 21H
	LOOP TOP2

EXIT:
	MOV AH,4CH
	INT 21H	
MAIN ENDP
	
	END MAIN
	
	

