



maprender






ldx #1
maprenderpg1lp

lda bufferaddressh,x
clc
adc xoffseth
sta zeropage2h 



lda bufferaddressl,x
clc
adc xoffset
sta zeropage2l




lda displayaddressl,x
sta zeropagel
sta zeropage3l
lda displayaddressh,x
sta zeropageh 
adc #$d4
sta zeropage3h
ldy #0
stx xstack
maprenlw
clc
lda (zeropage2l),y
sta (zeropagel),y
tax
lda colchart,x
sta (zeropage3l),y
iny
cpy #40
bne maprenlw
ldx xstack
inx
cpx #24
bne maprenderpg1lp

lda #1
sta $d019  

         lda #<irq
         sta $0314
         lda #>irq
         sta $0315
         
  
jmp $ea81









