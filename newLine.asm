; fungsi newline
newline:
	; Cetak Newline (ascii = 10)
	mov al, 10
	mov ebx, 1 ;stdout
	call printChar
	
	ret