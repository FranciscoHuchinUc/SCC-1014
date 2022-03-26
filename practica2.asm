; TITLE Practica 2
; Despliegue de mensajes en el monitor con ensamblador.
; Francisco Huchin
; 15 Marzo 2022
section .data
	mensaje: db "Practica 2, mensaje en el monitos con ensamblador", 13, 10
	lenMsg equ $ - mensaje

section .text
	global _start

_start:
	mov rax, 1
	mov rdi, 1
	mov rsi, mensaje
	mov rdx, lenMsg
	syscall
	mov rax, 60
	syscall
