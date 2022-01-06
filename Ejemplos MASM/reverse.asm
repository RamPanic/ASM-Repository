TITLE Reverse    (reverse.asm)

; Descripción del programa: -
; Autor: RamPanic	
; Fecha de creación: 05/04/21
; Revisiones: 0
; Fecha de última modificación: 05/04/21

include c:\masm32\include\Irvine32.inc
includelib c:\masm32\lib\Irvine32.lib
includelib c:\masm32\lib\Kernel32b.lib
includelib c:\masm32\lib\User32b.lib

.data

	origen   BYTE  "Esta es la cadena de origen",0
	destino  BYTE  SIZEOF origen DUP(0)

.code
main PROC

	mov esi, SIZEOF origen
	dec esi
	mov edi, 0
	mov ecx, SIZEOF origen

	l1:
		mov al, [origen + esi]
		mov [destino + edi], al
		inc edi
		dec esi
		loop l1

	; No muestra el string
	; mov edx, OFFSET destino
	; call WriteString

	; Solución temporal
	mov esi, 0
	mov ecx, SIZEOF destino

	l2:
		mov al, [destino + esi]
		call WriteChar
		inc esi
		loop l2

	exit

main ENDP
END main