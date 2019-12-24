# Se incuye los comandos para compilar el archivo main.c
# Compilador que se utiliza para este ejemplo
#CC=msp430-gcc
# Banderas para la compilacion 
#CFLAGS=-Wall -g -mmcu=msp430g2553
# Archivo objeto
#OBJS=main.o

# Reglas de compilacion 
#all: $(OBJS)
#	$(CC) $(CFLAGS) -o main.elf $(OBJS)

# Eliminar todos los archivos creados por la compilacion
#clean:
#	rm -fr main.elf $(OBJS)

### ----------------------------------------------------------------###
### ----------------------------------------------------------------###
OBJECTS=main.o

GCC_DIR =  /opt/ti/msp430-gcc/bin
SUPPORT_FILE_DIRECTORY = /opt/ti/msp430-gcc/include

DEVICE  = MSP430G2553
CC      = $(GCC_DIR)/msp430-elf-gcc
GDB     = $(GCC_DIR)/msp430-elf-gdb

CFLAGS = -I $(SUPPORT_FILE_DIRECTORY) -mmcu=$(DEVICE) -Og -Wall -g
LFLAGS = -L $(SUPPORT_FILE_DIRECTORY) -Wl,-Map,"blink.map" -Wl,--gc-sections 

all: ${OBJECTS}
	$(CC) $(CFLAGS) $(LFLAGS) $? -o $(DEVICE).out

debug: all
	$(GDB) $(DEVICE).out

clean:
	rm -fr *.o *.out *.map $(OBJS)
