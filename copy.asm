 .MODEL SMALL
 .STACK 100H
 .DATA
	ARRAY1 DB 'a','b','c','d','e','f','g','h'
	ARRAY2 DB 0H,0H,0H,0H,0H,0H,0H,0H
 .CODE

 MAIN PROC
	MOV AX,@DATA
	MOV DS,AX
	
	MOV CX,8
	LEA si,ARRAY1
	LEA di,ARRAY2
COPY:
	MOV AH,[si]
	MOV [di],AH
	
	INC si
	INC di
	DEC CX
	JNZ COPY
EXIT:
	MOV AH,4CH
	INT 21H	
	
MAIN ENDP
	END MAIN
	
	

