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
    push rbp
    mov rbp, rsp
    xor rcx, rcx                    ; Initialise le compteur à 0

.loop:
    mov al, byte [rdi + rcx]        ; Charge un caractère de str1
    mov r8b, byte [rsi + rcx]       ; Charge un caractère de str2

    cmp al, 'A'                      ; Vérifie si le caractère est une majuscule
    jb .skip_case1
    cmp al, 'Z'
    ja .skip_case1
    or al, 32                       ; Convertit en minuscule

.skip_case1:
    cmp r8b, 'A'                      ; Vérifie si le caractère est une majuscule
    jb .skip_case2
    cmp r8b, 'Z'
    ja .skip_case2
    or r8b, 32                       ; Convertit en minuscule

.skip_case2:
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
    leave
    ret

.equal:
    xor rax, rax
    leave
    ret
