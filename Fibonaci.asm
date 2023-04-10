# Cargar los primeros dos términos de la serie Fibonacci
li $t0, 0   # F0 = 0
li $t1, 1   # F1 = 1

# Imprimir los dos primeros términos
li $v0, 1    # Llamada al sistema para imprimir entero
move $a0, $t0 # Cargar el valor de F0 en $a0
syscall      # Imprimir F0
li $v0, 4    # Llamada al sistema para imprimir una cadena
.data
comma: .asciiz ", "  # definir la cadena ", "

.text
# cargar la cadena ", " en $a0
la $a0, comma

syscall      # Imprimir ", "
li $v0, 1    # Llamada al sistema para imprimir entero
move $a0, $t1 # Cargar el valor de F1 en $a0
syscall      # Imprimir F1
li $v0, 4    # Llamada al sistema para imprimir una cadena
.data
newline: .asciiz "\n"  # definir la cadena "\n"

.text
# cargar la cadena "\n" en $a0
la $a0, newline

syscall      # Imprimir "\n"

# Calcular los siguientes 8 términos de la serie Fibonacci
li $t2, 8     # Contador de bucle para el número de términos a calcular
loop:
  add $t2, $t2, -1  # Decrementar el contador de bucle
  beqz $t2, endloop # Saltar al final del bucle si el contador es cero

  add $t3, $t0, $t1 # Calcular el siguiente término de la serie
  li $v0, 1         # Llamada al sistema para imprimir entero
  move $a0, $t3      # Cargar el valor del siguiente término en $a0
  syscall           # Imprimir el siguiente término
  li $v0, 4         # Llamada al sistema para imprimir una cadena
  la $a0, comma     # Cargar la cadena ", " en $a0
  syscall           # Imprimir ", "

  # Actualizar los valores de F0 y F1 para el siguiente cálculo
  move $t0, $t1
  move $t1, $t3
  j loop

endloop:
li $v0, 4         # Llamada al sistema para imprimir una cadena
la $a0, newline   # Cargar la cadena "\n" en $a0
syscall           # Imprimir "\n"

