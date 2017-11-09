MINIMUM_ELEMENT_SORT PROC

	PUSH AX
	PUSH BX
	PUSH CX
	PUSH SI
	PUSH DI

	mov bx,value
	xor cx,cx

	DEC BX
	JZ RETURN1
	XOR SI,SI 	

	LOOP1:
		MOV DI,SI
		INC DI
		
		MOV CH,STRING[SI]
		MOV BP,SI
		
		WHILE3:
			CMP STRING[DI],CH
			JG NEXT3
			
			MOV CH,STRING[DI]
			MOV BP,DI
			
			NEXT3:
			
				INC DI
				CMP DI,VALUE
				JL WHILE3				

				MOV DL,STRING[SI]
				MOV STRING[SI],CH
				mov di,bp
				MOV STRING[di],DL
				
				
				CALL ITERATION_PROC

				INC SI
				CMP SI,BX
				JL LOOP1
	
	RETURN1:
			POP DI
			POP SI
			POP CX
			POP BX
			POP AX
			RET
		
MINIMUM_ELEMENT_SORT ENDP
		

