inputData:
    ;memberi nilai awal esi = 0 untuk looping hingga esi == n
	mov esi, 0
	
    ;input data sebanyak n kali
    baca:
    	;bandingkan esi dengan n, jika nilainya sama jump ke fungsi endBaca
    	cmp esi, [n]
    	je sort 
    	
    	; Cetak pesan masukkan data ke-i
    	mov eax, msg2
    	mov ebx, 1 
    	call printStr
    	mov edi, esi
    	add edi, 1
    	mov eax, edi
    	mov ebx, 1 
    	call printNum
    	mov eax, msg3
    	mov ebx, 1 
    	call printStr
    
    	; Scan data ke-i
    	call scanNum
    	mov dword [bil+esi*4], eax
    	
    	;increment esi
    	add esi, 1
    	jmp baca
ret