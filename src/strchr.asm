;;
;; EPITECH PROJECT, 2025
;; B-ASM-400-LYN-4-1-asmminilibc-matis.taam
;; File description:
;; strchr
;;

BITS 64
section .note.GNU-stack noexec

section .text
    global strchr
    global index

index:
strchr:
    push rbp
    mov rbp, rsp
    push rcx
    mov al, sil                          ; Stocke le caractère recherché dans al
    mov rcx, rdi                         ; Sauvegarde la position de la chaîne

.loop:
    cmp [rcx], al                        ; Compare le caractère actuel à la recherche
    je .found

    cmp byte [rcx], 0                    ; Vérifie si fin de chaîne
    je .not_found

    inc rcx                             ; Caractère suivant
    jmp .loop                           ; Retourne au début de la boucle

.found:
    mov rax, rcx                         ; Place le résultat dans rax
    pop rcx
    leave
    ret

.not_found:
    xor rax, rax
    pop rcx
    leave
    ret
