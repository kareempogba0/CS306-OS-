;include 'emu8086.inc'
org 100h

  
;mov bl, data[si] 
;mov al, data[si]
;
;mov max, al
;mov min, bl
;
;
;mov cx, 4
;        
;inc si
;
;l1:        
;    mov dl, data[si]
;    cmp dl, max   
;    jg a ; for signed and for unsigned use ja
;    jmp skip
;    a:
;        mov max, dl
;    
;    skip:
;        cmp dl, min
;        jl b ; dl < min for signed and for unsigned use jb
;        jmp break
;    
;    b:
;        mov min, dl
;    
;    break:
;    inc si
;loop l1
;
;
;ret 
;data db -5, 4, -2, -7, 1
;min db ?
;max db ?

;lea si, arr1
;lea di, arr2

mov cx, 3 
mov si, 0
mov di, 0
mov bp, 0

;mov al, [si]
;mov bl [di]
;
;cmp al, bl
;jb o
;
;o:
;    mov [arr] 

l1:  

    mov al, arr1[si]
    mov bl, arr2[di]
    cmp al, bl
    jb b
    ;jmp a
    a:
       mov arr[bp], bl
       inc di
       jmp back
       
    b:  
       mov arr[bp], al 
       inc si
       jmp back 
    
    
    eq1:
        mov arr[bp], bl
        inc di
        jmp skip
        
    eq2:
        mov arr[bp], al
        inc si
        jmp skip
        
    back:  
        inc bp
        cmp si, 2
        je eq1
    
        cmp di, 2
        je eq2
    
    skip:    
                
    
loop l1

ret
arr1 db 2, 9
arr2 db 7, 8
arr db 4h dup(?)
