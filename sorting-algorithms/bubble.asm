BUBBLE_SORT PROC 		;use si and bx as input and sort the STRING

	PUSH AX
	PUSH BX
	PUSH CX
	PUSH DX
	PUSH SI
	PUSH DI
	
	DEC BX
	JE BUBBLE_END

	MOV DX,SI

	LOOP_BUBBLE:
		
		MOV SI,DX
		MOV CX,BX
		
		MOV DI,SI
		
	REPLACE_BIG:
		
		MOV AL,[DI]
		INC SI
		
		CMP AL,[SI]
		JNG LESs1
	
		CALL SWAP

	LESS1:
		INC DI
		LOOP REPLACE_BIG

		DEC BX
		
		CALL ITERATION_PROC
		JNz LOOP_BUBBLE

	BUBBLE_END:

		POP DI
		POP SI
		POP DX
		POP CX
		POP BX
		POP AX
		RET
	

BUBBLE_SORT ENDP

	
	

