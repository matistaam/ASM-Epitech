;;
;; EPITECH PROJECT, 2025
;; B-ASM-400-LYN-4-1-asmminilibc-matis.taam
;; File description:
;; strcmp
;;

BITS 64
section .note.GNU-stack noexec

section .text
    global strcmp

strcmp:
    push rbp
    mov rbp, rsp
    push rcx
    push r8
    xor rcx, rcx                    ; Initialise le compteur à 0

.loop:
    movzx rax, byte [rdi + rcx]     ; Charge le caractère de str1
    movzx r8, byte [rsi + rcx]      ; Charge le caractère de str2

    cmp al, r8b                     ; Compare les caractères
    jne .diff

    test al, al                     ; Vérifie si fin de chaîne
    jz .equal

    inc rcx                         ; Incrémente le compteur
    jmp .loop

.diff:
    sub rax, r8                     ; Calcule la différence
    pop r8
    pop rcx
    leave
    ret

.equal:
    xor rax, rax
    pop r8
    pop rcx
    leave
    ret
