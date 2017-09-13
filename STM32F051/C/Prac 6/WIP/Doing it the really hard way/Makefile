main.elf: main.o startup.o
	arm-none-eabi-ld -T stm32f051.ld -o main.elf main.o startup.o
	
main.s: main.c
	arm-none-eabi-gcc -g -mcpu=cortex-m0 -mthumb -S -o main.s main.c
	
main.o: main.s
	arm-none-eabi-as -g -mcpu=cortex-m0 -mthumb -o main.o main.s
	
startup.o: startup.s
	arm-none-eabi-as -g -mcpu=cortex-m0 -mthumb -o startup.o startup.s
	
