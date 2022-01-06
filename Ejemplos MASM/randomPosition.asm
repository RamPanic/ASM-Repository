TITLE Random Position 2.0   (randomPosition.asm)

; Descripción del programa: -
; Autor: RamPanic	
; Fecha de creación: 24/04/21
; Revisiones: 0 
; Fecha de última modificación: 27/04/21

include c:\masm32\include\Irvine32.inc
includelib c:\masm32\lib\Irvine32.lib
includelib c:\masm32\lib\Kernel32b.lib
includelib c:\masm32\lib\User32b.lib

MAX_VALUE = 255
CONSTANT_CHAR = 'M'

.data?

	rand1 DWORD ?
	rand2 DWORD ?

.code
main PROC

	mov esi, 0
	mov ecx, 100

	l1:

		call Clrscr

		call Randomize
		mov eax, MAX_VALUE
		call RandomRange
		mov rand1, eax

		call Randomize
		mov eax, MAX_VALUE
		call RandomRange
		mov rand2, eax

		mov dh, BYTE PTR [rand1]	; 
		mov dl, BYTE PTR [rand2]
		call Gotoxy

		mov al, CONSTANT_CHAR
		call WriteChar

		mov eax, 100
		call Delay

		inc esi

		loop l1

	invoke ExitProcess, 0

main ENDP
END main
