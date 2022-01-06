TITLE Reverse two    (reverse2.asm)

; Descripción del programa: -
; Autor: RamPanic	
; Fecha de creación: 16/04/21
; Revisiones: 0
; Fecha de última modificación: 16/04/21

; Invertir cadena

include c:\masm32\include\Irvine32.inc
includelib c:\masm32\lib\Irvine32.lib
includelib c:\masm32\lib\Kernel32b.lib
includelib c:\masm32\lib\User32b.lib

.data
	
	string BYTE "Hola, estoy al revés :O", 0
	sizeCurrent = ($ - string) - 1

.code
main PROC
	
	mov ecx, sizeCurrent
	mov esi, 0

	loop1:

		movzx eax, string[esi]
		push eax
		inc esi

		loop loop1

	mov ecx, sizeCurrent
	mov esi, 0

	loop2:

		pop eax
		mov string[esi], al
		inc esi

		loop loop2


	mov edx, OFFSET string
	call WriteString

	exit

main ENDP
END main