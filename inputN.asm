inputN:
    ;meminta inputan jumlah data

	mov eax, input
	mov ebx, 1 ;stdout
	call printStr
	
	;scan jumlah data, dimasukkan ke variabel n
	call scanNum
	mov dword [n], eax
	
	;mengubah inputan menjadi bilangan float
	fild dword [n]
	fstp dword [n1]
endN:
	ret