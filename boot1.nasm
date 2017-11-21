[bits 16]
[org 0x7c00]

%define NUM_BLOCKS 10 ; temporarily hardcoded



boot:
	jmp 0x0:$next_instruction ; making sure cs:ip is 0x0:7c00, not 0x07c0:0x0
next_instruction:


	; loading stage 2 to the memory
	; dl register is already set by bios to proper drive letter


	; read data
	; http://www.ctyme.com/intr/rb-0708.htm
disc_address_packet:
	db 0x10 ; BYTE    size of packet (10h or 18h)
	db 0x00 ; BYTE    reserved (0)
	dw NUM_BLOCKS    ; WORD    number of blocks to transfer (max 007Fh for Phoenix EDD)
	dd 0x500; DWORD   -> transfer buffer
	dq 1    ; QWORD   starting absolute block number

	mov si, disc_address_packet
	mov ah, 0x42
	int 0x13

	jc short error

	jmp 0x500 ; giving controll to second stage



error:
	mov ah, 0xe
	mov al, 'E'	
	int 0x10
	mov al, 'r'	
	int 0x10
	mov al, 'r'	
	int 0x10
	mov al, 'o'	
	int 0x10
	mov al, 'r'	
	int 0x10

times 510-($-$$) db 0

dw 0xaa55
