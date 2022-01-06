TITLE E/S de Enteros    (p-b1.asm)

; Descripción del programa: -
; Autor: RamPanic	
; Fecha de creación: 14/04/21
; Revisiones: 0
; Fecha de última modificación: 14/04/21

; Prueba de varios procedimientos

; Resultado: https://i.imgur.com/rLfYWyc.png

include c:\masm32\include\Irvine32.inc
includelib c:\masm32\lib\Irvine32.lib
includelib c:\masm32\lib\Kernel32b.lib
includelib c:\masm32\lib\User32b.lib

.data

	array DWORD 1000h, 2000h, 3000h
	message BYTE "[+] Ingrese un entero sin signo: ", 0
	valDword DWORD ?

.code
main PROC
	
	; Establece color de texto y fondo

	mov eax, yellow + (blue * 16)
	call setTextColor
	call Clrscr

	; Mostrar arreglo usando DumpMem

	mov esi, OFFSET array
	mov ecx, LENGTHOF array
	mov ebx, TYPE array
	call DumpMem
	call Crlf 

	; Introducir un entero decimal sin signo

	mov edx, OFFSET message
	call WriteString
	call ReadInt
	mov valDword, eax

	; Mostrar el numero en Dec, Hex y Bin

	call Crlf
	call WriteInt
	call Crlf
	call WriteHex
	call Crlf
	call WriteBin
	call Crlf
	call WaitMsg

	; Devuelve los colores por default

	mov eax, lightGray + (black * 16)
	call setTextColor
	call Clrscr

	exit

main ENDP
END main
