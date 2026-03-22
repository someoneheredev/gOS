bits 16

section _TEXT class=CODE

;
; void _cdecl x86_div64_32(uint64_t dividend, uint32_t divisor, uint64_t* quotientOut, uint32_t* remainderOut);
;
global _x86_div64_32
_x86_div64_32:
    ; make new call frame
    push bp             ; save old call frame
    mov bp, sp          ; init new call frame

    push bx

        ; divide upper 32 bits
    mov eax, [bp + 8]   ; upper 32 bits of dividend
    mov ecx, [bp + 12]  ; divisor
    xor edx, edx
    div ecx

    mov bx, [bp + 16]
    mov [bx + 4], eax   ; store upper quotient

    mov eax, [bp + 4]   ; lower 32 bits of dividend
                        ; edx still has remainder from above
    div ecx

    mov [bx], eax       ; store lower quotient
    mov bx, [bp + 18]
    mov [bx], edx       ; store remainder    pop bx

    ; restore old clal frame
    mov sp, bp
    pop bp
    ret


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