[bits 16]
[org 0x7c00]

boot:
	mov ah, 0x0e
	mov bh, 0x00
	mov bl, 0x07

	mov al, 'x'
	int 0x10
	mov al, 'D'
	int 0x10


	jmp $


times 510-($-$$) db 0

db 0x55
db 0xaa