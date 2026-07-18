

irqini

       
 lda $d01a  
 ora #%00000001
 sta $d01a
       


         lda #<maprender
         sta $0314
         lda #>maprender
         sta $0315



lda #1
sta $d019  


jmp $ea81





irq
sei

 
 lda $d01a  
 ora #%00000001
 sta $d01a

lda #136

sta $7fa
sta $7fb
sta $7fc
sta $7fd
sta $7fe
sta $7ff

lda #0
sta $d012


lda #0
sta spritenum

jmp collision

collisionb0


jmp oneentity

oneentityb









         lda #<irq
         sta $0314
         lda #>irq
         sta $0315
         





lda #1
sta $d019  


jmp movement




jmp $ea81




oneentity

ldy xoffset
lda sprchartab,y
eor #255
sbc catx
sta $d002


ldy xoffseth
lda sprchartab,y
eor #255
adc #150
sta $d003



lda #2
sta spritenum

jmp collision

collisionb2


ldx #2
lda collisionl,x
cmp #1

beq reversecatr

ldx #2
lda collisionr,x
cmp #1

beq reversecatl
jmp notreversecat


reversecatr
dec $d002
lda #2
sta catrev
jmp notreversecat


reversecatl
inc $d002
lda #1
sta catrev




notreversecat


clc
inc entitymovetime
lda entitymovetime
ora #%00001111
sta entitymovetime
adc #%00000111
bcs animatecat
jmp notanimatecat

animatecat
inc entanim

notanimatecat

lda entanim 
cmp #3
beq zeroentanim
jmp notzeroentanim
zeroentanim
lda #1
sta entanim
notzeroentanim


movecat
lda catrev
cmp #1
beq movecatleft
cmp #2
beq movecatright
jmp movecatnot


movecatleft


inc catx
lda #136
clc
adc entanim
sta $7f9




jmp movecatnot


movecatright


dec catx
lda entanim
lda #138
clc
adc entanim
sta $7f9


movecatnot
jmp oneentityb

