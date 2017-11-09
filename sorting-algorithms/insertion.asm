INSERT_SORT PROC	;use bx and si as input and sort the string pointed by si
		
	PUSH DI
	PUSH SI
	PUSH CX
	PUSH DX
	PUSH BX
	
	DEC BX
	MOV DI,1H	

	INSERT:				;main loop which runs untill string is sorted
		MOV DL,STRING[DI]
		MOV SI,DI
		
		WHILE_:			;sorts a portion of string
			CMP SI,0H
			JE NEXT2
		
			CMP STRING[SI-1],DL
			JNG NEXT2
			
			MOV DH,STRING[SI-1]
		
			MOV STRING[SI],DH

			DEC SI
			JMP WHILE_
	NEXT2:
		MOV STRING[SI],DL
		
		CALL ITERATION_PROC

		INC DI
		CMP DI,BX
		JNG INSERT

		POP BX
		POP DX
		POP CX
		POP SI
		POP DI
		RET		

INSERT_SORT ENDP

	
	

