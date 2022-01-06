TITLE Fibonacci    (fibonacci.asm)

; Descripción del programa: -
; Autor: RamPanic	
; Fecha de creación: 05/04/21
; Revisiones: 0
; Fecha de última modificación: 05/04/21

include c:\masm32\include\Irvine32.inc
includelib c:\masm32\lib\Irvine32.lib
includelib c:\masm32\lib\Kernel32b.lib
includelib c:\masm32\lib\User32b.lib

; Cantidad de números
MAX_NUM = 12

.data

	num1 DWORD 00h
	num2 DWORD 01h
	temp DWORD ?

.code
main PROC

	mov ecx, MAX_NUM 

	l1:

		mov eax, 0

		; temp = a + b
		add eax, num1		
		add eax, num2
		mov temp, eax

		; a = b
		mov eax, num2
		mov num1, eax

		; b = temp
		mov eax, temp
		mov num2, eax

		; Volcar resultados
		call DumpRegs

		loop l1

	exit

main ENDP
END main