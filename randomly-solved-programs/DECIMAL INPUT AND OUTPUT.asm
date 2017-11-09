.MODEL SMALL
.STACK 100H
.DATA
	INPUT1_MSG	DB	0AH,0DH,'ENTER A NUMBER : $'
	INPUT2_MSG	DB	0AH,0DH,'ENTER SECOND NUMBER: $'
	DIV_MSG		DB	0AH,0DH,'DIV IS: $'
	MOd_MSG		DB	0AH,0DH,'MOD IS: $'
	NUM1		DW	0
	NUM2		Db	0
	COUNTER		DB	0

.CODE

	
MAIN PROC
	
	MOV AX,@DATA
	MOV DS,AX
	
	LEA DX,INPUT1_MSG
	MOV AH,9
	INT 21H
	
	
	CALL decimal_input

	
	
	
	MOV BX,DX
	LEA DX,MOD_MSG
	MOV AH,9
	INT 21H
	CALL decimal_output

	EXIT:
		MOV AH,4CH
		INT 21H
	
	
MAIN ENDP

decimal_input proc

	
	xor cx,cx
	xor bx,bx

	xor ax,ax

	mov ah,1
	

	while3:
		xor dx,dx
		int 21h
		
		and ax,000fh
		
		push ax
		
		mov ax,bx
		mov bx,10
		mul bx
		
		pop bx
		add bx,ax
		jnc while3
		ret

decimal_input endp

decimal_output proc

	mov ax,bx
	mov cx,10
	
	while2:
		xor dx,dx
		div cx
		je out1
		
		push dx
		
		jmp while2	
	
	out1:
		cmp dx,00fch
		je return2
		
		mov ah,2
		pop dx
		int 21h
		jmp out1

	return2:
		ret

decimal_output endp
	
INDEC	PROC	;use cx and ax and gives output in bx
	
	MOV COUNTER,4h
	XOR BX,BX
	
	TOP:
		MOV AH,1
		INT 21H

		CMP AL,0DH
		JE RETURN
		
		AND AX,000FH
		PUSH AX
		
		MOV AX,10h
		MUL BX
		
		POP BX
		ADD BX,AX
				
		DEC COUNTER
		JNZ TOP

	RETURN:
		RET

INDEC	ENDP

OUTDEC	PROC	;use bx as input and display number

	
	xor ax,ax
	MOV AX,BX
	xor bx,bx
	MOV BX,10h
	MOV COUNTER,0h
	
	UP:
		XOR DX,DX
		DIV BX				
		
		push dx
		INC COUNTER	

		CMP ax,0
		je print
					
		JMP UP

	print:
		mov ah,2
		pop dx

		add dx,30h
		int 21h

		dec counter
		jnz print	

	END_:
		RET
OUTDEC ENDP

END MAIN