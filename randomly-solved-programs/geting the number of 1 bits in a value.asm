 .MODEL SMALL
 .STACK 100H
 .DATA
	INPUT_MSG DB	'Numbe of even bits are : $'
	OUTPUT_MSG   DB	0AH,0DH,'characters entered :$'
 .CODE
 MAIN PROC
	
	;making the DS to point to data segment

	MOV AX,@DATA
	MOV DS,AX

	MOV AX,30H
	MOV BX,8
	MOV CL,16
	TOP:
		ROL BX,1
		JNC NEXT
		INC AX
	NEXT:
		LOOP TOP
	mov cx,ax	

	LEA dx,input_msg
	mov ah,9
	int 21h		
	
	MOV DL,cl
	MOV AH,2
	INT 21H
		
	EXIT:
		MOV AH,4CH
		INT 21H	
	
 MAIN ENDP
	END MAIN
	
	

