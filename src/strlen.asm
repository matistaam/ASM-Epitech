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
    mov rax, 0                           ; Initialise le compteur (rax) à 0

.loop:                                   ; Début de la boucle
    cmp byte [rdi], 0                    ; Compare le caractère pointé par rdi avec 0 (fin de chaîne)
    je .done                             ; Si égal à 0, saute à .done

    inc rdi                              ; Incrémente le pointeur vers le prochain caractère
    inc rax                              ; Incrémente le compteur de caractères
    jmp .loop                            ; Retourne au début de la boucle

.done:                                   ; Étiquette de fin
    ret                                  ; Retourne la valeur dans rax (longueur de la chaîne)
