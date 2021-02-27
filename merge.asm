include irvine32.inc
.386
.model flat , c
.stack 4096
exitprocess proto ,dwexitcode : dword

.data
	list dword 10,5,29,30,15,0,3
	mergearray dword 7 dup (0)
.code
main proc
	mov ebx , 0
	mov ecx , 7
	l1:
	mov eax , [list + ebx]
	cmp eax , [list + ebx + 4]
	jge merge
	jle l2 

	l2:
	mov edx , eax
	add ebx , 4
	add ebp , 4
	mov esp , edx
	
	loop l1

	merge:
	mov edx , [list + ebx +12]
	add ebx , 4
	mov esp , edx
	add ebp , 4
	loop l1


	invoke exitprocess ,0
main endp
end main
