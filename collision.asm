
collision
ldx spritenum
lda #0
sta collisionu,x 
sta collisiond,x 

lda #$d0
sta zeropage2h

lda spritenum 
clc
adc #1
sta zeropage2l
ldy #0
lda (zeropage2l),y
clc
sbc #51
tax
lda charsprtab,x

clc
tax


lda displayaddressh,x
sta zeropageh
lda displayaddressl,x
sta zeropagel 

lda spritenum
sta zeropage2l

lda (zeropage2l),y


clc
sbc #10
tax

lda charsprtab,x

tay


lda (zeropagel),y

cmp noncolidchar

bne checkothercharu

jmp endofcollisionchecku

checkothercharu
cmp noncolidchar2
beq endofcollisionchecku

ldx spritenum
lda #1
sta collisionu,x

endofcollisionchecku


ldy #0
lda spritenum 
clc
adc #1
sta zeropage2l
lda (zeropage2l),y

clc

sbc #32
tax

lda charsprtab,x


tax
clc

lda displayaddressh,x
sta zeropageh
lda displayaddressl,x
sta zeropagel 

lda spritenum 
sta zeropage2l
ldy #0
lda (zeropage2l),y

clc
sbc #12
tax

lda charsprtab,x

tay


lda (zeropagel),y

cmp noncolidchar

bne checkotherchard





jmp endofcollisioncheckd

checkotherchard
cmp noncolidchar2
beq endofcollisioncheckd
ldx spritenum
lda #1
sta collisiond,x

endofcollisioncheckd



ldx spritenum
lda #0
sta collisionr,x  
sta collisionl,x 


lda spritenum 
adc #0
sta zeropage2l
ldy #0
lda (zeropage2l),y

clc
sbc #40
tax
lda charsprtab,x

clc
tax


lda displayaddressh,x
sta zeropageh
lda displayaddressl,x
sta zeropagel 

lda spritenum 
sta zeropage2l
ldy #0
lda (zeropage2l),y
clc
sbc #4
tax

lda charsprtab,x

tay


lda (zeropagel),y

cmp noncolidchar

bne checkothercharr

jmp endofcollisioncheckr

checkothercharr
cmp noncolidchar2
beq endofcollisioncheckr

ldx spritenum
lda #1
sta collisionr,x

endofcollisioncheckr

lda spritenum 
adc #0
sta zeropage2l
ldy #0
lda (zeropage2l),y
clc
sbc #40
tax
lda charsprtab,x

clc
tax


lda displayaddressh,x
sta zeropageh
lda displayaddressl,x
sta zeropagel 



lda spritenum 
sta zeropage2l
ldy #0
lda (zeropage2l),y


clc
sbc #18
tax

lda charsprtab,x

tay


lda (zeropagel),y

cmp noncolidchar

bne checkothercharl

jmp endofcollisioncheckl

checkothercharl
cmp noncolidchar2
beq endofcollisioncheckl
ldx spritenum
lda #1
sta collisionl,x



endofcollisioncheckl


lda spritenum
cmp #0
beq jmpcollisionb0
cmp #2
beq jmpcollisionb2

jmpcollisionb0

jmp collisionb0

jmpcollisionb2

jmp collisionb2




