 .MODEL SMALL
 .STACK 100H
 .CODE
 MAIN PROC
	
	MOV AH,1
REPEAT1:
	int 21h

	CMP AL,' '
	JNE REPEAT1

 EXIT:

	MOV AH,4CH
	INT 21H	
	
 MAIN ENDP
	END MAIN
	
	
