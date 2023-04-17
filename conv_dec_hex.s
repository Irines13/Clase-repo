#-- Ejercicio examen 
#-- Programa que pide al usuario un número entero y lo imprime en hexadecimal
#-- Lo hace en bucle hasta que el usuario introduce un 0, donde se termina el programa.

	#--Importamos los servicios
	.include "serv.s"
	
	#--Inicializamos el segmento de datos
	.data
	
	#--Definimos los mensajes a imprimir por consola.
msg1:	.string "\nIntroduce numero en decimal: "
msg2:	.string "Valor en hexadecimal: "

	#--Inicializamos el segmento de código
	.text
	
bucle:
	#-- Pedimos el numero al usuario y lo guardamos
	#-- Print "Introduce numero en decimal: "
	la a0, msg1
	li a7, PRINT_STRING
	ecall
	
	#-- Leemos el numero entero (t0)
	li a7, READ_INT
	ecall
	mv t0, a0
	#Comparamos si es 0
	beq t0,x0,fin

	
	#-- Print "Valor en hexadecimal: " y luego el  salto de linea
	la a0, msg2
	li a7, PRINT_STRING
	ecall
	
	mv a0, t0
	li a7, PRINT_INT_HEX 
	ecall
	
	li a0, '\n'
	li a7, PRINT_CHAR
	ecall
	#Comparamos si es distinto de cero para que se guarde donde debe.
	bnez a0, dir
	
dir:
	li t2, 0x10010040
	sw a0, 0(t2)
	b bucle
	
fin:
	#-- Terminamos el código apropiadamente
	li a7, EXIT
	ecall #Llamada al sistema