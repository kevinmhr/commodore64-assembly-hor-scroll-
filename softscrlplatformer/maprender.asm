


charcopytop


lda bufferaddressh
sbc #2
adc xoffseth
sta zeropagesch 

ldx #1
maprenderpg1lp

 
lda zeropagesch 
adc #1
sta zeropagesch 


lda displayaddressl,x
sta zeropagel




lda pagetoplug
cmp #2
bne screen2
screen1


lda displayaddressh,x
sta zeropageh 



jmp screenseldone
screen2
 
lda displayaddressh,x
adc #8
sta zeropageh 


screenseldone



ldy #1
maprenlw

lda (zeropagescl),y
sta (zeropagel),y
iny
lda (zeropagescl),y
sta (zeropagel),y
iny
lda (zeropagescl),y
sta (zeropagel),y
iny
lda (zeropagescl),y
sta (zeropagel),y
iny
lda (zeropagescl),y
sta (zeropagel),y
iny


cpy #36
bne maprenlw
lda (zeropagescl),y
sta (zeropagel),y
iny
lda (zeropagescl),y
sta (zeropagel),y
iny
lda (zeropagescl),y
sta (zeropagel),y
 


inx
cpx #9
bne maprenderpg1lp
 
 

jmp $ea81


 

charcopybottom

lda bufferaddressh
adc #6
adc xoffseth
sta zeropagesch 



ldx #9

maprenderpg2lp


lda zeropagesch 
adc #1
sta zeropagesch 

lda displayaddressl,x
sta zeropagel

 

lda pagetoplug
cmp #2
bne thenextscreen2 
lda displayaddressh,x
sta zeropageh 




jmp screenseldone2

thenextscreen2 

lda displayaddressh,x
adc #8
sta zeropageh 
screenseldone2

sta zeropageh 


ldy #1
maprenlw2

lda (zeropagescl),y
sta (zeropagel),y
iny
lda (zeropagescl),y
sta (zeropagel),y
iny
lda (zeropagescl),y
sta (zeropagel),y
iny
lda (zeropagescl),y
sta (zeropagel),y
iny
lda (zeropagescl),y
sta (zeropagel),y
iny

cpy #36
bne maprenlw2

lda (zeropagescl),y
sta (zeropagel),y
iny
lda (zeropagescl),y
sta (zeropagel),y
iny
lda (zeropagescl),y
sta (zeropagel),y
 


inx
cpx #23
bne maprenderpg2lp

 

jmp $ea81


 




colcopytop
       
lda #1
sta $d019


lda bufferaddressh
sbc #2

adc xoffseth
sta zeropagesch 



ldx #1
colmaprenderpg1lp



lda zeropagesch 
adc #1
sta zeropagesch 


lda displayaddressl,x




sta zeropagel



lda displayaddressh,x
adc #$d4
sta zeropageh 

 

 



ldy #1
colmaprenlw

lda (zeropagescl),y
sta (zeropagel),y
iny
lda (zeropagescl),y
sta (zeropagel),y
iny
lda (zeropagescl),y
sta (zeropagel),y
iny
lda (zeropagescl),y
sta (zeropagel),y
iny
lda (zeropagescl),y
sta (zeropagel),y
iny

cpy #36
bne colmaprenlw
lda (zeropagescl),y
sta (zeropagel),y
iny
lda (zeropagescl),y
sta (zeropagel),y
iny
lda (zeropagescl),y
sta (zeropagel),y
 
inx
cpx #9
bne colmaprenderpg1lp
        
lda #252
sta $d012


         lda #<irq
         sta $0314
         lda #>irq
         sta $0315


jmp $ea81


 

colcopybottom


lda bufferaddressh
adc #6
adc xoffseth
sta zeropagesch 

ldx #9
colmaprenderpg2lp


lda zeropagesch 
adc #1
sta zeropagesch 


lda displayaddressl,x
adc #1
sta zeropagel


lda displayaddressh,x
adc #$d4
sta zeropageh 

ldy #0

lda (zeropagesch),y

sta (zeropagel),y


ldy #0
;stx xstack
colmaprenlw2

lda (zeropagescl),y
sta (zeropagel),y
iny
lda (zeropagescl),y
sta (zeropagel),y
iny
lda (zeropagescl),y
sta (zeropagel),y
iny
lda (zeropagescl),y
sta (zeropagel),y
iny
lda (zeropagescl),y
sta (zeropagel),y
iny

cpy #35
bne colmaprenlw2
lda (zeropagescl),y
sta (zeropagel),y
iny
lda (zeropagescl),y
sta (zeropagel),y
iny
lda (zeropagescl),y
sta (zeropagel),y
 


;ldx xstack
inx
cpx #23
bne colmaprenderpg2lp


jmp $ea81


 













maprenderauto


lda xoffset
sta zeropagescl

lda $d018
and #%00011111
ora #%00010000
sta $d018  

lda #1
sta pagetoplug


lda bufferaddressh
sbc #1
adc xoffseth
sta zeropagesch 



ldx #1
maprenderautopg1lp


lda zeropagesch 
adc #1
sta zeropagesch 

lda displayaddressl,x
adc #1
sta zeropagel
sta zeropage3l



lda displayaddressh,x
sta zeropageh 
adc #$d4
sta zeropage3h


ldy #1
stx xstack
maprenautolw

lda (zeropagescl),y
sta (zeropagel),y
 
;tax
;cpx #32
cmp #32
beq dontaddcolauto
sta (zeropage3l),y
dontaddcolauto

iny
cpy #39
bne maprenautolw
ldx xstack
inx
cpx #23
bne maprenderautopg1lp
 

           
  
jmp $ea81


 















