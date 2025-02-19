;;
;; EPITECH PROJECT, 2025
;; B-ASM-400-LYN-4-1-asmminilibc-matis.taam
;; File description:
;; memset
;;

BITS 64
section .note.GNU-stack noexec

section .text
    global memset

memset:
    push rbp
    mov rbp, rsp
    push rcx
    push r8
    mov r8, rdi                          ; Sauvegarde le pointeur original pour le retour
    mov rcx, rdx                         ; Met le compteur n dans rcx
    test rcx, rcx                        ; Vérifie si n == 0
    jz .done

    mov al, sil                          ; Met le caractère à écrire dans al

.loop:
    mov byte [rdi], al                  ; Écrit le caractère à l'adresse pointée
    inc rdi                             ; Incrémente le pointeur
    dec rcx                             ; Décrémente le compteur
    jnz .loop                           ; Continue tant que rcx != 0

.done:
    mov rax, r8                         ; Retourne le pointeur original
    pop r8
    pop rcx
    leave
    ret
