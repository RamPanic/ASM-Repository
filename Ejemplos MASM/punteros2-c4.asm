TITLE Punteros2     (punteros2.asm) 

; Descripción del programa: -
; Autor: RamPanic	
; Fecha de creación: 03/04/21
; Revisiones: 0
; Fecha de última modificación: 03/04/21

include c:\masm32\include\Irvine32.inc
includelib c:\masm32\lib\Irvine32.lib

.data

	arrayBytes     BYTE  10h,20h,30h,40h
	arrayWords     WORD  8Ah,3Bh,72h,44h,66h
	
	arrayDwords    DWORD 1,2,3,4,5
	pointer        DWORD arrayDwords

.code
main PROC
	
	mov  esi,OFFSET arrayBytes
  	mov  al,[esi]                                   	  ; a. AL = 10h
	mov  al,[esi+3]                    		          ; b. AL = 40h
  
	mov  esi,OFFSET arrayWords + 2
	mov  ax,[esi]                      		          ; c. AX = 3Bh
  
	mov  edi,8
	mov  edx,[arrayDwords + edi]         		          ; d. EDX = 3
	mov  edx,arrayDwords[edi]            		          ; e. EDX = 3
  
	mov  ebx,pointer
	mov  eax,[ebx + 4]                 		          ; f. EAX = 2

main ENDP
END main  
