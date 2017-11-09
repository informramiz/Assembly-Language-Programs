INPUT PROC		;use di as input and give bx as output and store the string

	PUSH AX
	PUSH DI
	
	CLD
	XOR BX,BX
	MOV AH,1
	INT 21H

	WHILE1:
		CMP AL,0DH
		JE END_WHILE1
		
		CMP AL,8H
		JNE ELSE1
		
		DEC BX
		DEC DI
		JMP NEXT
	ELSE1:
		STOSB
		INC BX
	NEXT:
		INT 21H
		JMP WHILE1
	
	END_WHILE1:
		MOV VALUE,BX
		POP DI
		POP AX
		RET	
	
INPUT ENDP




	

