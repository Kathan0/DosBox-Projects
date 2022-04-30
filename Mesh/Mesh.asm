.model tiny
.386
.data
sideCount equ 60
startCord equ 100
count1 db sideCount
.code
.startup
    mov ah, 0h
    mov al, 12h
    int 10h

    mov cx, startCord
    mov dx, startCord
    mov bl, sideCount
x1:
    mov bl, sideCount
    x1a:mov ah, 0ch
    mov al, 1111b
    int 10h

    dec cx
    inc dx
    dec bl
    jnz x1a

    inc cx
    inc dx
    dec byte ptr count1
    jz exit

    mov bl, sideCount
    inc cx
    dec dx

    x1b:mov ah, 0ch
    mov al, 1011b
    int 10h

    inc cx
    dec dx
    dec bl
    jnz x1b

    add dx, 2
    dec byte ptr count1
    jnz x1

exit:
    mov ah,07h
xz: int 21h
    cmp al,'%'
    jnz xz
.exit
end