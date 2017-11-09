 .MODEL SMALL
 .STACK 100H
 .DATA
	ARRAY1 DB 'a','b','c','d','e','f','g','h','i','j'
	ARRAY2 DB 0H,0H,0H,0H,0H,0H,0H,0H,0H,0H
 .CODE

 MAIN PROC
	MOV AX,@DATA
	MOV DS,AX
	
	MOV CX,10
	LEA si,array1+9
	LEA di,ARRAY2
 COPY:
	
	MOV AH,[si]	
	MOV [di],AH
	
	dec si
	inc di

	DEC CX
	JNZ COPY

	MOV AH,2
	MOV CX,16
	MOV DL,ARRAY1
DISPLAY:
	INT 21H
	DEC ARRAY1
	MOV DL,ARRAY1
	DEC CX
	JNZ DISPLAY

 EXIT:
	MOV AH,4CH
	INT 21H	
	
 MAIN ENDP
	END MAIN
	
	

