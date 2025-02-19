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
    push rbp
    mov rbp, rsp
    push rcx
    push r8
    mov rcx, rdx                    ; Met le compteur dans rcx
    test rcx, rcx                   ; Vérifie si le compteur == 0
    jz .equal

.loop:
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
