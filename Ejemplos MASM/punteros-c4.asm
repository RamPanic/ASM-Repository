TITLE Punteros     (punteros.asm)

; Descripción del programa: -
; Autor: RamPanic	
; Fecha de creación: 03/04/21
; Revisiones: 0
; Fecha de última modificación: 03/04/21

include c:\masm32\include\Irvine32.inc
includelib c:\masm32\lib\Irvine32.lib

; Tipos propios por el usuario

PBYTE TYPEDEF PTR BYTE

.data

	array BYTE 10h, 20h, 30h
	puntero PBYTE array				; PBYTE *puntero = &array;

.code
main PROC
	
	; Usa el puntero para acceder a los datos

	mov esi, puntero
	mov ax, [esi]		; ax = *esi

main ENDP
END main  
