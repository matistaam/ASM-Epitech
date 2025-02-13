;;
;; EPITECH PROJECT, 2025
;; B-ASM-400-LYN-4-1-asmminilibc-matis.taam
;; File description:
;; memset
;;

BITS 64
section .note.GNU-stack noexec

section .text
    global my_memset

my_memset:
    push rbp
    mov rbp, rsp
    mov rax, rdi                         ; Sauvegarde et retourne le pointeur original
    mov rcx, rdx                         ; Met le compteur n dans rcx
    mov al, sil                          ; Met le caractère de remplissage dans al

    cmp rcx, 0                          ; Vérifie si n == 0
    je .done                            ; Si oui, termine

.loop:
    mov byte [rdi], sil                 ; Écrit le caractère à l'adresse pointée
    inc rdi                             ; Incrémente le pointeur
    dec rcx                             ; Décrémente le compteur
    jnz .loop                           ; Continue tant que rcx != 0

.done:
    leave
    ret
