TITLE Banderas de estado       (flags.asm)

; Descripción del programa: -
; Autor: RamPanic	
; Fecha de creación: 24/03/21
; Revisiones: 0
; Fecha de última modificación: 24/03/21
 
; Para el libro de Irvine
include c:\masm32\include\Irvine32.inc
includelib c:\masm32\lib\Irvine32.lib
includelib c:\masm32\lib\Kernel32b.lib
includelib c:\masm32\lib\User32b.lib

; (aquí se insertan las definiciones de símbolos)

.data

.code
main PROC     

	; Ejemplo de Zero

	mov al, 10		; al = 10
	sub al, 10		; al = 0	ZF = 1

	; Ejemplo de Sign

	mov cx, 2		; cx = 2
	sub cx, 10		; cx = -8	SF = 1

	; Ejemplo de Carry

	mov eax, 0FFFFh		; eax = 65535
	add eax, 1		; eax = 0000	CF = 1

	; Ejemplo de Overflow

	mov al, +127	 
	add al, 1		; OF = 1 

	exit
main ENDP     

END main
