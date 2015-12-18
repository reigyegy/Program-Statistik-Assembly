; @author   : Reigy Karrina & Alin Nur Alifah
; @nim      : G64154016 - G64154068
; @project  : Menghitung mean, kuartil1, median dan kuartil 3 dari data acak

;fungsi untuk intro
%include "intro.asm"

;fungsi untuk membaca nilai n atau banyaknya data
%include "inputN.asm"

;fungsi untuk membaca data
%include "inputData.asm"

;fungsi untuk mengurutkan data yang dimasukkan
%include "sort.asm"

;fungsi untuk menghitung mean, kuartil1, median dan kuartil3
%include "rumus.asm"

;fungsi untuk mencetak hasil
%include "cetakHasil.asm"

;fungsi untuk mengulang program
%include "repeat.asm"

;fungsi outro
%include "penutup.asm"

;fungsi untuk mencetak baris baru
%include "newLine.asm"

;fungsi untuk mencetak string
%include "printStr.asm"

;fungsi untuk membaca masukkan berupa number
%include "scanNum.asm"

;fungsi untuk mencetak number
%include "printNum.asm"

;fungsi untuk mencetak karakter
%include "printChar.asm"

%include "scanStr.asm"
%include "cmpStr.asm"
%include "cpyStr.asm"

;menggunakan fungsi dari bahasa c
extern printf
extern scanf

section .data
	;untuk clear screen
    clr_scr     	db      27, '[H', 27, '[2J', 0
    len_clr_scr 	equ     $-clr_scr

	intro4 			db 		"*************************************************** ",10
	welcome 		db 		"▓ ╔══╣ ╔═╦═╗ ╔══╗ ╔═╦═╗ ╦ ╔══╗ ╔═╦═╗ ╦ ╦___ ╔══╗  ▓ ",10 ;10 = \n (newline)
	intro1 			db 		"  ╚══╗   ║   ╠══╣   ║   ║ ╚══╗   ║   ║ ║ ║  ╠══╣    ",10 ;10 = \n (newline)
	intro2 			db 		"▓ ╠══╝   ╩   ╩  ╩   ╩   ╩ ╚══╝   ╩   ╩ ╩ ╩  ╩  ╩  ▓ ",10 ;10 = \n (newline)
	intro3			db		"─────────────────────────────────────────────────── ",10
	intro6 			db 		"▓              Program Menghitung                 ▓ ",10 ;10 = \n (newline)
	intro5			db		"     Mean, Kuartil 1, Median, dan Kuartil 3         ",10
	intro9 			db 		"▓*************************************************▓ ",10,10,0
	intro4_len 		equ 	$-intro4

	;untuk intro
;	intro4 			db 		"********************************************",10
;	intro4_len 		equ 	$-intro4
;	welcome 		db 		"                SELAMAT DATANG",10 ;10 = \n (newline)
;	welcome_len 	equ 	$-welcome
;	intro1 			db 		"              Program Menghitung",10 ;10 = \n (newline)
;	intro1_len 		equ 	$-intro1
;	intro2 			db 		"   Mean, Kuartil 1, Median, dan Kuartil 3",10 ;10 = \n (newline)
;	intro2_len 		equ 	$-intro2
;	intro3 			db 		"********************************************",10,0
;	intro3_len 		equ 	$-intro3
	
	;untuk jumlah data
	input 			db 		"  Masukkan jumlah data : ",0
	input_len 		equ 	$-input
	
	;untuk data ke-i
	msg2			db		"  Masukkan data ke-",0
	msg3			db		" : ",0,10
	
	;untuk data yang telah diurutkan
	msgUrut			db 		"  Data urut : ",0
	spasi 			db 		" ",0
	
	;untuk hasi mean, kuartil1, median dan kuartil3
	msg_mean 		db 		"  Mean      = %.2f",10, 0
	msg_k1 			db 		"  Kuartil 1 = ",0
	msg_median 		db 		"  Median    = ",0
	msg_k3 			db 		"  Kuartil 3 = ",0
	
	;pertanyaan untuk mengulang program
	playagain   	db  	"  Ingin menghitung ulang ?       (ketik 1 jika ya)", 0xa, 0
	;inisialisasi jawaban
	repeats        	db  	0
	
	;untuk penutup
	outro			db 		"****************************************************** ",10,0
	outro1			db 		"▓                                    Terima Kasih ▓ ",10,0
	outro2			db 		"                            @2015 by Reigy & Alin   ",10,0
	outro3			db 		"▓*************************************************▓ ",10,0
	outro_len 		equ 	$-outro
	
	;untuk floating
	titik 			db 		".",0
	koma 			dd 		100
	
	;inisialisasi max data
	jml_data_max 	equ 	1000
	
section .bss
	;variabel untuk looping pada sort
	k 					resd 1
	j 					resd 1
	nmin2 				resd 1
	nmin2mink 			resd 1
	
	;variabel untuk data dan hasil
	n 					resd 1
	bil 				resd 1000
	jum 				resd 1
	hasil 				resd 1
	x 					resd 1
	n1 					resd 1
	data1 				resd 1
	data 				resd 1
	hasilmean 			resd 1
	hasilmean1 			resd 1
	koma_hasilmean 		resd 1
	kuartil1 			resd 1
	koma_kuartil1 		resd 1
	median 				resd 1
	koma_median 		resd 1
	kuartil3 			resd 1
	koma_kuartil3 		resd 1
	result 				resq 1
	option 				resd 1
	
	;variabel untuk menyimpan jawaban playagain
    question    		resb 1
    yainput 			resb 200

section .text
	global main

main:
	;menghapus layar
	mov eax, 4
    mov ebx, 1
    mov ecx, clr_scr
    mov edx, len_clr_scr
	int 0x80
    
	;cetak intro
	push intro4
	call printf
	add esp, 4
	
	;input N
	call inputN
	
	;input data
	call inputData

	;operasikan data
	call rumus
	
	;cetak hasil
	call cetakHasil

	;mengulang atau tidak
	call repeat
	
	;penutup
	mov eax, 4		
	mov ebx, 1			
	mov ecx, outro		
	mov edx, outro_len
	int 0x80
	
exit:
	mov eax,1
	mov ebx,0
	int 0x80
