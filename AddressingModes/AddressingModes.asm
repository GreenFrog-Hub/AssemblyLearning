section .text
	global _start

_start:

;	mov ebx,[TABLE]
;	mov [ebx],110
;	add ebx,2
;	mov [ebx],5

;	mov ax, [wordvar]
;	add [es:wordvar],10


	mov edx,lenMsg
	mov ecx,msg
	mov ebx,1
	mov eax,4
	int 0x80

	mov al,[table+2]
	add al,2
	mov [table+2],al
	mov al,'0'
	mov al,[table+2]
	mov [msg],al
	
	mov edx,lenMsg
	mov ecx,msg
	mov ebx,1
	mov eax,4
	int 0x80

	mov ebx,1
	mov eax,1
	int 0x80

section .data
	wordvar db '80'
	table TIMES 5 db '0'
	msg db '10 Test '
	lenMsg equ $-msg
