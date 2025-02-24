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

    test rdx, rdx                   ; Vérifie si le compteur == 0
    jz .equal

.loop:
    test rdx, rdx                   ; Vérifie si le compteur == 0
    jz .equal

    movzx rax, byte [rdi]           ; Charge un caractère de str1
    movzx rcx, byte [rsi]           ; Charge un caractère de str2

    cmp al, cl                     ; Compare les caractères
    jne .diff

    test al, al                     ; Vérifie si fin de chaîne
    jz .equal

    inc rdi                         ; Incrémente le pointeur de str1
    inc rsi                         ; Incrémente le pointeur de str2
    dec rdx                         ; Décrémente le compteur
    jmp .loop

.diff:
    sub rax, rcx                     ; Calcule la différence
    jmp .done

.equal:
    xor rax, rax

.done:
    pop rcx
    leave
    ret
