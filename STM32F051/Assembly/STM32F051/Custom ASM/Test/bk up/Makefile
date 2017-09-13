main.elf: main.o libs.o
    arm-none-eabi-ld -Ttext=0x08000000 -o main.elf main.o libs.o
main.o: main.s
    arm-none-eabi-as -g -mcpu=cortex-m0 -mthumb -o main.o main.s
libs.o: libs.s
    arm-none-eabi-as -g -mcpu=cortex-m0 -mthumb -o libs.o libs.s