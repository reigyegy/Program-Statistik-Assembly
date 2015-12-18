rumus:
			;inisialisasi nilai awal hasil
			mov dword [hasil], 0
			
			;looping sebanyak n kali
			mov eax,0
			mov ebx,0
			mov ecx,[n]
			mov esi,0
			jmp loopdata
			
			;hitung mean floating point
		loopdata:
			mov ebx,[bil+esi*4]
			mov dword [data],ebx
			fild dword[data]
			fstp dword[data1]
			fld dword[data1]
			fld dword[hasil]
			fadd
			fstp dword[hasil]
			inc esi
			loopne loopdata ;loop jika ecx belum nol (dec ECX)
			fld dword[hasil]
			fld dword[n1]
			fdiv			;jumlah semua bilangan dibagi jml data
			fstp dword[hasil]
			fld dword [hasil]
			fstp qword [result]
	
			jmp proses_median
		
		;HITUNG MEDIAN	
		proses_median:
			mov eax,[n] ;jml data simpan ke eax
			mov ecx,2
			mov edx,0
			div ecx ;jml data dibagi 2
			cmp edx,1 ;jika modulus==1, jump ke jml_ganjil
			je jml_ganjil
			jne jml_genap;jika modulus!=1, jump ke jml_genap
		
			jml_ganjil:
				mov eax,[n] ;jml data salin ke eax
				add eax,1;Q2=(2(n+1))/4
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
					jmp proses_kuartil1
				
				ganjil2_gen:
					sub eax,1 ;dikurang 1 karena indeks mulai dari 0
					mov esi,eax ;index disalin ke register esi
					mov eax,0
					mov eax,[bil+esi*4] ;ambil data ke-indeks, salin ke eax
					mov [median],eax ;isi eax salin ke variabel median
					mov [koma_median],edx
					jmp proses_kuartil1 ;proses median selesai, lanjut proses kuartil1
			
			;lakukan jika jml data genap	
			jml_genap:
				mov eax,[n] ;Q2=1/2 (Xn/2 + Xn/2+1)
				mov ecx,2
				mov edx,0
				div ecx ;jml data dibagi 2
				sub eax,1 ;dikurang 1 karena indeks mulai dari 0
				mov esi,eax
				mov eax,0
				add eax,[bil+esi*4] ;ambil data Xn/2
				inc esi ;indeks ke-(n/2)+1
				add eax,[bil+esi*4] ;(Xn/2 + Xn/2+1)
				mov ebx,[koma] ;100 salin ke ebx
				mul ebx ;hasil eax * 100
				div ecx ;(eax *100)/2
				mov edx,0
				div ebx ;hasil dibagi 100, (ada sisa bagi edx)
				mov [median],eax
				mov [koma_median],edx
				jmp proses_kuartil1
		
		;HITUNG KUARTIL 1			
		proses_kuartil1:
			mov eax,[n] ;jml data/n-->menentukan jml data ganjil/genap
			mov ecx,2
			mov edx,0
			div ecx
			cmp edx,1
			je kuartil1_ganjil ;jika jumlah data ganjil
			jne kuartil1_genap ;jika jumlah data genap
				
			kuartil1_ganjil:
				mov eax,[n] 
				add eax,1 ;Q1=(1(n+1))/4
				mov ecx,1
				mul ecx
				mov edx,0
				mov ebx,4
				div ebx
				cmp edx,1 ;jika sisa bagi 1, (data ke-x + data ke-x+1)/2
				je ganjil_gan
				cmp edx,2 ;jika sisa bagi 2, (data ke-x + data ke-x+1)/2
				je ganjil_gan
				cmp edx,3 ;jika sisa bagi 3, tidak ada sisa bagi 4 karena pembaginya 4
				je ganjil_gan
				jne ganjil_gen ;jika sisa bagi 0, data langsung ambil
				
				ganjil_gan: ;(data ke-x + data ke-x+1)/2
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
					jmp proses_kuartil3
				
				ganjil_gen:;data langsung diambil
					sub eax,1
					mov esi,eax
					mov eax,0
					mov eax,[bil+esi*4]
					mov [kuartil1],eax
					mov [koma_kuartil1],edx
					jmp proses_kuartil3
			
			;lakukan jika jumlah data genap	
			kuartil1_genap: ;Q1=X(n+2)/4
				mov eax,[n]
				add eax,2
				mov ebx,4
				mov edx,0
				div ebx
				cmp edx,1
				je genap_gan ;jika hasilnya ganjil, (data ke-x + data ke-x+1)/2
				cmp edx,2
				je genap_gan
				cmp edx,3
				je genap_gan
				jne genap_gen ;jika hasilnya genap, data langsung ambil
				
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
					jmp proses_kuartil3
				
				;jika sisa hasil bagi perhitungan indeks genap, maka data langsung diambil
				genap_gen:
					sub eax,1
					mov esi,eax
					mov eax,0
					mov eax,[bil+esi*4]
					mov [kuartil1],eax
					mov [koma_kuartil1],edx
					jmp proses_kuartil3

	;HITUNG KUARTIL 3
	proses_kuartil3:
			mov eax,[n]
			mov ecx,2
			mov edx,0
			div ecx
			cmp edx,1
			je kuartil3_ganjil
			jne kuartil3_genap
			
				
			kuartil3_ganjil: ;Q3=(3(n+1))/4
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
					
				
			kuartil3_genap: ;Q3=X(3n+2)/4
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
