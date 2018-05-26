.386
.model flat,stdcall
includelib \masm32\lib\kernel32.lib
extern ExitProcess@4:near

_DATA SEGMENT
full_result dq 0
foper dd 0AAAAAh
soper dd 55555
_DATA ENDS
;---------
;---------
;---------
_TEXT SEGMENT 
START:

push soper
push foper
call muller
mov dword ptr full_result,eax
mov dword ptr full_result+4,edx

push 0 
call ExitProcess@4;-------------------------------------------------------------
muller proc
push ebp
mov ebp,esp
mov eax,dword ptr[ebp+8]
mov ebx,dword ptr[ebp+12]
mul ebx
mov esp,ebp
pop ebp
ret 8
muller endp
