nasm -f bin boot1.nasm -o boot1.bin && 
nasm -f bin boot2.nasm -o boot2.bin && 
cat boot1.bin boot2.bin > boot.bin &&
qemu-system-x86_64 -drive format=raw,file=boot.bin
