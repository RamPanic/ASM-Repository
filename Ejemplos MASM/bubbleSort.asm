TITLE Bubble Sort   (bubbleSort.asm)

; Descripción del programa: -
; Autor: RamPanic	
; Fecha de creación: 21/05/21
; Revisiones: 4
; Fecha de última modificación: 26/05/21

include c:\masm32\include\Irvine32.inc
includelib c:\masm32\lib\Irvine32.lib
includelib c:\masm32\lib\Kernel32b.lib
includelib c:\masm32\lib\User32b.lib

.data
	
	array BYTE 04h, 64h, 09h, 32h

.code

main PROC

	call bubbleSort

	invoke ExitProcess, 0

main ENDP

bubbleSort PROC

	pushad

	mov esi, 0								; i = 0
	mov edi, 0								; j = 0

	mov ecx, LENGTHOF array					; n = 4

l1:
	; 1er for
	cmp esi, ecx 							; if i < n 
	jl l2
	popad
	ret

l2:
	; 2do for
	push ecx
	sub ecx, esi 							; n - i
	cmp edi, ecx 							; if j < n
	pop ecx
	jl l3
	je l4

l3:
	push edi
	add edi, 1
	mov bl, array[edi]
	pop edi
	cmp bl, array[edi]
	jg swap
	jmp l5

l4:
	mov edi, 0
	inc esi
	jmp l1

l5:
	inc edi
	jmp l2

swap:
	xchg array[edi], bl
	jmp l5


bubbleSort ENDP

END main