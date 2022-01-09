title Ordenamiento Burbuja (bubbleSort.asm)

;.386                                
;.model flat, stdcall                 

option casemap :none

include c:\masm32\include\Irvine32.inc
includelib c:\masm32\lib\Irvine32.lib
includelib c:\masm32\lib\Kernel32b.lib
includelib c:\masm32\lib\User32b.lib

;include    \masm32\include\kernel32.inc  ; Para ExitProcess
;include    \masm32\include\masm32.inc    ; Para StdOut 
;includelib \masm32\lib\kernel32.lib      ; the libraries for above 
;includelib \masm32\lib\masm32.lib

; 1) Para cada elemento en el array elementos con i = 0
;		1.1) Para cada elemento del array elementos con j = i + 1
; 			1.1.1) Elemento actual es más grande que el próximo?
;				1.1.1.1) Se almacena el valor de la actual en una variable temporal
;				1.1.1.2) Se intercambia el valor del elemento actual con el próximo
;				1.1.1.3) Se intercambia el valor del elemento próximo con el de la variable temporal
;			1.1.2) Se incrementa j del array
;		1.2) Se incrementa i del array

.data

	elementos dword 40, 10, 30, 20, 15, 0

; Ejemplo de ordenamiento

;	0-1:   10, 40, 30, 20, 15, 0
;   0-2:   10, 30, 40, 20, 15, 0
;   0-3:   10, 30, 20, 40, 15, 0
;   0-4:   10, 30, 20, 15, 40, 0
;   0-5:   10, 30, 20, 15, 0, 40

;   1-1:   10, 20, 30, 15, 0, 40
;   1-2:   10, 20, 15, 30, 0, 40
;   1-3:   10, 20, 15, 0, 30, 40
;   1-4:   10, 20, 15, 0, 30, 40
;	...

.code

	main proc

; =============================================================

		mov esi, offset elementos				; Asigna dirección de memoria a esi		
		xor ecx, ecx 							; ecx = 0

		; ----------------------

		l1:

		cmp ecx, lengthof elementos	 			; if ecx < len(elementos)
		jl l2									; Si es verdadero salta a l2
		jmp done								; De lo contrario salta a done

		; ----------------------

		l2:

		mov ebx, ecx 							; ebx = ecx
		add ebx, 1 								; ebx = ebx + 1 
		jmp l3									; Salta a l3

		; ----------------------

		l3:

		cmp ebx, lengthof elementos  			; if ebx < len(elementos)
		jl l4									; Si es verdadero salta a l4

		inc ecx 								; ecx++
		jmp l1

		; ----------------------

		l4:

		mov eax, [esi + ecx * 4]				; eax = elementos[ecx]
		cmp eax, [esi + ebx * 4]				; if eax > elementos[ebx]
		jg l5									; Si es verdadero salta a l5
		jmp l6									; Salta a l6

		; ----------------------

		l5:

		xchg [esi + ebx * 4], eax				; elementos[esi + ebx * 4] <=> eax 
		xchg [esi + ecx * 4], eax				; elementos[esi + ecx * 4] <=> eax

		; ----------------------

		l6:
		
		inc ebx									; ebx++
		jmp l3 									; Salta a l3			

		; ----------------------

		done:

		lea esi, elementos
		mov edi, 0
		mov ecx, lengthof elementos		

		recorrer:
		mov eax, [esi + edi * 4]
		call WriteInt
		inc edi
		loop recorrer

		invoke ExitProcess, 0

; =============================================================

	main endp

end main
