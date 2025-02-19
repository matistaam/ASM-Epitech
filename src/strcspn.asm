;;
;; EPITECH PROJECT, 2025
;; B-ASM-400-LYN-4-1-asmminilibc-matis.taam
;; File description:
;; strcspn
;;

BITS 64
section .note.GNU-stack noexec

section .text
    global strcspn

strcspn:
    push rbp
    mov rbp, rsp
    push rcx
    push rdx
    push r8
    xor rcx, rcx                    ; Initialise le compteur à 0

.outer_loop:
    movzx eax, byte [rdi + rcx]     ; Charge le caractère actuel de la chaîne
    test al, al                     ; Vérifie si fin de chaîne
    jz .done

    mov rdx, rsi                    ; Reset le pointeur de sous-chaîne

.inner_loop:
    movzx r8d, byte [rdx]           ; Charge le caractère de sous-chaîne
    test r8b, r8b                   ; Vérifie si fin de sous-chaîne
    jz .next_char

    cmp al, r8b                     ; Compare les caractères
    je .done

    inc rdx                         ; Passe au caractère suivant dans sous-chaîne
    jmp .inner_loop

.next_char:
    inc rcx                         ; Incrémente le compteur
    jmp .outer_loop

.done:
    mov rax, rcx
    pop r8
    pop rdx
    pop rcx
    leave
    ret
