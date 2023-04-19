Projeto Exibe String

section .data
mens db "Hello World!"

Segment .text
global_start
_star: ;PL entrada(id)
;Print inicial imprimir:
mov edx,12
mov ecx,mens ;pont.or.dados
mov ebx,1 ;FD de tela
mov eax,4 ;Serviço print
int 80h

fim:
mov eax,1 ;Serviço exit(1)
int 80h