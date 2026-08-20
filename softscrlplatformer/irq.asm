

irqini
 
lda #1
sta pagetoplug
       
 lda $d01a  
 ora #%00000001
 sta $d01a
       
lda #145
sta $7f8
sta $ff8

lda #0
sta $d021



 



         lda #<irq
         sta $0314
         lda #>irq
         sta $0315


lda #149

sta $7fa
sta $ffa
sta $7fb
sta $ffb
sta $7fc
sta $ffc
sta $7fd
sta $ffd
sta $7fe
sta $ffe
sta $7ff
sta $fff

 



lda #128
sta $7f8
sta $ff8


lda #254
sta $d012

lda #1
sta $d019  


jmp $ea81







irq

sei

lda #1
sta $d019  

lda $d01a
 ora #%00000001
 sta $d01a


lda #128
sta $7f8
sta $ff8

lda #253
sta $d012






lda #0
sta entnum
jmp collision
collisionb0

entityindexb

jmp movejoy


aftercheck

lda movedir
cmp #9
bne justcopycol

lda $d016
and #%00000111
cmp #0
bne justcopycol

jmp shiftoffsetr



justcopycol










jmp gravity
gravityb





jmp movement
movementb

lda $d016
and #%11111000
ora xscroll
sta $d016









         
         lda #<irq
         sta $0314
         lda #>irq
         sta $0315



jmp $ea81
 






