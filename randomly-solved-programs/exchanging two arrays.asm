 .MODEL SMALL
 .STACK 100H
 .DATA
	ARRAY1 DB 'a','b','c','d','e','f','g','h','i','j','k','l','m','n','o','p'
	ARRAY2 DB 'A','B','C','D','E','F','G','H','I','J','K','L','M','K','O','P'
 .CODE

 MAIN PROC
	MOV AX,@DATA
	MOV DS,AX
	
	MOV CX,16
	LEA si,array1
	LEA di,ARRAY2
 COPY:
	
	MOV AH,[si]
	MOV BH,[DI]
	
	MOV [di],AH
	MOV [SI],BH
	
	INC si
	inc di

	DEC CX
	JNZ COPY

	MOV AH,2
	MOV CX,16
	MOV DL,ARRAY1
DISPLAY:
	INT 21H
	INC ARRAY1
	MOV DL,ARRAY1
	DEC CX
	JNZ DISPLAY

 EXIT:
	MOV AH,4CH
	INT 21H	
	
 MAIN ENDP
	END MAIN
	
	

