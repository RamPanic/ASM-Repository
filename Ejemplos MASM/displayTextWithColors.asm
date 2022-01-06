TITLE DisplayColors    (displayTextWithColors.asm)

; Descripción del programa: -
; Autor: RamPanic	
; Fecha de creación: 20/04/21
; Revisiones: 0
; Fecha de última modificación: 20/04/21

include c:\masm32\include\Irvine32.inc
includelib c:\masm32\lib\Irvine32.lib
includelib c:\masm32\lib\Kernel32b.lib
includelib c:\masm32\lib\User32b.lib

MAX_COLOR = 4
DEFAULT_COLOR = 7

.data
	
	msg db "(masm)-> ", 0

.data?

	string db 100 dup(?)

.code

main PROC

	; Ingresar cadena

	call inputString

	; Activar colores

	call activateColors
	
	; Salir del programa

	invoke ExitProcess, 0

main ENDP

inputString PROC

	mov edx, OFFSET msg
	call WriteString

	mov edx, OFFSET string
	mov ecx, SIZEOF string
	call ReadString

	ret

inputString ENDP

activateColors PROC

	call initValues

	change:

		call changeColor
		call showString
		inc esi
		loop change

	call setColorDefault

	ret

activateColors ENDP

initValues PROC

	mov ecx, MAX_COLOR
	mov esi, 0

initValues ENDP

changeColor PROC
	
	mov eax, esi
	call SetTextColor

	ret

changeColor ENDP

showString PROC

	mov edx, OFFSET string
	call WriteString
	call Crlf

	ret
	
showString ENDP

setColorDefault PROC

	mov eax, DEFAULT_COLOR
	call SetTextColor

	ret

setColorDefault ENDP

END main
