;;
;; EPITECH PROJECT, 2025
;; B-ASM-400-LYN-4-1-asmminilibc-matis.taam
;; File description:
;; strcasecmp
;;

BITS 64
section .note.GNU-stack noexec

section .text
    global strcasecmp

strcasecmp:
    xor rcx, rcx                    ; Initialise le compteur à 0

.loop:
    movzx rax, byte [rdi + rcx]      ; Charge un caractère de str1
    movzx r8, byte [rsi + rcx]       ; Charge un caractère de str2

    ; Convertit str1 en minuscule si majuscule
    cmp al, 'A'                      ; Vérifie si le caractère est une majuscule
    jb .check_str2
    cmp al, 'Z'
    ja .check_str2
    or al, 0x20                      ; Convertit en minuscule

.check_str2:
    ; Convertit str2 en minuscule si majuscule
    cmp r8b, 'A'                     ; Vérifie si le caractère est une majuscule
    jb .compare                        ; Si différents, on va à diff
    cmp r8b, 'Z'
    ja .compare
    or r8b, 0x20                     ; Convertit en minuscule

.compare:
    cmp al, r8b                      ; Compare les caractères
    jne .diff

    test al, al                      ; Vérifie si fin de chaîne
    jz .equal

    inc rcx                          ; Incrémente le compteur
    jmp .loop

.diff:
    sub rax, r8                      ; Calcule la différence
    ret

.equal:
    xor rax, rax
    ret
