# Definir variables
    .data
msg1:   .asciiz "Ingrese el primer número: "
msg2:   .asciiz "Ingrese el segundo número: "
msg3:   .asciiz "Ingrese el 3 número: "
msg4:   .asciiz "El número mayor es: "
num1:   .word 0
num2:   .word 0
num3:	.word 0

    .text
    .globl main

# Función principal
main:
    li $v0, 4  # Preguntar por el primer número
    la $a0, msg1
    syscall 
    li $v0, 5 # Leer el primer número
    syscall
    sw $v0, num1

   
    li $v0, 4  # Preguntar por el segundo número
    la $a0, msg2
    syscall
    li $v0, 5 # Leer el segundo número
    syscall
    sw $v0, num2
    
    li $v0, 4  # Preguntar por el  3r número
    la $a0, msg3
    syscall
    li $v0, 5  # Leer el 3 número
    syscall
    sw $v0, num3

    # Comparar los números y muestra el mayor
    lw $t0, num1
    lw $t1, num2
    lw $t2, num3
    bgt $t0, $t1, num1_mayor
    move $t0, $t1
    bgt $t0, $t2, num1_mayor
    move $t0, $t2

num1_mayor:
    # Muestra el número mayor
    li $v0, 4
    la $a0, msg4
    syscall
    li $v0, 1
    move $a0, $t0
    syscall

    # Salir del programa
    li $v0, 10
    syscall