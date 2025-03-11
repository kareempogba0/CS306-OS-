    
include 'emu8086.inc'
ORG 100H
;1
;mov al, 12h
;mov bl, 13h

;mul bl

;mov var, ax
          

;var dw ?


;2
;mov ax, 4
;mov bl, 3

;div bl

;mov var1, ah
;mov var2, al
;///////////////////////////
;var1 db ?
;var2 db ? 


;3
;mov bx, 2004h
;mov cx, 4h
;
;;xchg bx, cx
;
;mov ax, bx
;mov bx, cx
;mov cx, ax
;mov ax, 0 
;


;4

;mov ax, length
;
;mul width
;
;mov area, ax         
;
;RET
;area dw ?
;length dw 2
;width dw 3 


;5 

;mov ax, 5
;mov bx, 4
;mov cx, 3
;mov dx, 2
;
;mul dx
;mul cx
;mul bx
;
;mov fact, ax
;
;RET
;fact dw ? 


;6

;mov al, num1

;mul num2

;xchg al, ah

;mov bx, 5
;div bx 

;mov reminder, al;h
;mov quiotiont, ah 

;RET
;num1 db 2
;num2 db 4
;reminder db ?
;quiotiont db ?


;mov ax, 0300h
;mov ds, ax
;mov di, 0000h
;mov ax, 0000h
;mov cl, 05h
;
;abc: mov [di], ax
;inc di
;add ax, 02h
;
;loop abc
;hlt  


;--------------------------

; Lab 2 Ex_07
;mov ax, 1020h
;mov bx, 3040h
;mov di, 0200h
;
;not al
;
;neg bh  ;for 2's complement
;;not bh
;;inc bh
;
;mov [di], ah
;mov [di+1], bl 


;Ex_08
;mov ax, 100h
;mov bx, 200h
;
;add ax, 50h
;inc ax
;
;sub bx, 50h
;dec bx
;
;xchg ax, bx
;
;mov [600h], 300h
;mov [602h], 400h   
;
;mov cx, [600h]
;add cx, [602h]

               
;Ex_09
;mov ax, 0ff00h
;or ax, 0000000011111111b  
;and ax, 1111111001111111b
;xor ax, 1111110000000000b
;mov bx, ax
;
;mov cl, 0efh
;not cl
;mov ch, cl
;not cl
;
;mov dl, 0efh
;neg dl
;mov dh, dl
;not dl


;Ex_10
;mov al, 7h
;mov bl, 3h
;
;mul bl
;
;mov area, al
;
;mov bl, 2h
;div bl
;
;mov half_area, al
;                
;ret
;area db ?
;half_area db ? 


;Ex_11
;mov al, 5h
;;mov bl, 4h
;mov cl, 4h
;;mov dl, 2h
;
;;mul dl
;abc:mul cl
;loop abc
;hlt
;;mul bl
;
;
;
;mov factorial5, al
;
;ret
;factorial5 db ? 

;let the vars after ret 
data db 10h, ?, 30h
copy db 3 dup(?) ; save in the memory 3 (positions) not initialized values, dup(10h) duplicate the 3 values with 10h 
;direct addressing  [data], [data+1]
;index addressing
mov al, data[0]; same as  and the next one [data+1] and so on.
mov copy[0], al
;we can use si as a index and inc it
 
;inderict addressing
lea si, data; lea = load effective address 
;if we use ax, bx instead of si, we can't use it as a index.
lea di, copy

mov al, [si]    ; Copy the first value from 'marks' (pointed to by SI) to AL register
mov [di], al    ; Store the value in AL into the first position of 'copy' (pointed to by DI)


inc si  ; Increment SI to point to the next value in 'marks'
inc di  ; Increment DI to point to the next position in 'copy'

;mov di, offset copy 

;if the loop L1 for ex. comes before L: anything this L1 will execute only one time
  
;cmp, jl, js

mov al, 5
mov bl, 6

cmp al, bl ;compare al by bl
; if equal
je l ;jump equal and jump to l.

; if not
mov dl, 2
jmp stop ; if not equal go to stop.

l:
mov dl, 1

stop:   

;

mov al, 1000000b
cbw ; copy byte word

mov ax, 0ffffh
cwd ; copy double word will copy to dx 
; they are used to transform a byte to a word and vice verca.

printn 'hello, world' ; print the string hello, world

;

mov al, var1
mov bl, var2

cmp al, bl
ja l

; al <= bl
mov max, bl
mov min, al
jmp skip

; al > bl
l:
    mov max, al
    mov min, bl

skip:
;ret
var1 db 5
var2 db 6
max db ?
min db ?
 
;

; initialization  
mov bl, data[si] 
mov al, data[si]

mov max, al
mov min, bl

; initialize cx to 8
mov cx, 8
        
inc si
; start the loop
l1:        
    mov dl, data[si]
    cmp dl, max   ; compare dl with max
    ja a
    jmp skip
    ; if al > max
    a:
        mov max, dl
    
    skip:
    cmp dl, min
    jb b
    jmp fskip
    
    ; if dl < min
    b:
        mov min, dl
    
    fskip:
    ; increament si to the next element in data
    inc si
loop l1
;ret
data db 2, 1, 3, 4, 5, 6, 10, 11
min db ?
max db ? 

;Lab 4 examples & notes

;29
mov cx, 41         ; Set loop counter to 41 (length of the string)
mov si, 0          ; Initialize index SI to 0

CopyData:
    mov al, source[si]   ; Load the character from SOURCE at index SI into AL
    mov target[si], al   ; Store the character from AL into TARGET at the same index
    inc si               ; Increment SI to move to the next character
loop CopyData            ; Decrement CX and repeat if CX != 0

ret                     ; Return control to the operating system

SOURCE db 'Assembly language is a low level language'  ; Define the source string
TARGET db 41 dup(?)     ; Reserve 41 bytes for TARGET (uninitialized)


;30; Initialize pointers to the arrays  
lea si, Edata       ; Load address of EDATA into SI (for even numbers)  
lea di, Odata       ; Load address of ODATA into DI (for odd numbers)  

mov cx, 50         ; Set loop counter to 50 (for 50 even and 50 odd numbers)  
mov bl, 00h        ; Initialize BL with 0 (starting even number)  
mov bh, 01h        ; Initialize BH with 1 (starting odd number)  
mov ax, 0000h      ; AX will store the sum of even numbers  
mov dx, 0000h      ; DX will store the sum of odd numbers  

OddEven:  
    mov [si], bl   ; Store even number in EDATA  
    mov [di], bh   ; Store odd number in ODATA  

    add bl, 2      ; Increment even number by 2  
    add bh, 2      ; Increment odd number by 2  

    add ax, [si]   ; Add even number to AX (sum of even numbers)  
    add dx, [di]   ; Add odd number to DX (sum of odd numbers)  

    add si, 2      ; Move to the next word in EDATA  
    add di, 2      ; Move to the next word in ODATA  

loop OddEven       ; Repeat for 50 numbers  

mov sume, ax       ; Store sum of even numbers in SUME  
mov sumo, dx       ; Store sum of odd numbers in SUMO  

mov bl, 50         ; Load 50 into BL for division  

div bl             ; Divide AX by 50 to calculate average of even numbers  
mov avgeq, al      ; Store quotient (integer part) in AVGEQ  
mov avger, ah      ; Store remainder in AVGER  

mov ax, sumo       ; Load sum of odd numbers into AX  
div bl             ; Divide AX by 50 to calculate average of odd numbers  
mov avgoq, al      ; Store quotient (integer part) in AVGOQ  
mov avgor, ah      ; Store remainder in AVGOR  

; Exchange elements of EDATA and ODATA  
mov cx, 50         ; Set loop counter to 50  
mov si, 0          ; Reset SI index to 0  

Exchange:  
    mov ax, edata[si]  ; Load value from EDATA  
    xchg ax, odata[si] ; Exchange it with value in ODATA  
    mov edata[si], ax  ; Store exchanged value back in EDATA  

    add si, 2          ; Move to the next word  
loop Exchange         ; Repeat for 50 numbers  

ret                  ; Return control to OS  

; Data section  
Edata dw 50 dup(?)   ; Reserve space for 50 even numbers  
Odata dw 50 dup(?)   ; Reserve space for 50 odd numbers  
sume dw ?            ; Variable to store sum of even numbers  
sumo dw ?            ; Variable to store sum of odd numbers  
avgeq db ?           ; Quotient of even numbers average  
avgoq db ?           ; Quotient of odd numbers average  
avger db ?           ; Remainder of even numbers average  
avgor db ?           ; Remainder of odd numbers average

;31
mov ax, 800h    ; Load segment address 0800h into AX
mov ds, ax      ; Set DS (Data Segment) to 0800h

mov si, 200h    ; Set SI to start of first block (0800h:0200h)
mov cx, 1024    ; Set loop counter for 1 Kbyte (1024 bytes)
mov di, 600h    ; Set DI to start of second block (0800h:0600h)

; Fill block1 with 7Eh and block2 with E7h
Blocks:
    mov [si], 7eh  ; Store 7Eh in block1 at address SI
    mov [di], 0e7h ; Store E7h in block2 at address DI
    inc si         ; Move to the next byte in block1
    inc
     di         ; Move to the next byte in block2
loop Blocks        ; Repeat for 1024 bytes

; Reset SI and DI to the start of the blocks for exchange
mov si, 200h    ; Reset SI to start of block1
mov di, 600h    ; Reset DI to start of block2
mov cx, 1024    ; Reset loop counter for exchange process

; Exchange block1 and block2 contents
Exchange:
    mov al, [si]  ; Load value from block1 into AL
    xchg al, [di] ; Swap AL with value in block2
    mov [si], al  ; Store exchanged value in block1
    inc si        ; Move to next byte in block1
    inc di        ; Move to next byte in block2
loop Exchange     ; Repeat for 1024 bytes

ret               ; Return to operating system

;32
ORG 100h       ; Set the program's origin address at 100h

MOV AL, VAR1   ; Load the first variable (VAR1) into register AL
MOV BL, VAR2   ; Load the second variable (VAR2) into register BL

CMP AL, BL     ; Compare AL with BL
JA LARGER      ; If AL > BL (unsigned comparison), jump to LARGER label

MOV LOW, AL    ; If AL <= BL, store AL (smaller value) in LOW
MOV HIGH, BL   ; Store BL (larger value) in HIGH
JMP STOP       ; Jump to STOP to exit the program

LARGER:        
MOV HIGH, AL   ; If AL > BL, store AL (larger value) in HIGH
MOV LOW, BL    ; Store BL (smaller value) in LOW

STOP:          
RET            ; Return from the program

VAR1 DB 7Fh    ; Define VAR1 with the value 7Fh (127 in decimal)
VAR2 DB 80h    ; Define VAR2 with the value 80h (128 in decimal)
LOW DB ?
HIGH DB ?

;33
ORG 100h       ; Set the program's origin address at 100h

MOV AL, VAR1   ; Load the first signed variable (VAR1) into register AL
MOV BL, VAR2   ; Load the second signed variable (VAR2) into register BL

CMP AL, BL     ; Compare AL with BL (signed comparison)
JG LARGER      ; If AL > BL (signed comparison), jump to LARGER label

; If AL is not greater than BL (i.e., AL <= BL)
MOV LOW, AL    ; Store AL (smaller value) in LOW
MOV HIGH, BL   ; Store BL (larger value) in HIGH
JMP STOP       ; Jump to STOP to exit the program

LARGER:        
MOV HIGH, AL   ; If AL > BL, store AL (larger value) in HIGH
MOV LOW, BL    ; Store BL (smaller value) in LOW

STOP:          
RET            ; Return from the program

VAR1 DB 7Fh    ; Define VAR1 with the value 7Fh (+127 in signed decimal)
VAR2 DB 80h    ; Define VAR2 with the value 80h (-128 in signed decimal)
LOW DB ?
HIGH DB ?

;CBW
org 100h

;Convert byte into word.
;
;Algorithm:
;
;if high bit of AL = 1 then:
;    AH = 255 (0FFh)
;
;else
;    AH = 0
;
;Example:  

MOV AX, 0   ; AH = 0, AL = 0
MOV AL, -5  ; AX = 000FBh (251)
CBW         ; AX = 0FFFBh (-5)
RET

;CMP
;Compare.
;
;Algorithm:
;
;operand1 - operand2
;
;result is not stored anywhere, 
;flags are set (OF, SF, ZF, AF, PF, CF) according to result.
;
;Example:        

MOV AL, 5
MOV BL, 5
CMP AL, BL  ; AL = 5, ZF = 1 (so equal!)
RET

;CWD
org 100h

;Convert Word to Double word.
;
;Algorithm:
;
;if high bit of AX = 1 then:
;   DX = 65535 (0FFFFh)
;
;else
;   DX = 0
;
;Example:  

MOV DX, 0   ; DX = 0
MOV AX, 0   ; AX = 0
MOV AX, -5  ; DX AX = 00000h:0FFFBh
CWD         ; DX AX = 0FFFFh:0FFFBh
RET

;JA
;Short Jump if first operand is Above second operand
; (as set by CMP instruction). Unsigned.
;
;Algorithm:
;
;if (CF = 0) and (ZF = 0) then jump
; Example:  

include 'emu8086.inc'
ORG 100h
MOV AL, 250
CMP AL, 5
JA label1
PRINT 'AL is not above 5'
JMP exit
label1:
   PRINT 'AL is above 5'
exit:
   RET
   
;JG
; Short Jump if first operand is Greater then
; second operand (as set by CMP instruction). Signed.

;Algorithm:
;
;if (ZF = 0) and (SF = OF) then jump
;Example:
include 'emu8086.inc'
ORG 100h
MOV AL, 5
CMP AL, -5
JG  label1
PRINT 'AL is not greater -5.'
JMP exit
label1:
   PRINT 'AL is greater -5.'
exit:
   RET    
ret 