 .MODEL SMALL
 .STACK 100H
 
 .CODE

 MAIN PROC
	
	mov al,1
	
	CMP AL,1
	JE ODD

	CMP AL,3
	JE ODD
	
	CMP AL,2
	JE EVEN1

	CMP AL,4
	JE EVEN1
	JMP END_CASE
EVEN1:
	MOV DL,'e'
ODD:
	MOV DL,'o'
	JMP DISPLAY

	

DISPLAY:
	MOV AH,2
	INT 21H 

END_CASE:
	MOV AH,4CH
	INT 21H	
	
MAIN ENDP
	END MAIN
	
	

