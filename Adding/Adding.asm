section .data
	SYS_EXIT equ 1
	SYS_WRITE equ 4
	SYS_READ equ 3
	STDIN equ 0
	STDOUT equ 1

segment .data
	msg1 db 'Please enter Num 1: '
	lenMsg1 equ $-msg1
	msg2 db 'Please enter Num 2: '
	lenMsg2 equ $-msg2
	msg3 db 'The Result is: '
	lenMsg3 equ $-msg3
	divi db byte 2

segment .bss
	num1 resb 2 
	num2 resb 2
	num3 resb 3

section .text
	global _start

_start:
	;Ask for first num
	;print msg1
	mov eax,SYS_WRITE
	mov ebx,STDOUT
	mov ecx,msg1
	mov edx,lenMsg1
	int 0x80

	;read input
	mov eax,SYS_READ
	mov ebx,STDIN
	mov ecx,num1
	mov edx,2
	int 0x80

	;ask for second num
	;print msg2
	mov eax,SYS_WRITE
	mov ebx,STDOUT
	mov ecx,msg2
	mov edx,lenMsg2
	int 0x80

	;read input
	mov eax,SYS_READ
	mov ebx,STDIN
	mov ecx,num2
	mov edx,2
	int 0x80


	mov ax,[num1]
	sub ax,'0'

;	mov bx,word[num2]
;	sub word bx,'0'
;	xor bx,bx


;	add word ax,bx
;	add ax,'0'

;	mov ax, 0x4
	mov bl, byte 2
	div bl	
;	add ah,'0'
;	add al,'0'
	mov [num3+0],ah
	mov [num3+1],al

;	mov [num3],ax

;	mov [num3],eax
	
	mov [num3+2], byte 10 

	mov eax,SYS_WRITE
	mov ebx,STDOUT
	mov ecx,msg3
	mov edx,lenMsg3
	int 0x80

	mov eax,SYS_WRITE
	mov ebx,STDOUT
	mov ecx,num3
	mov edx,3
	int 0x80


	;exit

	mov eax,SYS_EXIT
	mov ebx,1
	int 0x80
