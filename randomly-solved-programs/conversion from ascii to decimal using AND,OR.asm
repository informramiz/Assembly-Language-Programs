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
	
	and al,0fh
	
	mov dl,al
	mov ah,2
	int 21h
	
	or dl,30h
	int 21h
	
	
EXIT:

	MOV AH,4CH
	INT 21H	
	
 MAIN ENDP
	END MAIN
	
	

