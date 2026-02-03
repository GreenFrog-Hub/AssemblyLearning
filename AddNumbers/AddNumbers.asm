section .text
	global _start

_start:
	xor eax,eax
	mov ecx,lenNum1
addloop:
	mov al,[num1+ecx-1]
	add al,ah
	add al,[num2+ecx-1]
	aaa
	lahf
	or al, 30h
	mov [result+ecx],al
	and ah, 0b00010000
	shr ah,4
	
	dec ecx
	jnz addloop
	
	mov al,0b0
	add al,ah
	aaa
	or al,30h
	mov [result],al	


	mov edx,7
	mov ecx,result
	mov ebx,1
	mov eax,4
	int 0x80

	mov edx,1
	mov ecx,newLine
	mov ebx,1
	mov eax,4
	int 0x80

	
	mov eax,1
	int 0x80




section .data
	num1 db '12345'
	lenNum1 equ $-num1
	num2 db '23456'
	lenNum2 equ $-num2
	newLine db 0xA

segment .bss
	result resb 6
