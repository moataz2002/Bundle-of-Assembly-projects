include 'emu8086.inc'

ORG    100h
mov AX , 4A10h
Int 2Fh

CALL   print_num      ; print number in AX.

RET                   ; return to operating system.





DEFINE_PRINT_NUM
DEFINE_PRINT_NUM_UNS  ; required for print_num.


END                   ; directive to stop the compiler.     




