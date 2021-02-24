
include irvine32.inc
.386
.model flat,stdcall
.stack 4096
ExitProcess PROTO, dwExitCode: DWORD

.data
; write your variables here
array DWORD 10000h,2000h,300h,40h,5h
theSum DWORD ?
.code
; write your code here

ArraySum PROTO,
	ptrArray:DWORD,
	szArray:DWORD

main PROC

	INVOKE ArraySum,
	ADDR array,									; address of the array
	LENGTHOF array								; number of elements
	mov theSum,eax								; store the sum
	INVOKE ExitProcess, 0
main ENDP

ArraySum PROC USES esi ecx,
	ptrArray:DWORD,							; points to the array
	szArray:DWORD								; array size
	mov esi,ptrArray							; address of the array
	mov ecx,szArray								; size of the array
	mov eax,0									; set the sum to zero
	cmp ecx,0									; length = zero?
	je L2										; yes: quit
	L1: add eax,[esi]							; add each integer to sum
	add esi,4									; point to next integer
	loop L1										; repeat for array size
	L2: ret										; sum is in EAX
ArraySum ENDP

end main