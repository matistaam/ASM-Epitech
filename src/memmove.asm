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
    mov rax, 0                      ; Sauvegarde le pointeur destination pour le retour
    cmp rdi, rsi                    ; Compare les adresses
    je .done

    cmp rdx, 0                      ; Vérifie si le compteur == 0
    je .done

    ; Si dest > src et il y a chevauchement, copie de la fin vers le début
    mov rcx, rdi
    sub rcx, rsi
    cmp rcx, rdx
    jae .forward                    ; Pas de chevauchement, copie normale

    ; Copie de la fin vers le début
    mov rcx, rdx
    dec rcx

.backward:
    mov al, [rsi + rcx]            ; Charge un octet depuis la fin de la fin
    mov [rdi + rcx], al            ; Copie l'octet
    dec rcx                        ; Décrémente le compteur
    jnz .backward                  ; Continue tant que rcx != 0
    jmp .done

.forward:
    cmp rax, rdx                   ; Compare avec la taille
    je .done
    mov cl, [rsi + rax]            ; Charge un octet depuis la source
    mov [rdi + rax], cl            ; Copie l'octet vers la destination
    inc rax                        ; Incrémente le compteur
    jmp .forward                   ; Continue

.done:
    mov rax, rdi
    pop rcx
    leave
    ret
