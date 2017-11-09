 .MODEL SMALL
 .STACK 100H
 .DATA
	MSG DB		'ENTER CHARACTERS: $'
	ARRAY DB 	0,0,0,0,0
 .CODE
 MAIN PROC
	
	MOV AX,@DATA
	MOV DS,AX
	
	mov ah,1
	int 21h
	
	shr al,1
	mov dl,al
	
	mov ah,2
	int 21h
	
	shl dl,1
	int 21h
	
	
EXIT:

	MOV AH,4CH
	INT 21H	
	
 MAIN ENDP
	END MAIN
	
	

