sort:
    ;inisialisasi nilai k = 0
    mov dword [k],0
    
    ;membuat n-2 untuk looping k < n-2
    mov ecx, [n]
    sub ecx, 2
    mov [nmin2], ecx
    
    ;inisialisasi edi=0 
    mov edi, 0
    
    ;looping k untuk mengecek data setelahnya 
    ;while(K<=n-2)
    loopk:
        ;cek kondisi k<=n-2
        cmp edi, [nmin2]
        jg endSort
        
        ;membuat n-2-k untuk looping i
        mov ecx, [nmin2]
        sub ecx, [k]
        mov [nmin2mink], ecx
        
        ;inisialisasi edi untuk di compare
        mov edi, 0
        
        loopi:
            ;cek kondisi while(I<=n-2 - K)
            cmp edi ,[nmin2mink]
            jg tambahk
            
            ;inisialisasi edi dan esi untuk alamat array pada bil
            mov eax, edi
            mov esi, edi
            add esi, 1
            
            ;ambil nilai bil pada alamat i dan i+1
            mov ebx, [bil+eax*4]
            mov ecx, [bil+esi*4]
            
            ;cek kondisi apakah i>i+1
            cmp ebx, ecx
            jle tambahi
            
            ;tukar jika kondisi i>i+1
            tukar:
                ;menukar data
                mov edx, ebx
                mov ebx, ecx
                mov ecx, edx
                
                ;menaruh nilai yang telah di tukar pada nilai bil
                mov [bil+eax*4], ebx
                mov [bil+esi*4], ecx
		    
		    ;increment nilai i
            tambahi:
                add edi, 1
            
            ;balik ke i    
            jmp loopi
        
        ;increment nilai k
        tambahk:    
            mov edi, [k]
            add edi, 1
            mov [k], edi
        
        ;balik ke k
        jmp loopk
        
endSort:
    ret