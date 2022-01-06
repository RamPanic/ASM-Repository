TITLE Busqueda secuencial en array   (busqSecEnArray.asm)

; Descripción del programa: -
; Autor: RamPanic	
; Fecha de creación: 18/05/21
; Revisiones: 0 
; Fecha de última modificación: 18/05/21

include c:\masm32\include\Irvine32.inc
includelib c:\masm32\lib\Irvine32.lib
includelib c:\masm32\lib\Kernel32b.lib
includelib c:\masm32\lib\User32b.lib

.data

	enteros SWORD 0, 3, -10, -4, 100, 0
	msgError1 BYTE "No se encuentra un valor igual a 3", 0

.code
main PROC

	mov ebx, OFFSET enteros
	mov ecx, LENGTHOF enteros

	buscar:
		cmp WORD PTR [ebx], 3
		je encontrado
		add ebx, 2
		loop buscar

	mov edx, OFFSET msgError1
	call WriteString
	invoke ExitProcess, 0	

	encontrado:
		movsx eax, WORD PTR [ebx]
		call WriteInt
		invoke ExitProcess, 0

main ENDP
END main
