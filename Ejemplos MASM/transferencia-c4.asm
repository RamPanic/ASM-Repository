TITLE Transferencia de datos       (transferencia.asm)

; Descripción del programa: -
; Autor: RamPanic
; Fecha de creación: 14/03/2021
; Revisiones: 0
; Fecha de última modificación: 14/03/2021

include c:\masm32\include\Irvine32.inc
includelib c:\masm32\lib\Irvine32.lib
includelib c:\masm32\lib\Kernel32b.lib

.data     
	
	; Variables para intercambio

	variable0 BYTE 74h
	variable1 DWORD 015221h
	variable2 DWORD 016001h
	variable3 DWORD ?
	vnegative SWORD -16

	; Arreglos 

	array1 BYTE 10h,20h,30h,40h
	array2 DWORD 10000h,20000h,30000h

.code
main PROC     
	
	; MOV Simple transferencia xd 

	mov eax,variable1
	mov variable2,eax

	; MOVZX Transferencia para enteros sin signo (diferentes tamaños)

	mov al,variable0		; al = 74h
	movzx ax,al			; ax = 0074h
	movzx eax,ax			; eax = 00000074h
	mov variable3,eax		; variable3 = 00000074h

	; MOVSX Transferencia para enteros con signo (diferentes tamaños)

	mov bx,vnegative		; bx = FFF0h
	movsx ebx,bx			; ebx = FFFFFFF0h
	mov variable3,ebx		; variable3 = FFFFFFF0h

	; XCHG Intercambio de datos con variables

	mov eax,variable1		; eax = 015221h
	xchg eax,variable2		; eax = 016001h, variable2 = 015221h
	mov variable1,eax		; variable1 = eax = 016001h 

	; Ahora es turno de los desplazamientos :D

	; Operandos de desplazamiento directo con un Byte

	mov al,array1			; al = 10h
	mov al,[array1+1]		; al = 20h
	mov al,[array1+2]		; al = 30h
	mov al,[array1+3]		; al = 40h

	; Operandos de desplazamiento directo con doble palabra

	mov ebx,array2			; ebx = 10000h
	mov ebx,[array2+4]		; ebx = 20000h
	mov ebx,[array2+8]		; ebx = 30000h

	; Y eso es todo por ahora :P

	exit	
main ENDP     

END main
