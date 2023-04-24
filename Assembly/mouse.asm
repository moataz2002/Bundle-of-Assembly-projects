org 100h 
         ;compiler directive

         ;int 01h >> show mouse pointer.
mov ax,01h
int 33h
          ;int 02h >> hide visible mouse pointer.
mov ax,02h
int 33h
          ;int 03h >> get mouse position and status of its buttons
          ;if left button is down: BX=1
          ;if right button is down: BX=2
          ;if both buttons are down: BX=3
          ;CX = x
          ;DX = y

mov ax,03h
int 33h

ret                


