;;
;; EPITECH PROJECT, 2025
;; B-ASM-400-LYN-4-1-asmminilibc-matis.taam
;; File description:
;; strncmp
;;

BITS 64
section .note.GNU-stack noexec

section .text
    global strncmp

strncmp:
    xor rcx, rcx                    ; Initialise le compteur à 0
    test rdx, rdx                   ; Vérifie si n == 0
    jz .equal

.loop:
    cmp rcx, rdx                    ; Compare le compteur avec n
    je .equal

    movzx rax, byte [rdi + rcx]     ; Charge un caractère de str1
    movzx r8, byte [rsi + rcx]      ; Charge un caractère de str2

    cmp al, r8b                     ; Compare les caractères
    jne .diff

    test al, al                     ; Vérifie si fin de chaîne
    je .equal

    inc rcx                         ; Incrémente le compteur
    jmp .loop

.diff:
    sub rax, r8                     ; Calcule la différence
    ret

.equal:
    xor rax, rax
    ret
