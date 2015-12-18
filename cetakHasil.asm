;cetak hasil
cetakHasil:
	;pindah baris
	call newline
	
	;cteak data yang telah diurutkan
	mov eax, msgUrut
	mov ebx, 1 
	call printStr
	mov esi, 0
	cetak:
		mov eax, [bil+esi*4]
		mov ebx, 1
		call printNum
		mov eax, spasi
		mov ebx, 1 
		call printStr
		add esi, 1
		mov edx, [n]
		sub edx, 1
		cmp esi, edx
		jle cetak
	
	;pindah 2 baris
	call newline
	call newline
	
	;cetak mean
	push dword [result+4]
	push dword [result]
	push msg_mean
	call printf
	add esp, 12
	
	; cetak hasil kuartil 1
	mov eax, msg_k1
	mov ebx, 1
	call printStr
	mov eax, [kuartil1]
	mov ebx, 1
	call printNum
	mov eax, titik
	mov ebx, 1 ;stdout
	call printStr
	mov eax, [koma_kuartil1]
	mov ebx, 1
	call printNum
	
	call newline
	
	; cetak hasil median
	mov eax, msg_median
	mov ebx, 1 ;stdout
	call printStr
	mov eax, [median]
	mov ebx, 1
	call printNum
	mov eax, titik
	mov ebx, 1 ;stdout
	call printStr
	mov eax, [koma_median]
	mov ebx, 1
	call printNum
	
	call newline
	
	; cetak hasil kuartil 3
	mov eax, msg_k3
	mov ebx, 1 ;stdout
	call printStr
	mov eax, [kuartil3]
	mov ebx, 1
	call printNum
	mov eax, titik
	mov ebx, 1 ;stdout
	call printStr
	mov eax, [koma_kuartil3]
	mov ebx, 1
	call printNum
	
	call newline
ret