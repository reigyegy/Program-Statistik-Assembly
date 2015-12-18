repeat:
    ;pertanyaan untuk mengulang
	push dword playagain            
    call printf                     
    add esp, 4          

	;membaca jawaban
	mov eax, spasi
	mov ebx, 1 
	call printStr
	mov eax, spasi
	mov ebx, 1 
	call printStr
	call scanNum
	mov dword [question], eax

	;mengecek jawaban
    mov al, [question]
    mov bl, 1
    mov dword [repeats], 1
    cmp al, bl
    je main
    
ret