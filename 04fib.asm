include irvine32.inc
.386
.model flat,C
.stack 4096
ExitProcess PROTO, dwExitCode: DWORD

.data
; write your variables here
	fib dword 20 dup(?)
.code
; write your code here

main PROC
	mov [fib], 1
	mov [fib+4], 1
	mov ebx, 0
	mov ecx, 18
L1:
	mov eax, [fib + ebx]
	add eax, [fib + ebx + 4]
	mov [fib + ebx + 8], eax
	add ebx, 4
	loop L1
	INVOKE ExitProcess, 0
main ENDP
end main