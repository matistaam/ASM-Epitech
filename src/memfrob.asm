;;
;; EPITECH PROJECT, 2025
;; B-ASM-400-LYN-4-1-asmminilibc-matis.taam
;; File description:
;; memfrob
;;

BITS 64
section .note.GNU-stack noexec

section .text
    global memfrob

memfrob:
    push rbp
    mov rbp, rsp
    push rcx

    xor rcx, rcx              ; Initialise le compteur à 0
    mov rax, rdi              ; Sauvegarde le pointeur pour le retour

.loop:
    cmp rcx, rsi              ; Compare avec la taille
    je .done

    xor byte [rdi + rcx], 42  ; XOR avec 42
    inc rcx
    jmp .loop

.done:
    pop rcx
    leave
    ret
