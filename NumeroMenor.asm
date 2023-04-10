.data
    prompt1: .asciiz "Ingrese el primer número: "
    prompt2: .asciiz "Ingrese el segundo número: "
    prompt3: .asciiz "Ingrese el tercer número: "
    result: .asciiz "El menor número es: "
    
.text
    main:
        li $v0, 4  # Imprime el primer mensaje de entrada y Lee el primer número
        la $a0, prompt1
        syscall
        li $v0, 5  
        syscall
        move $t0, $v0
        
        li $v0, 4   # Imprime el segundo mensaje de entrada y Lee el segundo número
        la $a0, prompt2
        syscall
        li $v0, 5   
        syscall
        move $t1, $v0
        
        li $v0, 4 # Imprime el tercer mensaje de entrada y  Lee el tercer número
        la $a0, prompt3
        syscall
        li $v0, 5 
        syscall
        move $t2, $v0
        
      
        # Comparar $t0 con $t1 y $t2 para encontrar el menor
        blt $t0, $t1, menor1 # Si $t0 < $t1, saltar a menor1
        move $t0, $t1        # Si no, asignar $t1 a $t0
        menor1:
        blt $t0, $t2, menor2 # Si $t0 < $t2, saltar a menor2
        move $t0, $t2        # Si no, asignar $t2 a $t0
        menor2:              # El número menor estará en $t0t0

 
        # Imprime el resultado
        li $v0, 4
        la $a0, result
        syscall
        
        li $v0, 1
        move $a0, $t0
        syscall
        
        # Termina el programa
        li $v0, 10
        syscall

