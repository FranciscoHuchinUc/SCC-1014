; TITLE P1U1A3F Realizar programas que describan los modos de direccionamiento
; Modo de Direccionamiento por Registro
; Cuando ambos operando son un registro

section .data
	dato db 'hola', 13, 10
	lengh equ $ - dato

section .text
	GLOBAL _start

_start:
	mov edx, lengh
	mov eax, dato

	mov ecx, eax ; direccionamos registro

	mov eax, 4
	mov ebx, 1
	int 0x80
	mov eax, 1
	int 0x80
