


resetxscroll
lda #8
sta xscroll

shiftoffsetr


sec
lda xscroll
sbc #1
sta xscroll


lda xscroll
cmp #255
beq resetxscroll


lda $d016
and #%11111000
ora xscroll
sta $d016



lda $d016
and #%00000111
cmp #%00000111
beq jmpcolcopybottom
cmp #%00000110
beq jmpcharcopytop
cmp #%00000101
beq jmpcharcopybottom
cmp #%00000000
beq jmpcolcopytop
 



jmp movementb



jmpcolcopybottom


inc xoffset

lda xoffset
sta zeropagescl 

lda pagetoplug
cmp #1
beq pagetodispr2

pagetodispr1

lda $d018
and #%00011111
ora #%00010000
sta $d018  

lda #1
sta pagetoplug

jmp restofthe


pagetodispr2

lda $d018
and #%00011111
ora #%00100000
sta $d018  
lda #2
sta pagetoplug

restofthe

jmp colcopybottom



jmpcharcopytop


jmp charcopytop
 

jmpcharcopybottom
jmp charcopybottom
 

jmpcolcopytop

lda #1
sta $d019

lda #60
sta $d012
         lda #<colcopytop
         sta $0314
         lda #>colcopytop
         sta $0315



jmp $ea81
 





jmp colcopytop

moveright


lda pace
cmp #4
beq animatecharr
jmp dontanimatecharr



animatecharr
lda #0
sta pace

inc maincharanim
lda maincharanim
cmp #3
beq zeromaincharanimh



dontanimatecharr

inc pace



lda #130
clc
adc maincharanim
sta $7f8
sta $ff8





lda jumpswitch
cmp #1
beq jumpsprr
jmp notjumpsprr

jumpsprr


lda #137
sta $7f8
sta $ff8


notjumpsprr

 

lda jumpdir
cmp #77
bne notjumpsprrfall

jumpsprrfall


lda #139
sta $7f8
sta $ff8

notjumpsprrfall

lda collisionr
cmp #1
beq dontmover


enoughmovingspeedr


lda $d000
cmp #190
bne domoveright

jmp shiftoffsetr

domoveright
lda $d000
adc movingspeed
sta $d000

 
dontmover



jmp moverightb
 

jmpshiftoffsetr

jmp shiftoffsetr


zeromaincharanimh
lda #255
sta maincharanim


jmp moverightb

moveleft


 
  
lda pace
cmp #4
beq animatecharl
jmp dontanimatecharl



animatecharl
lda #0
sta pace




inc maincharanim
lda maincharanim
cmp #3
beq zeromaincharanimh



dontanimatecharl

inc pace




lda #134
clc
adc maincharanim
sta $7f8
sta $ff8


lda jumpswitch
cmp #1
beq jumpsprl
jmp notjumpsprl

 



jumpsprl
lda #138
sta $7f8
sta $ff8
jmp notjumpsprl






notjumpsprl

lda jumpdir
cmp #77
bne notjumpsprlfall
jumpsprlfall

lda #140
sta $7f8
sta $ff8


notjumpsprlfall



lda collisionl
cmp #1
beq dontmovel

;lda movingspeed
;cmp #1
;beq enoughmovingspeedl
;inc movingspeed
enoughmovingspeedl

lda $d000
cmp #60
beq shiftoffsetl




lda $d000
sbc movingspeed
sta $d000



 
dontmovel

jmp moveleftb

zeropace
lda #0
sta pace



jmp $ea81




shiftoffsetl
 

jmp $ea81



pagetodispl1


;inc xscroll

;lda xscroll
;and #%00000111
;sta xscroll



;lda $d016
;and #%11111000
;clc
;ora xscroll
;sta $d016





;lda xscroll
;cmp #%00000010
;beq jmpcharcopytopl



;lda xscroll
;cmp #%00000100
;beq jmpcharcopybottoml



;lda xscroll
;cmp #%00000111
;beq jmpcolcopytopl



;lda xscroll
;cmp #%00000000
;beq jmpcolcopybottoml



jmp $ea81


jmpcolcopybottoml

jmp jmpcolcopybottom


jmpcolcopytopl

jmp jmpcolcopytop


jmpcharcopytopl

jmp jmpcharcopytop

jmpcharcopybottoml
dec xoffset
dec xoffset

jmp jmpcharcopybottom


    
movement




 lda movedir
 ;cmp #5
 ;beq jmpupright
; cmp #6
; beq jmpupleft
 cmp #1
 beq jmpmoveright
moverightb
 cmp #2
 beq jmpmoveleft
moveleftb


 ;cmp #3
 ;beq jmpmoveup
 

;cmp #4
 ;beq jmpmovedown




jmp movementb





jmpmoveright

jmp moveright

jmpmoveleft

jmp moveleft

jmpmoveup

jmp moveup

jmpmovedown

jmp movedown

jmpshiftoffsetu2
jmp shiftoffsetu

jmpshiftoffsetd2
jmp shiftoffsetd

 



shiftoffsetu

   
         

lda #100
sta $d001

lda xoffseth
clc
sbc #0
sta xoffseth
 





 
moveup



lda #130
adc pace
sta $7f8
sta $ff8


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




 
dontmoveu

jmp $ea81


 
     
shiftoffsetd
      


lda #180
sta $d001
lda xoffseth
clc
adc #1
sta xoffseth
 


 




movedown




lda collisiond
cmp #1

beq dontmoved
lda $d001
cmp #181
beq shiftoffsetd
cmp #180
beq shiftoffsetd
inc $d001

 
dontmoved
jmp $ea81




 


jmpshiftoffsetu
jmp shiftoffsetu

jmpshiftoffsetd
jmp shiftoffsetd

 



 

