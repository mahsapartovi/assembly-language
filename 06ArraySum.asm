
include irvine32.inc
.386
.model flat,C
.stack 4096
ExitProcess PROTO, dwExitCode: DWORD

.data
; write your variables here
	array DWORD 10000h,2000h,300h,40h,5h
	theSum DWORD 0
.code
; write your code here

;-----------------------------------------------------
; ArraySum
; Calculates the sum of an array of 32-bit integers.
; Receives: ESI = the array offset
; ECX = number of elements in the array
; Returns: EAX = sum of the array elements
;-----------------------------------------------------

ArraySum PROC USES esi ecx
	mov eax,0										; set the sum to zero
L1:
	add eax,[esi]									; add each integer to sum
	add esi,TYPE DWORD								; point to next integer
	loop L1											; repeat for array size
	ret												; sum is in EAX
ArraySum ENDP


;-----------------------------------------------------
; main Proc
;-----------------------------------------------------

main PROC
	mov esi,OFFSET array							; ESI points to array
	mov ecx,LENGTHOF array							; ECX = array count
	call ArraySum									; calculate the sum
	mov theSum,eax									; returned in EAX
	INVOKE ExitProcess, 0
main ENDP
end main



