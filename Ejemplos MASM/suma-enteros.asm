TITLE Suma con array    (suma.asm)

; Descripción del programa: -
; Autor: RamPanic	
; Fecha de creación: 03/04/21
; Revisiones: 0
; Fecha de última modificación: 03/04/21

include c:\masm32\include\Irvine32.inc
includelib c:\masm32\lib\Irvine32.lib
includelib c:\masm32\lib\Kernel32b.lib
includelib c:\masm32\lib\User32b.lib

.data

	numeros DWORD 10h,20h,30h

.code
main PROC
	
	mov edi, OFFSET numeros			; Guarda la primer dirección de memoria
	mov ecx, LENGTHOF numeros		; Obtiene la cantidad de elementos del array

	mov eax, 0				; Acumulador en 0

	l1:
		add eax, [edi]			; Se incrementa el registro con el contenido de edi
		add edi, TYPE numeros		; Incrementa la dirección de memoria
		loop l1

	call DumpRegs				; Muestra resultados en registros

	exit

main ENDP
END main 
