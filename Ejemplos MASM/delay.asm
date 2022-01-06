TITLE delay    (delay.asm)

; Descripción del programa: -
; Autor: RamPanic	
; Fecha de creación: 12/04/21
; Revisiones: 0
; Fecha de última modificación: 12/04/21

include c:\masm32\include\Irvine32.inc
includelib c:\masm32\lib\Irvine32.lib
includelib c:\masm32\lib\Kernel32b.lib
includelib c:\masm32\lib\User32b.lib

TIEMPO = 3000							; 3 segundos

.data

.code
main PROC

	mov eax, TIEMPO
	call Delay	

	exit

main ENDP
END main