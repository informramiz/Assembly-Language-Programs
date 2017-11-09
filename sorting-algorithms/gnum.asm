GNUM_SORT PROC 		;use variable value as size and sort the stringsss

	PUSH SI
	PUSH DX
	
	MOV SI,1H
	
	GNUM:
		CMP SI,bx
		JNL RETURN3
		
		MOV AL,STRING[SI-1]
		CMP STRING[SI],AL
		JL ELSE2
		
		INC SI
		JMP NEXT4
		
		ELSE2:
			
			XCHG AL,STRING[SI]
			MOV STRING[SI-1],AL

			CMP SI,1H
			JG DECREMENT
			INC SI
			
			JMP NEXT4

		DECREMENT:
								
			DEC SI
		NEXT4:
			CALL ITERATION_PROC
			JMP GNUM
	RETURN3:
		POP DX
		POP SI
		RET

GNUM_SORT ENDP