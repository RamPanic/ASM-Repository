TITLE crearArchivos    (crearArchivos.asm)

; Descripción del programa: -
; Autor: RamPanic	
; Fecha de creación: 12/04/21
; Revisiones: 0
; Fecha de última modificación: 12/04/21

include c:\masm32\include\Irvine32.inc
includelib c:\masm32\lib\Irvine32.lib
includelib c:\masm32\lib\Kernel32b.lib
includelib c:\masm32\lib\User32b.lib

.data
	
	nombreArchivo BYTE "saludo.txt", 0
	descriptor DWORD ?

	successful BYTE "Archivo creado con éxito",0

.code
main PROC

	mov edx, OFFSET nombreArchivo
	call CreateOutputFile
	cmp eax, INVALID_HANDLE_VALUE
	mov descriptor, eax
	mov edx, OFFSET successful
	call WriteString

	exit

main ENDP
END main