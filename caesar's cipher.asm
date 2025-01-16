%include "/usr/local/share/csc314/asm_io.inc"


segment .data

	arr1	db	"He11o_W0rld!                   ",10,0
	arr2	db	"Have a great summer everyone!  ",10,0
	arr3	db	"abc def ABC DEF 012 345 {|} ~~~",10,0

segment .bss


segment .text
	global  asm_main

asm_main:
	push	ebp
	mov		ebp, esp
	; ********** CODE STARTS HERE **********

	mov ecx, 0
	mov eax, 0
	toploop2:
	mov al, BYTE [arr3 + ecx * 1]
	call print_char
	add ecx, 1
	cmp ecx, 30
	jle toploop2
	call print_nl

	;call read_char

	mov ecx, 0
	mov eax, 0

	toploop1:
	mov al, BYTE [arr3 + ecx * 1]

	cmp al, ' '
	je SkipSub

	;Lowercase Check
	cmp al, 122
	jg PassLower
	cmp al, 97
	jl PassLower 
	sub al, 3
	cmp al, 96
	jg pass1
	add al, 26
	pass1:
	PassLower:
	;End of Lowercase Check

	;Uppercase Check
	cmp al, 90
	jg PassUpper
	cmp al, 65
	jl PassUpper
	sub al, 3
	cmp al, 64
	jg pass2
	add al, 26
	pass2:
	PassUpper:
	;End of Uppercase Check

	;Number Check
	cmp al, 57
	jg PassNumber
	cmp al, 48
	jl PassNumber 
	sub al, 3
	cmp al, 47
	jg pass3
	add al, 10
	pass3:
	PassNumber:
	;End of Number Check

	;Character Check
	cmp al, 126
	jg pass4
	cmp al, 123
	jl pass4
	sub al, 3
	cmp al, 122
	jg pass4
	cmp al, 120
	jl pass4
	add al, 4
	pass4:

	cmp al, 96
	jg pass5
	cmp al, 91
	jl pass5
	sub al, 3
	cmp al, 90
	jg pass5
	cmp al, 88
	jl pass5
	add al, 6
	pass5:

	cmp al, 64
	jg pass6
	cmp al, 58
	jl pass6
	sub al, 3
	cmp al, 57
	jg pass6
	cmp al, 55
	jl pass6
	add al, 7
	pass6:

	cmp al, 47
	jg pass7
	cmp al, 33
	jl pass7
	sub al, 3
	cmp al, 32
	jg pass7
	cmp al, 30
	jl pass7
	add al, 15
	pass7:
	;End of Character Check
	
	SkipSub:
	call print_char
	add ecx, 1
	cmp ecx, 30
	jle toploop1
	call print_nl

	; *********** CODE ENDS HERE ***********
	mov		eax, 0
	mov		esp, ebp
	pop		ebp
	ret
