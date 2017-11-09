SWAP PROC		;use SI and DI as input and swap to numbers

	PUSH AX
	
	MOV AL,[SI]
	XCHG AL,[DI]
	MOV [SI],AL
	
	POP AX
	RET

SWAP ENDP






	
	

