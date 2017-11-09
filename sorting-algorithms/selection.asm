SELECT_SORT PROC		;use si and bx as input and sort the STRING

	PUSH SI
	PUSH AX
	PUSH BX
	PUSH CX
	PUSH DX

	DEC BX
	JE END_SORT
	MOV DX,SI
	
	SORT_LOOP:		;runs untill STRING is sorted
		MOV SI,DX
		MOV DI,SI
		MOV CX,BX
		
		MOV AL,[DI]
	
	FIND_BIG:		;find the MAX number
		INC SI
		CMP [SI],AL
		JNG NEXT1
		
		MOV DI,SI
		MOV AL,[DI]

	NEXT1:
		LOOP FIND_BIG
		CALL SWAP	;swaps Max number with last location
		DEC BX
	
		CALL ITERATION_PROC
		JNE SORT_LOOP
	
	END_SORT:
		POP DX
		POP CX
		POP BX
		POP AX
		POP SI

		RET
SELECT_SORT ENDP



