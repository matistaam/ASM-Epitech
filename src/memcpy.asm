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
    mov rax, 0                      ; Sauvegarde le pointeur destination pour le retour
    cmp rdi, rsi                    ; Compare les adresses
    je .done

    test rcx, rcx                   ; Vérifie si le compteur == 0
    jz .done

.loop:
    cmp rax, rdx                   ; Compare les adresses
    je .done
    mov cl, [rsi + rax]            ; Charge un octet depuis la source
    mov [rdi + rax], cl            ; Copie l'octet vers la destination
    inc rax                        ; Incrémente le pointeur source
    jmp .loop                      ; Continue tant que rcx != 0

.done:
    mov rax, rdi
    pop rcx
    leave
    ret
