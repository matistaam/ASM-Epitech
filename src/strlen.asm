;;
;; EPITECH PROJECT, 2025
;; B-ASM-400-LYN-4-1-asmminilibc-matis.taam
;; File description:
;; strlen
;;

BITS 64
section .note.GNU-stack noexec

section .text
    global strlen

strlen:
    mov rax, rdi                         ; Sauvegarde la position de la chaîne

.loop:
    cmp byte [rdi], 0                    ; Compare le caractère actuel à 0
    je .done

    inc rdi                              ; Incrémente le pointeur vers le prochain caractère
    jmp .loop

.done:
    sub rdi, rax                         ; Calcule la longueur de la chaîne (end - start)
    mov rax, rdi                         ; Place le résultat dans rax
    ret
