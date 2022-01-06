TITLE XOR Crypt   (xorCrypt.asm)

; Descripción del programa: -
; Autor: RamPanic	
; Fecha de creación: 18/05/21
; Revisiones: 6 
; Fecha de última modificación: 21/05/21

include c:\masm32\include\Irvine32.inc
includelib c:\masm32\lib\Irvine32.lib
includelib c:\masm32\lib\Kernel32b.lib
includelib c:\masm32\lib\User32b.lib

MAX_BUFFER = 200

.data

	; Mensajes
	msg1 BYTE "Bienvenido al XOR CRYPT ASM v0.5", 0
	msg2 BYTE "Mensaje cifrado: ", 0
	msg3 BYTE "Mensaje descifrado: ", 0
	
	; Entrada
	plainText_prompt BYTE "(XorCrypt/text)-> ", 0
	key_prompt BYTE "(XorCrypt/key)-> ", 0
	
	; Almacenamiento
	plainText BYTE MAX_BUFFER DUP (0)
	key BYTE MAX_BUFFER DUP (0)

.data?
	
	; Tamaño de buffer
	buff_size_plainText DWORD ?
	buff_size_key DWORD ?

.code

main PROC

	mov edx, OFFSET msg1
	call showMessage
	call setMessage
	call setKey
	mov edx, OFFSET msg2
	call showMessage
	call encrypt
	mov edx, OFFSET msg3
	call showMessage
	call encrypt

	invoke ExitProcess, 0

main ENDP

showMessage PROC

	pushad
	call Crlf
	call WriteString
	call Crlf
	call Crlf
	call Crlf
	popad
	ret

showMessage ENDP

setMessage PROC
	
	pushad
	mov edx, OFFSET plainText_prompt
	call WriteString
	mov ecx, MAX_BUFFER
	mov edx, OFFSET plainText
	call ReadString
	mov buff_size_plainText, eax
	popad
	ret

setMessage ENDP

setKey PROC

	pushad
	mov edx, OFFSET key_prompt
	call WriteString
	mov ecx, MAX_BUFFER
	mov edx, OFFSET key
	call ReadString
	mov buff_size_key, eax
	popad
	ret

setKey ENDP

encrypt PROC

	pushad

	mov ebx, buff_size_plainText
	mov ecx, buff_size_key

	mov esi, 0
	mov edi, 0

	jmp l1

l1:
	cmp esi, ebx
	jb l2
	popad
	ret

l2:
	cmp edi, ecx
	jnb l3
	mov al, plainText[esi]
	xor al, key[edi]
	mov plainText[esi], al
	movzx eax, al
	call WriteChar
	inc esi
	inc edi
	jmp l1

l3:
	mov edi, 0
	jmp l1

encrypt ENDP

END main