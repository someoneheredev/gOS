bits 16

section _ENTRY class=Code

extern _cstart_
global entry

entry:
	cli
	mov ax, ds
	mov ss, ax
	mov sp, 0
	mov bp, sp
	sti

	; expect boot drive in dl, send it as arguemnt to start
	xor dh, dh
	push dx
	call_cstart_

	cli
	hlt
