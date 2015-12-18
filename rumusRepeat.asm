rumusRepeat:
			mov ecx,[n]
			;sub ecx, 1
			mov esi,0
			mov edx,[i]
			jmp loopdata
		
		loopdata:
			mov ebx,[bil+esi]
			add eax,ebx
			add esi,4
			inc edx
			loopne loopdata ;loop jika ecx belum nol (dec ECX)
			mov [iloop],edx
			jmp mean
			
		mean:
			mov edx,0
			mov ecx,[n] ;banyaknya data dimasukkan ke reg ecx
			mov ebx,[koma]
			mul ebx
			div ecx ;total dibagi n
			mov edx,0
			div ebx
			mov [hasilmean],eax
			mov [koma_hasilmean],edx
				
		proses_median:
			mov eax,[n]
			mov ecx,2
			mov edx,0
			div ecx
			cmp edx,1
			je jml_ganjil
			jne jml_genap
		
			jml_ganjil:
				mov eax,[n]
				add eax,1
				mov ebx,2
				mul ebx
				mov ecx,4
				mov edx,0
				div ecx
				cmp edx,1
				je ganjil2_gan
				cmp edx,2
				je ganjil2_gan
				cmp edx,3
				je ganjil2_gan
				jne ganjil2_gen
				
				ganjil2_gan:
					sub eax,1
					mov esi,eax
					mov eax,0
					add eax,[bil+esi*4]
					inc esi
					add eax,[bil+esi*4]
					mov edx,0
					mov ecx,2
					mov ebx,[koma]
					mul ebx
					div ecx
					mov edx,0
					div ebx
					mov [median],eax
					mov [koma_median],edx
					;jmp exit
					jmp proses_kuartil1
				
				ganjil2_gen:
					sub eax,1
					mov esi,eax
					mov eax,0
					mov eax,[bil+esi*4]
					mov [median],eax
					mov [koma_median],edx
					;jmp exit
					jmp proses_kuartil1
				
			jml_genap:
				mov eax,[n]
				mov ecx,2
				mov edx,0
				div ecx
				sub eax,1
				mov esi,eax
				mov eax,0
				add eax,[bil+esi*4]
				inc esi
				add eax,[bil+esi*4]
				mov ebx,[koma]
				mul ebx
				div ecx
				mov edx,0
				div ebx
				mov [median],eax
				mov [koma_median],edx
				;jmp exit
				jmp proses_kuartil1
					
		proses_kuartil1:
			mov eax,[n]
			mov ecx,2
			mov edx,0
			div ecx
			cmp edx,1
			je kuartil1_ganjil
			jne kuartil1_genap
				
			kuartil1_ganjil:
				mov eax,[n]
				add eax,1
				mov ecx,1
				mul ecx
				mov edx,0
				mov ebx,4
				div ebx
				cmp edx,1
				je ganjil_gan
				cmp edx,2
				je ganjil_gan
				cmp edx,3
				je ganjil_gan
				jne ganjil_gen
				
				ganjil_gan:
					sub eax,1
					mov esi,eax
					mov eax,0
					add eax,[bil+esi*4]
					inc esi
					add eax,[bil+esi*4]
					mov edx,0
					mov ecx,2
					mov ebx,[koma]
					mul ebx
					div ecx
					mov edx,0
					div ebx
					mov [kuartil1],eax
					mov [koma_kuartil1],edx
					;jmp exit
					jmp proses_kuartil3
				
				ganjil_gen:
					sub eax,1
					mov esi,eax
					mov eax,0
					mov eax,[bil+esi*4]
					mov [kuartil1],eax
					mov [koma_kuartil1],edx
					;jmp exit
					jmp proses_kuartil3
				
			kuartil1_genap:
				mov eax,[n]
				add eax,2
				mov ebx,4
				mov edx,0
				div ebx
				cmp edx,1
				je genap_gan
				cmp edx,2
				je genap_gan
				cmp edx,3
				je genap_gan
				jne genap_gen
				
				genap_gan:
					sub eax,1
					mov esi,eax
					mov eax,0
					add eax,[bil+esi*4]
					inc esi
					add eax,[bil+esi*4]
					mov edx,0
					mov ecx,2
					mov ebx,[koma]
					mul ebx
					div ecx
					mov edx,0
					div ebx
					mov [kuartil1],eax
					mov [koma_kuartil1],edx
					;jmp exit
					jmp proses_kuartil3
				
				genap_gen:
					sub eax,1
					mov esi,eax
					mov eax,0
					mov eax,[bil+esi*4]
					mov [kuartil1],eax
					mov [koma_kuartil1],edx
					;jmp exit
					jmp proses_kuartil3

proses_kuartil3:
			mov eax,[n]
			mov ecx,2
			mov edx,0
			div ecx
			cmp edx,1
			je kuartil3_ganjil
			jne kuartil3_genap
			
				
			kuartil3_ganjil:
				mov eax,[n]
				add eax,1
				mov ecx,3
				mul ecx
				mov ebx,4
				mov edx,0
				div ebx
				cmp edx,1
				je ganjil3_gan
				cmp edx,2
				je ganjil3_gan
				cmp edx,3
				je ganjil3_gan
				jne ganjil3_gen
				
				ganjil3_gan:
					sub eax,1
					mov esi,eax
					mov eax,0
					add eax,[bil+esi*4]
					inc esi
					add eax,[bil+esi*4]
					mov edx,0
					mov ecx,2
					mov ebx,[koma]
					mul ebx
					div ecx
					mov edx,0
					div ebx
					mov [kuartil3],eax
					mov [koma_kuartil3],edx
					jmp end
				
				ganjil3_gen:
					sub eax,1
					mov esi,eax
					mov eax,0
					mov eax,[bil+esi*4]
					mov [kuartil3],eax
					mov [koma_kuartil3],edx
					jmp end
					
				
			kuartil3_genap:
				mov eax,[n]
				mov ecx,3
				mul ecx
				add eax,2
				mov edx,0
				mov ebx,4
				div ebx
				cmp edx,1
				je genap3_gan
				cmp edx,2
				je genap3_gan
				cmp edx,3
				je genap3_gan
				jne genap3_gen
				
				genap3_gan:
					sub eax,1
					mov esi,eax
					mov eax,0
					add eax,[bil+esi*4]
					inc esi
					add eax,[bil+esi*4]
					mov edx,0
					mov ecx,2
					mov ebx,[koma]
					mul ebx
					div ecx
					mov edx,0
					div ebx
					mov [kuartil3],eax
					mov [koma_kuartil3],edx
					jmp end
				
				genap3_gen:
					sub eax,1
					mov esi,eax
					mov eax,0
					mov eax,[bil+esi*4]
					mov [kuartil3],eax
					mov [koma_kuartil3],edx
					jmp end
	
end:
	ret