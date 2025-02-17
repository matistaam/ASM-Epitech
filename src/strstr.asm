;;
;; EPITECH PROJECT, 2025
;; B-ASM-400-LYN-4-1-asmminilibc-matis.taam
;; File description:
;; strstr
;;

BITS 64
section .note.GNU-stack noexec

section .text
    global strstr

strstr:
    mov rax, rdi                   ; Sauvegarde le pointeur de la chaîne pour le retour
    cmp byte [rsi], 0              ; Vérifie si la sous-chaîne est vide
    je .done

.outer_loop:
    movzx ecx, byte [rdi]          ; Charge un caractère de la chaîne
    test cl, cl                    ; Vérifie si fin de chaîne
    jz .not_found

    mov rax, rdi                   ; Sauvegarde la position actuelle
    mov rdx, rsi                   ; Charge le pointeur de la sous-chaîne

.inner_loop:
    movzx ecx, byte [rdx]          ; Charge un caractère de la sous-chaîne
    test cl, cl                    ; Vérifie si fin de sous-chaîne
    jz .done

    movzx r8d, byte [rdi]          ; Charge un caractère de la chaîne
    test r8b, r8b                  ; Vérifie si fin de chaîne
    jz .not_found

    cmp cl, r8b                    ; Compare les caractères
    jne .next_outer

    inc rdi                        ; Caractère suivant dans la chaîne
    inc rdx                        ; Caractère suivant dans la sous-chaîne
    jmp .inner_loop

.next_outer:
    mov rdi, rax                   ; Restaure la position
    inc rdi                        ; Caractère suivant
    jmp .outer_loop

.not_found:
    xor rax, rax

.done:
    ret
