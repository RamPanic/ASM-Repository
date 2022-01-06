TITLE Expresiones       (expresiones-aritmeticas.asm)

; Descripción del programa: -
; Autor: RamPanic	
; Fecha de creación: 22/03/21
; Revisiones: 0
; Fecha de última modificación: 22/03/21
 
; Para el libro de Irvine
include c:\masm32\include\Irvine32.inc
includelib c:\masm32\lib\Irvine32.lib
includelib c:\masm32\lib\Kernel32b.lib
includelib c:\masm32\lib\User32b.lib

; (aquí se insertan las definiciones de símbolos)

.data
	
	resultado SDWORD ?
	var1 SDWORD 7530h	; 30000
	var2 SDWORD 28h		; 28
	var3 SDWORD 1388h	; 5000
	var4 SDWORD 64h		; 100 

.code
main PROC     

	; Expresion: resultado = -var1 + (var2 + (var3 - var4))

	mov eax, var1
	neg eax			; -30000

	mov ebx, var3
	sub ebx, var4		; 4900

	mov ecx, var2
	add ecx, ebx		; 4928

	add eax, ecx		; -25072

	mov resultado, eax

	; Pequeña expresion de prueba :D

	exit	; sale al sistema operativo
main ENDP     

; (aquí se insertan los procedimientos adicionales)
END main
