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
    mov rax, rdi                         ; Sauvergarde l'addresse de la chaîne
    xor rcx, rcx                         ; Initialise rcx à NULL (dernière occurence)

.loop:
    cmp byte [rax], sil                  ; Compare avec le caractère recherché
    je .found                            ; Si égal, saute à .found

    cmp byte [rax], 0                    ; Vérifie si fin de chaîne
    je .done                             ; Si oui, saute à .done

    inc rax                              ; Caractère suivant
    jmp .loop                            ; Retourne au début de la boucle

.found:
    mov rcx, rax                         ; Sauvegarde cette position
    inc rax                              ; Caractère suivant
    cmp sil, 0                           ; Vérifie si on cherche '\0'
    je .done                             ; Si oui, saute à .done
    jmp .loop                            ; Retourne au début de la boucle

.done:
    mov rax, rcx                         ; Met la dernière occurence trouvée dans rax
    ret
