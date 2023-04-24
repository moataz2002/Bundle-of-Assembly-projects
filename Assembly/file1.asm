.model small 
             ;tells assembler use small memory model
.stack 100h  
            ;segment directive 
.data   
            ;declaring initialized data or constants
    fname db 'first.txt',0
    fhandle dw ?
.code
main proc    ;label for a sequence of machine instruction
    mov ax,@data ;macro for the default data group
    mov ds,ax
    
    ;create a new file
    mov ah,3ch
    lea dx,fname
    mov cl,0
    int 21h    ;dealing with strings
    mov fhandle,ax
    
    ;close a file
    mov ah,3eh
    mov bx,fhandle
    int 21h
    
    ;exit
    mov ah,4ch
    int 21h
    main endp
end main
