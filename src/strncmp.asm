;;
;; EPITECH PROJECT, 2025
;; B-ASM-400-LYN-4-1-asmminilibc-matis.taam
;; File description:
;; strncmp
;;

BITS 64
section .note.GNU-stack noexec

section .text
    global strncmp

strncmp:
    xor rax, rax                    ; Initialise le registre de retour à 0
    xor rcx, rcx                    ; Initialise le compteur à 0

    test rdx, rdx                   ; Vérifie si n == 0
    jz .equal                       ; Si oui, les chaînes sont égales

.loop:
    cmp rcx, rdx                    ; Compare le compteur avec n
    je .equal                       ; Si on a atteint n, les chaînes sont égales

    mov al, byte [rdi + rcx]        ; Charge un caractère de str1
    mov r8b, byte [rsi + rcx]       ; Charge un caractère de str2

    cmp al, r8b                     ; Compare les caractères
    jne .diff                       ; Si différents, on va à diff

    cmp al, 0                       ; Vérifie si fin de chaîne
    je .equal                       ; Si oui, les chaînes sont égales

    inc rcx                         ; Incrémente le compteur
    jmp .loop                       ; Continue la boucle

.diff:
    movzx rax, al                   ; Étend al à 64 bits avec des zéros
    movzx r8, r8b                   ; Étend r8b à 64 bits avec des zéros
    sub rax, r8                     ; Calcule la différence
    ret

.equal:
    xor rax, rax                    ; Met 0 dans rax (chaînes égales)
    ret
