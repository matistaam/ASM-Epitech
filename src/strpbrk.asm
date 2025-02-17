;;
;; EPITECH PROJECT, 2025
;; B-ASM-400-LYN-4-1-asmminilibc-matis.taam
;; File description:
;; strpbrk
;;

BITS 64
section .note.GNU-stack noexec

section .text
    global strpbrk

strpbrk:
    push rbp
    mov rbp, rsp
    mov rax, rdi                     ; Sauvegarde le pointeur de la chaîne

.outer_loop:
    mov ch, byte [rax]              ; Charge un caractère de la chaîne
    cmp ch, 0                       ; Vérifie si fin de chaîne
    je .not_found

    mov rdx, rsi                    ; Reset le pointeur de la sous-chaîne

.inner_loop:
    mov cl, byte [rdx]              ; Charge un caractère de la sous-chaîne
    cmp cl, 0                       ; Vérifie si fin de la sous-chaîne
    je .next_char

    cmp ch, cl                      ; Compare les caractères
    je .found

    inc rdx                         ; Caractère suivant dans la sous-chaîne
    jmp .inner_loop

.next_char:
    inc rax                         ; Caractère suivant dans la chaîne
    jmp .outer_loop

.not_found:
    xor rax, rax

.found:
    leave
    ret
