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

strchr:
    push rbp
    mov rbp, rsp
    mov rax, rdi                         ; Sauvergarde l'addresse de la chaîne

.loop:
    cmp byte [rax], sil                  ; Compare avec le caractère recherché (rsi = 64-bit & si = 32-bit & sil = 8-bit)
    je .found                            ; Si égal, saute à .found

    cmp byte [rax], 0                    ; Vérifie si fin de chaîne
    je .not_found                        ; Si oui, saute à .not_found

    inc rax                             ; Caractère suivant
    jmp .loop                           ; Retourne au début de la boucle

.found:
    leave
    ret

.not_found:
    xor rax, rax
    leave
    ret
