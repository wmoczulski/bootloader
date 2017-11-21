[bits 16]
[org 0x500]
; available address space: 0x500 - 0x7BFF (~30 KiB)
; also available: 0x7e00 - 0x7ffff (~480 KiB) 


%define NUM_BLOCKS 10 ; temporarily hardcoded


mov ah, 0xe
mov al, 'A'	
mov ah, 0xe
mov al, 'A'	
mov ah, 0xe
mov al, 'A'	
int 0x10


times 512 * NUM_BLOCKS - ($-$$) db 0