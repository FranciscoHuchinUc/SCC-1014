; TITLE P1U1A3F Realizar programas que describan los modos de direccionamiento
; Modo de Direccionamiento Indexado
; El operando hace referencia a un dato que se encuentra almacenado en una posición de memoria

section .data
	vector db 1, 2, 4, 5, 6

section .text
	GLOBAL _start

_start:
	mov rax, [vector+rsi]	;vector contiene la dirección base, rsi actúa
							;como registro índice
	add [1234h+r9],rax	;1234h es la dirección base, r9 actúa
						;como registro índice.