; TITLE Practica 3
; Desarrollar programas en ensamblador que realicen operaciones básicas.
; Francisco Huchin
; 15 Marzo 2022
section .data
	numUno db "Dato Uno ", 13, 10
	numDos db "Dato Dos ", 13, 10

	resSuma	 db	13, 10, "Resultado S: "
	resResta db	13, 10, "Resultado R: "
	resMult  db	13, 10, "Resultado M: "
	resDiv   db	13, 10, "Resultado D: "

section .bss
	num1 resb 5
	num2 resb 5
	suma resb 1
	resta resb 1
	multi resb 1
	divi resb 1

section .text
	global _start

_start:

	
	; ______________ ENTRADA DE DATOS _________________
	;	DATO 1
	mov rax, 1 ; Llamada al sistema (sys_write)
	mov rdi, 1 ; stdout
	mov rsi, numUno ; msg pantalla
	mov rdx, 9 ; longitud del mensaje
	syscall

	mov eax, 3 ; Servicio de lectura
	mov ebx, 0  ; Descriptor del teclado
	mov ecx, num1 ; La variable receptora
	mov edx, 9 ; Cantidad de bytes a leer
    int 0x80 ; Llamada al kernel

    ;	DATO 2
    mov rax, 1 ; Llamada al sistema (sys_write)
	mov rdi, 1 ; stdout
	mov rsi, numDos ; msg pantalla
	mov rdx, 9 ; longitud del mensaje
	syscall

	mov eax, 3 ; Servicio de lectura
	mov ebx, 0  ; Descriptor del teclado
	mov ecx, num2 ; La variable receptora
	mov edx, 9 ; Cantidad de bytes a leer
    int 0x80 ; Llamada al kernel

	; __________________ OPERACIONES ______________________
sumar:
	mov rax, 1 ; Llamada al sistema (sys_write)
	mov rdi, 1 ; stdout
	mov rsi, resSuma ; msg pantalla
	mov rdx, 15 ; longitud del mensaje
	syscall

	mov eax, [num1]
	mov ebx, [num2]
	sub eax, '0' ; Conversion de ascii a decimal
   	sub ebx, '0' ; Conversion de ascii a decimal

	add eax, ebx
	add eax, '0' ; Conversion de decimal a ascii
	mov [suma], eax

	mov rax, 1 ; Llamada al sistema (sys_write)
	mov rdi, 1 ; stdout
	mov rsi, suma ; msg pantalla
	mov rdx, 10 ; longitud del mensaje
	syscall

restar:
	mov rax, 1 ; Llamada al sistema (sys_write)
	mov rdi, 1 ; stdout
	mov rsi, resResta ; msg pantalla
	mov rdx, 15 ; longitud del mensaje
	syscall

	mov eax, [num1]
	mov ebx, [num2]
	sub eax, '0' ; Conversion de ascii a decimal
   	sub ebx, '0' ; Conversion de ascii a decimal

	sub eax, ebx
	add eax, '0' ; Conversion de decimal a ascii
	mov [resta], eax

	mov rax, 1 ; Llamada al sistema (sys_write)
	mov rdi, 1 ; stdout
	mov rsi, resta ; msg pantalla
	mov rdx, 10 ; longitud del mensaje
	syscall

multiplicar:
	mov rax, 1 ; Llamada al sistema (sys_write)
	mov rdi, 1 ; stdout
	mov rsi, resMult ; msg pantalla
	mov rdx, 15 ; longitud del mensaje
	syscall

	mov ax, [num1]
	mov bx, [num2]
	sub ax, '0' ; Conversion de ascii a decimal
   	sub bx, '0' ; Conversion de ascii a decimal

	mul bx
	add al, '0' ; Conversion de decimal a ascii
	mov [multi], al

	mov rax, 1 ; Llamada al sistema (sys_write)
	mov rdi, 1 ; stdout
	mov rsi, multi ; msg pantalla
	mov rdx, 10 ; longitud del mensaje
	syscall

dividir:
	mov rax, 1 ; Llamada al sistema (sys_write)
	mov rdi, 1 ; stdout
	mov rsi, resDiv ; msg pantalla
	mov rdx, 15 ; longitud del mensaje
	syscall

	mov al, [num1]
	mov bl, [num2]
	mov dx, 0
	mov ah, 0

	sub al, '0' ; Conversion de ascii a decimal
   	sub bl, '0' ; Conversion de ascii a decimal

	div bl
	add ax, '0' ; Conversion de decimal a ascii
	mov [divi], ax

	mov rax, 1 ; Llamada al sistema (sys_write)
	mov rdi, 1 ; stdout
	mov rsi, divi ; msg pantalla
	mov rdx, 10 ; longitud del mensaje
	syscall

exit:
	mov rax, 60 ; (system("pause"), exit, sys_exit)
	syscall