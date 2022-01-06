TITLE Reverse three    (reverse3.asm)

; Descripción del programa: -
; Autor: RamPanic	
; Fecha de creación: 16/04/21
; Revisiones: 0
; Fecha de última modificación: 16/04/21

; Invertir cadena con entrada usuario

include c:\masm32\include\Irvine32.inc
includelib c:\masm32\lib\Irvine32.lib
includelib c:\masm32\lib\Kernel32b.lib
includelib c:\masm32\lib\User32b.lib

.data
	
	msg BYTE "(MASM)> "
	string BYTE 30 DUP(0)
	sizeCurrent = ($ - string) - 1

.code
main PROC
	
	mov edx, OFFSET msg
	call WriteString

	mov edx, OFFSET string
	mov ecx, sizeCurrent
	call ReadString
	
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

	mov esi, 0
	mov ecx, sizeCurrent

	loop3:
		mov al, string[esi]
		call WriteChar
		inc esi

		loop loop3

	exit

main ENDP
END main