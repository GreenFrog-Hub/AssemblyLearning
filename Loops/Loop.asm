section .text
	global _start

_start:

	mov cl,count
loop:
	mov al,count
	sub al,cl
	mov [msg+eax+eax],al
	add [msg+eax+eax],'0'
	mov [msg+eax+eax+1],0xA
	dec cl
	jnz loop

	mov ecx,msg
	mov edx,count
	add edx,count
	mov ebx,1
	mov eax,4
	int 0x80

	mov eax,1
	int 0x80

section .data
	count equ 20
segment .bss
	msg resb count*2 
