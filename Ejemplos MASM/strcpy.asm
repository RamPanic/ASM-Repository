TITLE Strcpy    (strcpy.asm)

; Descripción del programa: -
; Autor: RamPanic	
; Fecha de creación: 04/04/21
; Revisiones: 0
; Fecha de última modificación: 04/04/21

include c:\masm32\include\Irvine32.inc
includelib c:\masm32\lib\Irvine32.lib
includelib c:\masm32\lib\Kernel32b.lib
includelib c:\masm32\lib\User32b.lib

.data

	string1 BYTE "Prueba Cero de Strcpy",0
	string2 BYTE SIZEOF string1 DUP(0)			; Array de tamaño string1 inicializado en 0

.code
main PROC
	
	mov esi, 0						; Registro con índice 0
	mov ecx, SIZEOF string1					; Mover tamaño de string1 al registro ecx

	L1:
		mov al, [string1 + esi]				; Almacena un carácter en al
		mov [string2 + esi], al 			; Almacena carácter en la posición correspondiente string2
		inc esi						; Incrementar índice
		loop L1 					; Repetir proceso

	mov edx, OFFSET string2					; Obtener primera dirección de memoria

	call WriteString					; Volcar los resultados

	exit

main ENDP
END main 
