;;
;; EPITECH PROJECT, 2025
;; B-ASM-400-LYN-4-1-asmminilibc-matis.taam
;; File description:
;; memcpy
;;

BITS 64
section .note.GNU-stack noexec

section .text
    global memcpy

memcpy:
    push rbp
    mov rbp, rsp
    push rcx
    mov rax, rdi                    ; Sauvegarde le pointeur destination pour le retour
    mov rcx, rdx                    ; Met le compteur dans rcx
    test rcx, rcx                   ; Vérifie si le compteur == 0
    jz .done

.loop:
    mov al, byte [rsi]             ; Charge un octet depuis la source
    mov byte [rdi], al             ; Copie l'octet vers la destination
    inc rsi                        ; Incrémente le pointeur source
    inc rdi                        ; Incrémente le pointeur destination
    dec rcx                        ; Décrémente le compteur
    jnz .loop                      ; Continue tant que rcx != 0

.done:
    pop rcx
    leave
    ret
