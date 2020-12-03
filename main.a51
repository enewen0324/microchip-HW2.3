ORG 0
main:
    ACALL reset
    MOV SP,#04FH
    ;;set global variable 10H-2FH
	;; B1
	MOV 10H,#0FFH
	MOV 11H,#0F0H
	MOV 12H,#00FH
	MOV 13H,#000H
	MOV 14H,#0AAH
	MOV 15H,#055H
	MOV 16H,#0A5H
	MOV 17H,#05AH
	;;B2
	MOV 18H,#0FFH
	MOV 19H,#0F0H
	MOV 1AH,#00FH
	MOV 1BH,#000H
	MOV 1CH,#0AAH
	MOV 1DH,#055H
	MOV 1EH,#0A5H
	MOV 1FH,#05AH
	;;B3
	;;B4
    ;;
    MOV 30H,#30H
    MOV R0,30H
    INC R0
    MOV @R0,#01H
	INC R0
	MOV @R0,#02H
    INC R0
    MOV @R0,#05H
	INC R0
	MOV @R0,#00H
    MOV 30H,R0
    ACALL sixteen_sixteen
	
    LJMP endl

sixteen_sixteen:
	PUSH 0
	PUSH 1
	PUSH 2
	PUSH 3
    PUSH 4
    PUSH 5
    PUSH 6
    PUSH 7
    MOV R0,30H
    MOV 5,@R0
	DEC R0
	MOV 4,@R0
	DEC R0
	MOV 3,@R0
	DEC R0
	MOV 2,@R0
	DEC R0
    MOV 30H,R0
    MOV R1,#080H
repeat:
    PUSH 1
    ;; show 1st
    MOV A,R2
    MOV R0,#10H
    MOV R7,#00H
    ACALL show
    ;; show 2nd
    MOV A,R3
    MOV R0,#18H
    MOV R7,#00H
    ACALL show
    ;; show 3rd
	MOV A,R4
    MOV R0,#10H
    MOV R7,#80H
    ACALL show
    ;; show 4th
	MOV A,R5
    MOV R0,#18H
    MOV R7,#80H
    ACALL show

    
    POP 1
    DJNZ R1,repeat
    POP 7
    POP 6
    POP 5
    POP 4
    POP 3
    POP 2
    POP 1
    POP 0
    RET

show: 
    PUSH 4

    MOV R4,#08H
    ADD A,R7
show_repeat:
    PUSH 4
    MOV P3,A
    MOV P2,@R0
    MOV P1,@R0
	acall short_pause
	INC R0
    ADD A,#10H
    POP 4
    DJNZ R4,show_repeat
	POP 4
	RET
	
;; pause time = 16*255 
short_pause:
    PUSH 0
    PUSH 1
s_pause2:
	MOV R0,#003H
    MOV R1,#0FFH
s_pause:
    PUSH 1
    DJNZ R1, $
    POP 1
    DJNZ R0 , s_pause
    POP 1
    POP 0
    RET
reset:  
    CLR A
    CLR c
    MOV R0,#00H
    MOV R1,#00H
    MOV R2,#00H
    MOV R3,#00H
    MOV R4,#00H
    MOV R5,#00H
    MOV R6,#00H
    MOV R7,#00H
    RET
endl:
    END