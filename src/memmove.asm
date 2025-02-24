;;
;; EPITECH PROJECT, 2025
;; B-ASM-400-LYN-4-1-asmminilibc-matis.taam
;; File description:
;; memmove
;;

BITS 64
section .note.GNU-stack noexec

section .text
    global memmove

memmove:
    push rbp
    mov rbp, rsp
    push rcx
    push r8

    mov rax, rdi                    ; Sauvegarde le pointeur destination pour le retour
    cmp rdx, 0                      ; Vérifie si le compteur == 0
    je .done

    cmp rdi, rsi                    ; Compare les pointeurs
    jae .check_overlap

.forward:
    mov cl, byte [rsi]             ; Charge un octet
    mov byte [rdi], cl             ; Copie l'octet
    inc rsi                        ; Incrémente le pointeur source
    inc rdi                        ; Incrémente le pointeur destination
    dec rdx                        ; Décrémente le compteur
    jnz .forward                   ; Continue tant que rdx != 0
    jmp .done

.check_overlap:
    mov r8, rsi                    ; Sauvegarde le pointeur source
    add r8, rdx                    ; Ajoute la longueur
    cmp rdi, r8                    ; Compare les pointeurs
    jae .forward                   ; Si pas de chevauchement, copie en avant

.backward:
    add rdi, rdx                   ; Ajuste le pointeur destination
    add rsi, rdx                   ; Ajuste le pointeur source
    dec rdi                        ; Décrémente le pointeur destination
    dec rsi                        ; Décrémente le pointeur source

.backward_loop:
    mov cl, byte [rsi]             ; Charge un octet
    mov byte [rdi], cl             ; Copie l'octet
    dec rsi                        ; Décrémente le pointeur source
    dec rdi                        ; Décrémente le pointeur destination
    dec rdx                        ; Décrémente le compteur
    jnz .backward_loop             ; Continue tant que rdx != 0

.done:
    pop r8
    pop rcx
    leave
    ret
