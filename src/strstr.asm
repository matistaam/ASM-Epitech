;;
;; EPITECH PROJECT, 2025
;; B-ASM-400-LYN-4-1-asmminilibc-matis.taam
;; File description:
;; strstr
;;

BITS 64
section .note.GNU-stack noexec

section .text
    global strstr

strstr:
    push rbp
    mov rbp, rsp
    mov rax, rdi                    ; Sauvegarde le pointeur de la chaîne source

    cmp byte [rsi], 0              ; Vérifie si la sous-chaîne est vide
    je .done

.outer_loop:
    mov cl, byte [rdi]             ; Charge un caractère de la chaîne source
    cmp cl, 0                      ; Vérifie si fin de chaîne
    je .not_found                  ; Si fin atteinte, sous-chaîne non trouvée

    mov rax, rdi                   ; Sauvegarde la position actuelle
    mov rdx, rsi                   ; Charge le pointeur de la sous-chaîne

.inner_loop:
    mov cl, byte [rdx]             ; Charge un caractère de la sous-chaîne
    cmp cl, 0                      ; Vérifie si fin de sous-chaîne
    je .done                       ; Si fin atteinte, sous-chaîne trouvée

    mov ch, byte [rdi]             ; Charge un caractère de la position actuelle
    cmp ch, 0                      ; Vérifie si fin de chaîne
    je .not_found                  ; Si fin atteinte, sous-chaîne non trouvée

    cmp cl, ch                     ; Compare les caractères
    jne .next_char                 ; Si différent, passe au caractère suivant

    inc rdi                        ; Caractère suivant dans la chaîne
    inc rdx                        ; Caractère suivant dans la sous-chaîne
    jmp .inner_loop                ; Continue la comparaison

.next_char:
    mov rdi, rax                   ; Restaure la position
    inc rdi                        ; Caractère suivant
    jmp .outer_loop                ; Recommence la recherche

.not_found:
    xor rax, rax

.done:
    leave
    ret
