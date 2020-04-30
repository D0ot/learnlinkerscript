sample.bin : sample.asm sample2.asm link1.ld
	nasm -f elf32 -o sample.o sample.asm
	nasm -f elf32 -o sample2.o sample2.asm
	i686-elf-ld -T link1.ld sample.o sample2.o -o sample.elf -M > mem.map
	i686-elf-objcopy -O binary -S sample.elf sample.bin