include(`commons.m4')_insert

value   = -0x10
z       = -0xC
y       = -8
x       = -4

; _EN(`allocate place in local stack for 4 values of int type')_RU(`выделить место в локальном стеке для 4 переменных типа int')
SUB     SP, SP, #0x10
MOV     R9, 0xFC2 ; a
ADD     R9, PC
LDR.W   R9, [R9]
STR     R0, [SP,#0x10+x]
STR     R1, [SP,#0x10+y]
STR     R2, [SP,#0x10+z]
STR     R3, [SP,#0x10+value]
LDR     R0, [SP,#0x10+value]
LDR     R1, [SP,#0x10+z]
LDR     R2, [SP,#0x10+y]
LDR     R3, [SP,#0x10+x]
MOV     R12, 2400
MUL.W   R3, R3, R12
ADD     R3, R9
MOV     R9, 120
MUL.W   R2, R2, R9
ADD     R2, R3
LSLS    R1, R1, #2 ; R1=R1<<2
ADD     R1, R2
STR     R0, [R1]   ; R1 - _EN(`address of array element')_RU(`адрес элемента массива')
; _EN(``deallocate place in local stack, allocated for 4 values of int type'')_RU(``освободить место в локальном стеке, выделенное для 4 переменных'')
ADD     SP, SP, #0x10
BX      LR
