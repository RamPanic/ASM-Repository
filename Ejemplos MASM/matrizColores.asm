TITLE Matriz de colores   (matrizColores.asm)

; Descripción del programa: -
; Autor: RamPanic	
; Fecha de creación: 27/04/21
; Revisiones: 0 
; Fecha de última modificación: 28/04/21

; MUESTRA: https://i.imgur.com/KamF0dX.png

include c:\masm32\include\Irvine32.inc
includelib c:\masm32\lib\Irvine32.lib
includelib c:\masm32\lib\Kernel32b.lib
includelib c:\masm32\lib\User32b.lib

.data
	
	GLOBAL_NUMBER EQU 16
	CHARACTER EQU 'X'

.code
main PROC

	call startWithMatrix

	invoke ExitProcess, 0

main ENDP

startWithMatrix PROC

	call Clrscr

	mov ecx, GLOBAL_NUMBER
	mov dh, 0

	call loopWithRows

	ret 

startWithMatrix ENDP

loopWithRows PROC

	loopingRow:

		push ecx
		push dx

		call loopWithColumns

		pop dx
		pop ecx

		inc dh

	loop loopingRow

	ret

loopWithRows ENDP

loopWithColumns PROC

	mov ecx, GLOBAL_NUMBER
	mov dl, 0

	loopingColumn:

		call moveCursor

		inc dl

	loop loopingColumn

	ret

loopWithColumns ENDP

moveCursor PROC

	call Gotoxy

	movzx eax, dh
	call SetTextColor

	mov al, CHARACTER
	call WriteChar

	ret 

moveCursor ENDP

END main
