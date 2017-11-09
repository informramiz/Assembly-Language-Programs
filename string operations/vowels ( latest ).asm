 .MODEL SMALL
 .STACK 100H
 .DATA
	STRING 		DB	80 DUP ( 0 )
	INPUT_MSG	DB	0AH,0DH,'Enter a string: $'
	UPPER_VOWELS	DB	'AEIOU'
	LOWER_VOWELS	DB	'aeiou'
	OUTPUT_MSG	DB	0AH,0DH,'Number of vowels : $'
	VOWEL_COUNT	DB	30h
	
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


	MOV SI,DI
	CALL READ_VOWELS
	
	MOV AH,2
	MOV DL,VOWEL_COUNT
	INT 21H
	     	
EXIT:
	MOV AH,4CH
	INT 21H	

MAIN ENDp

READ_VOWELS PROC	;use di and bx as input and give output in vowel_count

	PUSH AX
	PUSH BX
	PUSH CX
	PUSH SI
	PUSH DI
	CLD
	
	AGAIN:
		LODSB
		
		LEA DI,UPPER_VOWELS
		MOV CX,5
		REPNE SCASB
		JNE CHECK_LOWER
		
		INC VOWEL_COUNT

	CHECK_LOWER:
		LEA DI,LOWER_VOWELS
		MOV CX,5
		REPNE SCASB
		JNE BACK
		
		INC VOWEL_COUNT
	BACK:
		DEC BX
		JNZ AGAIN
		
		POP DI
		POP SI
		POP CX
		POP BX
		POP AX
		RET

READ_VOWELS ENDP

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
	
	

