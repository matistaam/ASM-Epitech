;;
;; EPITECH PROJECT, 2025
;; B-ASM-400-LYN-4-1-asmminilibc-matis.taam
;; File description:
;; strpbrk
;;

BITS 64
section .note.GNU-stack noexec

section .text
    global my_strpbrk

my_strpbrk:
    push rbp
    mov rbp, rsp
    push rdx
    push r8
    push r9
    mov rax, rdi                     ; Sauvegarde le pointeur de la chaîne

.outer_loop:
    movzx r9d, byte [rax]           ; Charge un caractère de la chaîne
    test r9b, r9b                   ; Vérifie si fin de chaîne
    jz .not_found

    mov rdx, rsi                    ; Reset le pointeur de la sous-chaîne

.inner_loop:
    movzx r8d, byte [rdx]           ; Charge un caractère de la sous-chaîne
    test r8b, r8b                   ; Vérifie si fin de la sous-chaîne
    jz .next_char

    cmp r9b, r8b                    ; Compare les caractères
    je .found

    inc rdx                         ; Caractère suivant dans la sous-chaîne
    jmp .inner_loop

.next_char:
    inc rax                         ; Caractère suivant dans la chaîne
    jmp .outer_loop

.not_found:
    xor rax, rax

.found:
    pop r9
    pop r8
    pop rdx
    leave
    ret
