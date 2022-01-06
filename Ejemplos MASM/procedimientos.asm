TITLE Procedimientos    (procedimientos.asm)

; Descripción del programa: -
; Autor: RamPanic	
; Fecha de creación: 17/04/21
; Revisiones: 0
; Fecha de última modificación: 17/04/21

; Sumar numeros de un array

include c:\masm32\include\Irvine32.inc
includelib c:\masm32\lib\Irvine32.lib
includelib c:\masm32\lib\Kernel32b.lib
includelib c:\masm32\lib\User32b.lib

.data
	
	array DWORD 3,5,10,90,1	

.code

; --------------------------------------------------------
sumar PROC
;
; Calcula la suma de un arreglo de enteros de 32 bits.
; Recibe:   ESI = El desplazamiento del arreglo
; 			ECX = Número de enteros del arreglo
; Devuelve: EAX = Suma de los elementos del arreglo
; --------------------------------------------------------
	
	push esi 						; Guarda el valor de esi
	push ecx 						; Guarda el valor de ecx

	mov eax, 0

	loop1:

		add eax, [esi] 				; Suma a eax el contenido de esi
		add esi, TYPE DWORD 		; Suma a esi el tamaño de un tipo DWORD

		loop loop1 

	pop esi 						; Restaura esi
	pop ecx 						; Restaura ecx

	ret

sumar ENDP

main PROC
	
	mov esi, OFFSET array
	mov ecx, LENGTHOF array
	
	call sumar

	call WriteInt

	exit

main ENDP
END main