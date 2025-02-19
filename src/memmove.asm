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
    push r9
    mov rax, rdi                    ; Sauvegarde le pointeur destination pour le retour
    mov rcx, rdx                    ; Met le compteur dans rcx

    test rcx, rcx                   ; Vérifie si le compteur == 0
    jz .done

    cmp rdi, rsi                    ; Compare les adresses
    jl .forward

    ; Copie arrière vers avant si chevauchement possible
    lea r8, [rsi + rcx - 1]        ; Pointe à la fin de src
    lea r9, [rdi + rcx - 1]        ; Pointe à la fin de dest

.backward:
    mov al, byte [r8]              ; Charge un octet depuis la fin de la source
    mov byte [r9], al              ; Copie l'octet vers la fin de la destination
    dec r8                         ; Décrémente les pointeurs
    dec r9
    dec rcx                        ; Décrémente le compteur
    jnz .backward                  ; Continue si pas fini
    jmp .done

.forward:
    mov al, byte [rsi]             ; Charge un octet depuis la source
    mov byte [rdi], al             ; Copie l'octet vers la destination
    inc rsi                        ; Incrémente le pointeur source
    inc rdi                        ; Incrémente le pointeur destination
    dec rcx                        ; Décrémente le compteur
    jnz .forward                   ; Continue tant que rcx != 0

.done:
    pop r9
    pop r8
    pop rcx
    leave
    ret
