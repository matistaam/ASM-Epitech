;;
;; EPITECH PROJECT, 2025
;; B-ASM-400-LYN-4-1-asmminilibc-matis.taam
;; File description:
;; strrchr
;;

BITS 64
section .note.GNU-stack noexec

section .text
    global strrchr

strrchr:
    mov rax, rdi                         ; Sauvegarde la position de la chaîne
    xor rcx, rcx                         ; Initialise rcx à NULL (dernière occurence)

.loop:
    cmp byte [rax], sil                  ; Compare avec le caractère recherché
    jne .skip_found

    mov rcx, rax                         ; Sauvegarde la position de l'actuelle occurence

.skip_found:
    cmp byte [rax], 0                    ; Vérifie si fin de chaîne
    je .done

    inc rax                              ; Caractère suivant
    jmp .loop

.done:
    cmp sil, 0                           ; Vérifie si le caractère recherché est NULL
    jne .return

    mov rcx, rax                         ; Si on cherche NULL, retourne la position

.return:
    mov rax, rcx                         ; Met la dernière occurence trouvée dans rax
    ret
