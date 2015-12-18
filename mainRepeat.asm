mainRepeat:
	; Cetak intro
	mov eax, intro4
	mov ebx, 1 ;stdout
	call printStr
	
	;scan jumlah data
	call scanNum
	mov dword [n], eax
	
	mov esi, 0
	
;Input data
baca:
	cmp esi, [n]
	je endBaca 
	
	; Cetak pesan2
	mov eax, msg2
	mov ebx, 1 
	call printStr

	; Scan data
	call scanNum
	mov dword [bil+esi*4], eax
	
	add esi, 1
	jmp baca

endBaca:
	call sort
;mov esi, 0
;		cetak:
;			mov eax, [bil+esi*4]
;			mov ebx, 1
;			call printNum
;			add esi, 1
;			mov edx, [n]
;			cmp esi, edx
;			jle cetak

	call rumusRepeat

	; cetak mean
	mov eax, msg_mean
	mov ebx, 1 ;stdout
	call printStr
	
	mov eax, [hasilmean]
	mov ebx, 1
	call printNum
	
	mov eax, titik
	mov ebx, 1 ;stdout
	call printStr
	
	mov eax, [koma_hasilmean]
	mov ebx, 1
	call printNum
	
	call newline
	
	; cetak kuartil 1
	mov eax, msg_k1
	mov ebx, 1 ;stdout
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
	
	; cetak median
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
	
	; cetak kuartil 3
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
	
	;outro
	mov eax, outro
	mov ebx, 1
	call printStr
	
	mov eax, outro1
	mov ebx, 1
	call printStr
	
	mov eax, outro2
	mov ebx, 1
	call printStr
	
	mov eax, outro3
	mov ebx, 1
	call printStr
	
	jmp repeatMain
ret