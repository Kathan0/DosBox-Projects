.Model tiny
.386
.data
    initial1 equ 10
    horiz1 db ?
    vert1 db ?
    count1 db ?
    vertStore1 db ?
    horizStore1 db ?
.code
.startup
    mov ah, 0
    mov al, 12h
    int 10h

    mov cx, 360
    mov dx, 100

    mov horiz1, initial1
    mov vert1, 0
    mov count1, initial1
x1: mov ah, vert1
    mov vertStore1, ah
    mov ah, horiz1
    mov horizStore1, ah
    mov bl, 0
    x1a: cmp bl, horiz1
         jz x1az
         mov ah, 0ch
         mov al, 1111b
         int 10h
         dec cx
         dec horiz1
         jnz x1a
        x1az:
    x1b: cmp bl, vert1
         jz x1bz
         mov ah, 0ch
         mov al, 1111b
         int 10h
         inc dx
         dec vert1
         jnz x1b
    x1bz:
    mov ah, horizStore1
    mov horiz1, ah
    mov ah, vertStore1
    mov vert1, ah
    dec horiz1
    inc vert1
    inc dx
    dec cx
    dec byte ptr count1
    jnz x1

    mov horiz1, 0 ;;-------->COpy
    mov vert1, initial1
    mov count1, initial1
    inc cx
    dec dx

x2: mov ah, vert1
    mov vertStore1, ah
    mov ah, horiz1
    mov horizStore1, ah
    mov bl, 0

    x2b: cmp bl, vert1
         jz x2bz
         mov ah, 0ch
         mov al, 1111b
         int 10h
         inc dx
         dec vert1
         jnz x2b
    x2bz:
    x2a: cmp bl, horiz1
         jz x2az
         mov ah, 0ch
         mov al, 1111b
         int 10h
         inc cx
         dec horiz1
         jnz x2a
        x2az:

    mov ah, horizStore1
    mov horiz1, ah
    mov ah, vertStore1
    mov vert1, ah
    inc horiz1
    dec vert1
    inc dx
    inc cx
    dec byte ptr count1
    jnz x2

    mov horiz1, initial1 ;;-------->COpy
    mov vert1, 0
    mov count1, initial1
    dec cx
    dec dx

x3: mov ah, vert1
    mov vertStore1, ah
    mov ah, horiz1
    mov horizStore1, ah
    mov bl, 0

    x3b: cmp bl, horiz1
         jz x3bz
         mov ah, 0ch
         mov al, 1111b
         int 10h
         inc cx
         dec horiz1
         jnz x3b
    x3bz:
    x3a: cmp bl, vert1
         jz x3az
         mov ah, 0ch
         mov al, 1111b
         int 10h
         dec dx
         dec vert1
         jnz x3a
        x3az:

    mov ah, horizStore1
    mov horiz1, ah
    mov ah, vertStore1
    mov vert1, ah
    dec horiz1
    inc vert1
    dec dx
    inc cx
    dec byte ptr count1
    jnz x3

    mov ah,07h

    mov horiz1, 0 ;;-------->COpy
    mov vert1, initial1
    mov count1, initial1
    dec cx
    inc dx

x4: mov ah, vert1
    mov vertStore1, ah
    mov ah, horiz1
    mov horizStore1, ah
    mov bl, 0

    x4b: cmp bl, vert1
         jz x4bz
         mov ah, 0ch
         mov al, 1111b
         int 10h
         dec dx
         dec vert1
         jnz x4b
    x4bz:
    x4a: cmp bl, horiz1
         jz x4az
         mov ah, 0ch
         mov al, 1111b
         int 10h
         dec cx
         dec horiz1
         jnz x4a
        x4az:

    mov ah, horizStore1
    mov horiz1, ah
    mov ah, vertStore1
    mov vert1, ah
    inc horiz1
    dec vert1
    dec dx
    dec cx
    dec byte ptr count1
    jnz x4

    mov ah,07h
xz: int 21h
    cmp al,'%'
    jnz xz
.exit
END

