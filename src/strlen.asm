;;
;; EPITECH PROJECT, 2025
;; B-ASM-400-LYN-4-1-asmminilibc-matis.taam
;; File description:
;; strlen
;;

BITS 64                                  ; Mode 64 bits
section .note.GNU-stack noexec           ; Marque la stack comme non exécutable

section .text                            ; Section pour le code
    global strlen                        ; Point d'entrée du programme

strlen:                                  ; Étiquette de début du programme
    push rbp                             ; Sauvegarde la base de la stack
    mov rbp, rsp                         ; Initialise la base de la stack
    mov rcx, 0                           ; Initialise le compteur (rax) à 0

.loop:                                   ; Début de la boucle
    cmp byte [rdi], 0                    ; Compare le caractère pointé par rdi avec 0 (fin de chaîne)
    je .done                             ; Si égal à 0, saute à .done

    inc rdi                              ; Incrémente le pointeur vers le prochain caractère
    inc rcx                              ; Incrémente le compteur de caractères
    jmp .loop                            ; Retourne au début de la boucle

.done:                                   ; Étiquette de fin
    mov rax, rcx                         ; Met la longueur de la chaîne dans rax
    leave                                ; Nettoie la stack
    ret                                  ; Retourne la valeur dans rax (longueur de la chaîne)
