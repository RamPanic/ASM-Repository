TITLE Fibonacci 2.0   (newFibonacci.asm)

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
MAX_NUM = 47

; BUFFER FILE
MAX_BUFFER = 188

.data

	; Data para archivo

	filename db "fibonacci.txt", 0

	; Mensajes generales

	welcome_msg db "(Bienvenido a Fibonacci Series)", 0

	; Mensajes para Regla Fibonacci

	fb_msg1 db "[*] 47 valores de Fibonacci disponibles:", 0

	; Mensajes para archivo

	file_created_msg db "[+] Archivo creado con éxito", 0
	save_results_msg db "[*] Guardando resultados en archivo...", 0
	ready_msg db "[+] Resultados listos en archivo :D", 0

.data? 

	; Data para Fibonacci Series

	numbers DWORD MAX_NUM DUP(?)

	; Data para archivo

	descriptor DWORD ?

.code

main PROC
	
	mov edx, OFFSET welcome_msg
	call WriteString

	call Crlf
	call Crlf

	call fibonacci

	call saveResults

	invoke ExitProcess, 0

main ENDP

fibonacci PROC

	mov edx, OFFSET fb_msg1
	call WriteString

	mov ecx, MAX_NUM
	mov esi, 0

	mov edx, 0
	mov eax, 1

	loopf:

		mov ebx, 0

		; temp = a + b 
		add ebx, edx
		add ebx, eax

		; a = b
		mov edx, eax

		; b = temp
		mov eax, ebx

		; numbers[i] = b
		; i += 4
		mov numbers[esi], eax
		add esi, 4

		; Volcar resultados
		call WriteInt
		call Crlf

		loop loopf

	ret
	
fibonacci ENDP

saveResults PROC

	call createNewFile

	call Crlf
	call Crlf

	mov edx, OFFSET save_results_msg
	call WriteString

	; Mover el descriptor almc en eax a descriptor mem
	mov descriptor, eax
	mov edx, OFFSET numbers
	mov ecx, MAX_BUFFER
	call WriteToFile

	mov eax, descriptor
	call CloseFile

	call Crlf
	call Crlf

	mov edx, OFFSET ready_msg
	call WriteString

	ret

saveResults ENDP

createNewFile PROC
	
	call Crlf
	call Crlf

	mov edx, OFFSET filename
	call CreateOutputFile

	mov edx, OFFSET file_created_msg
	call WriteString

	ret
	
createNewFile ENDP

END main