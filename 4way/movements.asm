



 
     





shiftoffsetr

         
inc xoffset


lda xoffset
cmp #0
beq increasexoffseth
jmp dontincreaseoffseth
increasexoffseth
inc xoffseth


dontincreaseoffseth




lda #200
sta $d000

lda #9
sta movedir

lda #1
sta $d019

jmp maprender


zeropaceh
lda #255
sta pace
jmp $ea81

moveright


inc pace
lda pace
cmp #2
beq zeropaceh

lda #132
adc pace
sta $7f8


lda collisionr
cmp #1
beq dontmover

lda $d000
cmp #200
beq shiftoffsetr

inc $d000
inc $d000

inc $d000
inc $d000




lda #9
sta movedir
dontmover
jmp $ea81














moveleft

  

inc pace
lda pace
cmp #2
beq zeropaceh

lda #134
adc pace
sta $7f8



lda collisionl
cmp #1
beq dontmovel

lda $d000
cmp #144
beq shiftoffsetl

dec $d000
dec $d000
dec $d000
dec $d000
lda #9
sta movedir
dontmovel
jmp $ea81










shiftoffsetl

  
         

lda #144
sta $d000


dec xoffset 



lda xoffset
cmp #255
beq decreasexoffseth
jmp dontdecreaseoffseth
decreasexoffseth
dec xoffseth


dontdecreaseoffseth
lda #9
sta movedir
jmp maprender
 
    
movement




 lda movedir
 cmp #1
 beq jmpmoveright
 cmp #2
 beq jmpmoveleft
 cmp #3
 beq jmpmoveup
 cmp #4
 beq jmpmovedown

jmp $ea81
     


jmpmoveright

jmp moveright

jmpmoveleft

jmp moveleft

jmpmoveup

jmp moveup

jmpmovedown

jmp movedown

shiftoffsetu

   
         

lda #100
sta $d001

lda xoffseth
clc
sbc #0
sta xoffseth

lda #9
sta movedir
jmp maprender


shiftoffsetd

  
         


lda #180
sta $d001
lda xoffseth
clc
adc #1
sta xoffseth

lda #9
sta movedir
jmp maprender

 
moveup

inc pace
lda pace
cmp #2
beq zeropace

lda #130
adc pace
sta $7f8


lda collisionu
cmp #1
beq dontmoveu


lda $d001
cmp #100
beq shiftoffsetu
cmp #101
beq shiftoffsetu
dec $d001
dec $d001
dec $d001
dec $d001
lda #9
sta movedir
dontmoveu

jmp $ea81


movedown

inc pace
lda pace
cmp #2
beq zeropace

lda #128
adc pace
sta $7f8



lda collisiond
cmp #1

beq dontmoved
lda $d001
cmp #181
beq shiftoffsetd
cmp #180
beq shiftoffsetd
inc $d001
inc $d001
inc $d001
inc $d001
 

lda #9
sta movedir
dontmoved
jmp $ea81
zeropace
lda #255
sta pace
jmp $ea81


rts

