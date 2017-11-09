 .MODEL SMALL
 .STACK 100H
 .DATA
	STRING 		DB	80 DUP ( 0 )
	INPUT_MSG	DB	0AH,0DH,'Enter a string: $'
	OUTPUT_MSG	DB	0AH,0DH,'Sorted string is: $'
	
 .CODE
 MAIN PROC
	
	;making the DS to point to data segment

	MOV AX,@DATA
	MOV DS,AX
	MOV ES,AX
	

	LEA DX,INPUT_MSG
	CALL STR_OUTPUT
	
	LEA DI,STRING
	CALL INPUT
	
	LEA DX,OUTPUT_MSG
	CALL STR_OUTPUT

	LEA SI,STRING
	CALL BUBBLE
	
	CALL OUTPUT
	     	
EXIT:
	MOV AH,4CH
	INT 21H	

MAIN ENDP


BUBBLE PROC 		;use si and bx as input and sort the STRING

	PUSH AX
	PUSH BX
	PUSH CX
	PUSH DX
	PUSH SI
	PUSH DI
	
	DEC BX
	JE BUBBLE_END

	MOV DX,SI

	LOOP_BUBBLE:		;loops untill numbers are sorted
		
		MOV SI,DX
		MOV CX,BX
		
		MOV DI,SI
		
	REPLACE_BIG:		;swaps the number for bx-1 times
		
		MOV AL,[DI]
		INC SI
		
		CMP AL,[SI]
		JNG LESs1
	
		CALL SWAP

	LESS1:
		INC DI
		LOOP REPLACE_BIG

		DEC BX
		JNz LOOP_BUBBLE

	BUBBLE_END:

		POP DI
		POP SI
		POP DX
		POP CX
		POP BX
		POP AX
		RET
	

BUBBLE ENDP

LENGTH1 PROC

	PUSH SI
	MOV CX,30H

	LODSB
	JE RETURN1
	
	UP:
		INC CX
		LODSB
		AND AL,0FH
		CMP AL,0
		JNE UP
	RETURN1:
		POP SI
		RET
		

LENGTH1 ENDP


SELECT PROC		;use si and bx as input and sort the STRING

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
		JNE SORT_LOOP
	
	END_SORT:
		POP DX
		POP CX
		POP BX
		POP AX
		POP SI

		RET
SELECT ENDP

SWAP PROC		;use SI and DI as input and swap to numbers

	PUSH AX
	
	MOV AL,[SI]
	XCHG AL,[DI]
	MOV [SI],AL
	
	POP AX
	RET

SWAP ENDP


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
		
		MOV AL,0
		STOSB
		INC BX
	
	END_WHILE1:
		POP DI
		POP AX
		RET	
	
INPUT ENDP


OUTPUT PROC		;use bx and si as input and print the string
	
	PUSH AX
	PUSH BX
	PUSH CX
	PUSH DX
	PUSH SI
	
	CLD
	MOV AH,2
	
	MOV CX,BX
	JCXZ RETURN

	PRINT:
		LODSB
		MOV DL,AL
		INT 21H
		LOOP PRINT
	RETURN:
		POP SI
		POP DX
		POP CX
		POP BX
		POP AX
		RET
OUTPUT ENDP

STR_OUTPUT PROC		;use dx as input and print a string

	PUSH AX
	PUSH DX
	
	MOV AH,9
	INT 21H
	
	POP DX
	POP AX
	RET

STR_OUTPUT ENDP


	END MAIN
	
	

