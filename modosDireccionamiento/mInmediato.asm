; TITLE P1U1A3F Realizar programas que describan los modos de direccionamiento
; Modo de Direccionamiento inmediato
; Cuando el operando origen es un valor constante o expresion constante.

section .data
	dato db '0'

section .text
	GLOBAL _start
	
_start:
	mov eax, 8
	mov ebx, 1
	add eax, ebx
	add eax, 48
	mov [dato], eax
	mov eax, 4
	mov ebx, 1
	mov ecx, dato
	mov edx, 1
	int 0x80
	mov eax, 1
	int 0x80
