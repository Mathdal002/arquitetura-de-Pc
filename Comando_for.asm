section .data   ;Dados inicializados
mens db "Digite uma String",10
tam equ $ - mens

Segment .bss
buffer1 resb 50
qde resb 1
buffer2 resb 50

Segment .text
global _start    ;ld vai requerer

_start:      ;ponto de entrada

mov edx,tam  ;quantidade de bytes
mov ecx,mens ;ponteiro da String
mov ebx,1    ;tela(FD)
mov eax,4    ;serviço print
int 80h

mov eax,3    ;read
mov ebx,0
mov ecx, buffer1
mov edx, 50
int 80h
mov[qde], eax

iniloop: ;inicio do loop
mov a1, [buffer + esi] ;caracter atual
mov [buffer2 + esi], a1 ;transferindo para buffer2

inc esi
cmp esi, [qde]
je sai
jmp iniloop

sai:
mov edx,esi    ;quantidade de bytes
mov ecx,buffer2  ;ponteiro da String
mov ebx,1      ;tela (FD)
mov eax,4      ;serviço print
int 80h

fim:mov eax,1    ;serviço EXIT
        int 80h  ;System call