bits 16

section _ENTRY class=CODE

global _x86_Video_WriteCharTeletype
_x86_Video_WriteCharTeletype:
    ; make new call frame
    push bp             ; save old call frame
    mov bp, sp          ; init new call frame

    ; save bx
    push bx

    ; [bp + 0] - old call frame
    ; [bp + 2] - return address (small mem model => 2 bytes)
    ; [bp + 4] - first arg (character)
    ; [bp + 6] - second arg (page)
    ; bytes are converted to words
    mov ah, 0Eh
    mov al, [bp + 4]
    mov bh, [bp + 6]

    int 10h

    ; restore bx
    pop bx
    
    ; restore old clal frame
    mov sp, bp
    pop bp
    ret