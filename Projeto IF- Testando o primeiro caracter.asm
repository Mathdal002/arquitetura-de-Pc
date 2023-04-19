Projeto IF- Testando o primeiro caracter

Section .data
 msg1 db "Primeiro caractere e igual", 0
 msg2 db "Primeiro caractere e diferente", 0
 buff resb 64
Section .text
 global_start
 _start: ; Lê a string
 mov eax, 3
 mov ebx, 0
 mov ecx, buff
 mov edx, 64
 int 80h

; Testa o primeiro caractere
 mov al, [buff]
 cmp al, 'a'
 je igual
 jmp diferente
 
 igual:
 ;Imprime a mensagem "Primeiro caractere e igual"
 mov eax, 4
 mov ebx, 1
 mov ecx, msg1
 mov edx, 20
 int 80h
 jmp fim

 diferente:
 ;Imprime a mensagem "Primeiro caractere e diferente"
 mov eax, 4 
 mov ebx, 1
 mov ecx, msg2
 mov edx,23
 int 80h
 jmp fim

 fim: ;Finaliza o programa
 mov eax, 1
 xor ebx, ebx
 int 80h
 
