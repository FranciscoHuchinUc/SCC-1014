; TITLE P1U1A3F Realizar programas que describan los modos de direccionamiento
; Modo de Direccionamiento Directo
; Cuando el operando origen es un valor constante o expresion constante.

section .data
	dato db "Directo"
	lengh equ $ - dato

section .text
	GLOBAL _start

_start:
	mov edx, lengh
	mov eax, dato ; direccionamos directamente nuestra constante a eax
	mov ecx, eax
	mov eax, 4
	mov ebx, 1
	int 0x80
	mov eax, 1
	int 0x80