.model small
.stack 100h
.data
    fname db 'first.txt',0
    fhandle dw ?  
    msg db 'enter the data $'
    buffer db 100 dub($)
       ;an array, which in assembly is a sequence of bytes
.code
main proc
    mov ax,@data
    mov ds,ax
    
    ;open an existing file
    mov ah,3dh
    lea dx,fname
    mov al,2
    int 21h
    mov fhandle,ax
    
    lea dx,msg
    mov ah,09h
    int 21h
    mov si,0
    mov cx,0
again:
    mov ah,01h
    int 21h
    cmp al,13
    je exit
    mov buffer[si],al
    inc si
    inc cx
    jmp again
exit:
    mov ah,40h
    mov bx,fhandle
    lea dx,buffer
    ;mov cx (in some error states)
    int 21h    
    
    ;close a file
    mov ah,3eh
    mov bx,fhandle
    int 21h
    
    ;exit
    mov ah,4ch
    int 21h
    main endp ;the end of a procedure
end main
