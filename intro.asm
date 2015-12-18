intro:
	;menghapus layar
	mov eax, 4
    mov ebx, 1
    mov ecx, clr_scr
    mov edx, len_clr_scr
    int 0x80
    
	;cetak intro
	push intro4
	call printf
	add esp, 8
ret