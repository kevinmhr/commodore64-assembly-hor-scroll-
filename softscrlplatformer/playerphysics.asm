
gravity



lda collisiond
cmp #1
bne dontcheckalign
 
ldx $d001
 
lda charsprtab,x
adc #22
sta scrolldown

ldx $d001
lda charsprtab,x


cmp #25
beq dontcheckalign2
cmp #23
beq dontcheckalign2
cmp #22
beq dontcheckalign2
cmp #24
beq dontcheckalign2
cmp #21
beq dontcheckalign2
 





shiftlevel1




;lda xoffseth
;sbc scrolldown 
;cmp scrolllimit
;bne proceedscrolling
jmp dontcheckalign2
;proceedscrolling



lda $d001
clc
adc #8
sta $d001


 
dec scrolllimit
 
dec xoffseth

lda #1
sta collisionfd

;jmp maprenderauto

 

jmp $ea81


dontcheckalign





dontcheckalign2














lda collisionu
cmp #1
beq headcollide

jmp pass0

headcollide
lda #0
sta jumpswitch

pass0

lda collisiond
cmp #1
beq resetjumptime

 


jmp pass1



resetjumptime
lda #36
sta jumpingspeed

 
 
lda #0
sta jumptime2
lda #0
sta jumpswitch



pass1


 


lda movedir
cmp #3
beq setjumpswitch
cmp #5
beq setjumpswitch
cmp #6
beq setjumpswitch

jmp procedejmp



setjumpswitch2
lda #0
sta fallingspeed
 
lda #0
sta jumpswitch


;lda #9
;sta movedir

jmp procedejmp




setjumpswitch
 
lda #0
sta collisionfd
lda collisiond
cmp #1
bne procedejmp



lda #1
sta jumpswitch


;lda #9
;sta movedir


procedejmp


lda jumpswitch
cmp #1
beq jumping


jmp notjumping


jumping
lda #1
sta collisionfd

ldx jumpingspeed
lda #4
sbc acceltab,x


sta jumpingspeedbit



lda jumpingspeed
cmp #1
beq setjumpswitch2
dec jumpingspeed



lda $d001
sbc jumpingspeedbit
sta $d001







lda jumpdir
sta movedir 






jmp dontmovedphy





shiftoffsetuphy




jmp $ea81





notjumping





lda jumpswitch

cmp #0
beq falling

jmp dontmovedphy

falling



lda collisiond
cmp #1
beq dontmovedphy




lda fallingspeed
cmp #3
beq enoughfallingspeed


inc fallingspeed






enoughfallingspeed
 
ldx fallingspeed

lda #4
sbc acceltab,x
sta fallingspeedbit



lda $d001
adc fallingspeedbit
tax
lda charsprtab,x

  
cmp #23
beq shiftoffsetdphy
 





lda $d001
adc fallingspeed
sta $d001






lda jumpdir
sta movedir

lda #77
sta jumpdir


jmp dontmovedphy
shiftoffsetdphy
lda #77
sta jumpdir


lda #1
sta collisionfd


lda xoffseth
clc
adc #1
sta xoffseth



jmp maprenderauto





jmp $ea81
 




resetjumptime2

lda #5
sta jumptime2
lda #0
sta jumpswitch


dontmovedphy

lda collisiond
cmp #1
bne dontalignspry

lda collisionfd
cmp #1
bne dontalignspry
lda #0
sta collisionfd
ldx $d001
lda charsprtab,x
tax
lda sprchartab,x
sta $d001

dontalignspry



jmp gravityb







