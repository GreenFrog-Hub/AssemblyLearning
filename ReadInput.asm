section .data
	msg db 'Please enter a number: '
	lenMsg equ $-msg
	displayMsg db 'You entered: '
	lenDisplayMsg equ $-displayMsg
	enterNumMsg db 'How many digits: '
	lenEnterNumMsg equ $-enterNumMsg


section .bss
	numEnter resb 3
	num equ numEnter

section .text
	global _start

_start:
	mov edx,lenEnterNumMsg
	mov ecx,enterNumMsg
	mov ebx,1
	mov eax,4
	int 80h

	mov edx,3
	mov ecx,numEnter
	mov ebx,1
	mov eax,3
	int 80h

	mov eax,4
	int 80h

	mov edx,lenMsg
	mov ecx,msg
	mov ebx,1
	mov eax,4
	int 80h

	mov edx,numEnter
	mov ecx,num
	mov ebx,1
	mov eax,3
	int 80h

	mov edx,lenDisplayMsg
	mov ecx,displayMsg
	mov ebx,1
	mov eax,4
	int 80h

	mov edx,numEnter
	mov ecx,num
	mov ebx,1
	mov eax,4
	int 80h

	mov ebx,1
	mov eax,1
	int 80h

