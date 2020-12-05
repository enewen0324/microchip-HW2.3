ORG 0
main:
    ACALL reset
    MOV SP,#04FH
    ;;set global variable 10H-2FH
	;; B1 "2"
	MOV 10H,#0FFH
	MOV 11H,#004H
	MOV 12H,#004H
	MOV 13H,#024H
	MOV 14H,#024H
	MOV 15H,#020H
	MOV 16H,#020H
	MOV 17H,#0FFH
	;;B2 "6"
	
	MOV 18H,#0FFH
	MOV 19H,#000H
	MOV 1AH,#000H
	MOV 1BH,#024H
	MOV 1CH,#024H
	MOV 1DH,#004H
	MOV 1EH,#004H
	MOV 1FH,#0FFH
	
	;;B3
	;;B4 "9"
	MOV 28H,#0FFH
	MOV 29H,#020H
	MOV 2AH,#020H
	MOV 2BH,#024H
	MOV 2CH,#024H
	MOV 2DH,#000H
	MOV 2EH,#000H
	MOV 2FH,#0FFH
    ;;
    MOV 30H,#30H
    MOV R0,30H
    INC R0
    MOV @R0,#01H
	INC R0
	MOV @R0,#08H
    INC R0
    MOV @R0,#00H
	INC R0
	MOV @R0,#08H
    MOV 30H,R0
    ACALL sixteen_sixteen
	
	MOV 30H,#30H
    MOV R0,30H
    INC R0
    MOV @R0,#04H
	INC R0
	MOV @R0,#0AH
    INC R0
    MOV @R0,#00H
	INC R0
	MOV @R0,#0AH
    MOV 30H,R0
    ACALL sixteen_sixteen
	
	MOV 30H,#30H
    MOV R0,30H
    INC R0
    MOV @R0,#05H
	INC R0
	MOV @R0,#02H
    INC R0
    MOV @R0,#00H
	INC R0
	MOV @R0,#02H
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
    MOV R0,#20H
    MOV R7,#80H
    ACALL show
    ;; show 4th
	MOV A,R5
    MOV R0,#28H
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
    MOV P0,@R0
    MOV P2,@R0	
	;ANL P3,#0F0H
	;MOV P3,A
	;MOV P3,#00H
	acall short_pause
	INC R0
    ADD A,#10H
    POP 4
    DJNZ R4,show_repeat
	MOV P3,#0FFH
    MOV P0,#0FFH
    MOV P2,#0FFH
	POP 4
	RET
	
;; pause time = 16*255 
short_pause:
    PUSH 0
    PUSH 1
s_pause2:
	MOV R0,#006H
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
