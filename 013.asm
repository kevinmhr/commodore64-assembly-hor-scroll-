
resetspriteindex22
lda #128
sta spriteindex2


jsr sprites

rts
resetspriteindex2
lda #134
sta spriteindex2


jsr sprites

rts
resetspriteindex3
lda #134
sta spriteindex3


jsr sprites

rts

resetspriteindex4
lda #0
sta spriteindex4

rts
resetspritecount
lda #0
sta spritecount
jsr sprites
rts


sprites
 
   lda spriteindex2
 ;lda #193
 sta $7f8 
lda #192
sta $7f9
  
;sta $7fa
 ;sta $7fb
 ;sta $7fc
 ; sta $7fd
   ;sta $7fe
   
    lda #148
 sta $7fd
 sta $7fe
 


lda spriteindex3
 cmp #148
 beq resetspriteindex3
 
lda spriteindex4
 cmp #64
 beq resetspriteindex4
  lda spriteindex4
  adc #4
  sta spriteindex4
   


 
 
 
 
 
 rts
resetspriteindex
lda #0
sta spriteindex

jmp $ea7e

rts



changechar
  lda spriteindex
 cmp #16
 beq resetspriteindex

  lda spriteindex
  adc #2
  sta spriteindex

 
rts


resetspriteleft
lda #135
sta spriteindex2
jsr sprites

 

rts



 
shootl
 
 
 
 lda $d000
sta $d002
lda $d001
sta $d003

 
 
shootll

 

 inc $d002
  inc $d002
  inc $d002
 
 
 
outt
 
 

 
rts 

 
stopcarl
lda #115
;sta chrposition
ldx #0
lda #6
sta $d000,x

;dec xoffset
;jsr drawbk
 ;jsr storefromleft
rts

down
lda downtrigger

cmp #1
beq sodown
rts
sodown
clc
 lda chrpositionh
adc #1
sta chrpositionh
 ldx #0
 

lda $d001 
adc #3
sta $d001 

rts
resetspriteright
lda #128
sta spriteindex2
 
shoot
 

 


ldy #0
jsr shootl

rts
 
 

left

lda backtrigger
cmp #1
beq soleft

rts
soleft


 lda #195
sta spriteindex2
sec

 
 ;cmp #140
 ;beq resetspriteleft
 
 
 
  ; lda spriteindex2
  ;adc #1
  
  lda chrposition
 ; sta spriteindex2
 

 
 ldx #0
 
 
lda $d000,x
sbc #0
sta $d000,x
;bcc extendedleft
 

 
lda xoffset
sbc #1
sta xoffset

ldx #0
 
 lda $d000,x
cmp #5
beq stopcarl





inc enginesound
inc enginesound
lda chrposition
cmp #115
;beq stopcarl

sec
lda chrposition
sbc #1
sta chrposition
;bcc dechib


jsr drawbk

storefromleft 
 jsr down
 lda #196
sta spriteindex2

rts
jumproutine


 
lda downtrigger
cmp #0
beq sojump
rts
 
sojump

jsr spritecollision
 dec zptemp1
  dec zptemp1
   dec zptemp1
    dec zptemp1
     dec zptemp1
 lda zptemp1
cmp #40
 beq nojump
lda downtrigger
 cmp #1
 

beq nojump 
 

 
 dec $d001
lda zptemp1
cmp #100
 bne sojump
nojump
 
rts
 
movejoy 
          
        jsr down
               
               lda $dc00
                 cmp #$6f
                      beq shoot  
               
              and #15
                                
                                cmp #11  
				beq left
                                cmp #10  
				beq leftup
                            

                                  cmp #9  
				beq leftdown 
				cmp #6  
				beq upright
                                   cmp #5 
				beq downright


				cmp #7   
				beq right
				cmp #13   
				;beq down
                                cmp #14   
				beq jumproutine
				     
          

     
				rts

up
;lda chrpositionh
;cmp #0
;beq resetchrpositionh
;lda chrpositionh
;sbc #1
;sta chrpositionh
;lda chrposition
;adc #16
;sta chrposition
;jsr drawbk
 ldx #0
 
lda $d001,x
sbc #3
sta $d001,x
rts


rts
resetchrpositionh
lda #20
sta chrpositionh
jsr drawbk
rts
leftup
 
jsr left
jsr jumproutine

 jsr down

rts
leftdown
 
jsr left
jsr down

rts

upright 
jsr jumproutine
jsr right

 jsr down
rts
downright 
jsr down
jsr right
rts
extendedleft
lda $d010
cmp #%00000001
beq extendleft

lda #%00000001
sta $d010
jsr left
rts

dechib

lda chrpositionh
cmp #$03
beq resethibneg
dec chrpositionh

rts
right 
lda fronttrigger
cmp #1
beq soright
  jsr down


rts
soright
 clc
 

 
 
 ;;lda spriteindex2
 ;bcs resetspriteright
 ;cmp #134
 ;beq resetspriteright

 ;lda spriteindex2
 ; adc #1
 ; sta spriteindex2
   lda #193
  sta spriteindex2
   lda #194
  sta spriteindex2
 ldx #0

lda $d000,x
adc #1
sta $d000,x
 bcs extendedright
 ldx #0
 
 lda $d000,x
 cmp #160
 beq stopcarr





inc enginesound
inc enginesound

lda chrposition
cmp #130
;beq stopcarr




clc
lda xoffset
adc #1
sta xoffset
lda chrposition
adc #1
sta chrposition
bcs inchib


jsr drawbk

 

rts





extendedright
lda #%00000001
sta $d010
jsr right
rts

extendleft



lda #%00000000
sta $d010
jsr left
rts
 

jmp sprites 
rts






stopcarr
;lda #130
;sta chrposition

;jsr drawbk
lda #159
sta $d000,x

inc xoffset
jsr drawbk

rts
inchib

lda chrpositionh
cmp #$08
beq resethib
inc chrpositionh

rts

resethib
lda #$04
sta chrpositionh
rts

resethibneg
lda #$07
sta chrpositionh
rts











collision
ldx chrposition
inx
lda $700,x

cmp #207
ldx chrposition
dex
lda $700,x
cmp #207
 beq collided
rts
collided
 
 

jsr pickupsnd
 
rts


spritecollision

jsr collisiondown

jsr collisionright
jsr collisionleft
rts
collisiondown

lda $d001

lsr
lsr
lsr
sbc #3
tax
lda displayaddressl,x
sta zeropagel

lda displayaddressh,x
sta zeropageh

lda $d000
lsr
lsr
lsr
sbc #2
tay

lda (zeropagel),y

cmp #230
beq lockdown
rts

collisionright
lda $d001
 sbc #20
lsr
lsr
lsr
sbc #2
tax
lda displayaddressl,x
sta zeropagel

lda displayaddressh,x
sta zeropageh

lda $d000
 
lsr
lsr
lsr
 
tay

lda (zeropagel),y

cmp #230
beq lockfront
rts
collisionleft
lda $d001
 sbc #20
lsr
lsr
lsr
sbc #2
tax
lda displayaddressl,x
sta zeropagel

lda displayaddressh,x
sta zeropageh

lda $d000
 sbc #30
lsr
lsr
lsr
 
tay

lda (zeropagel),y

cmp #230
beq lockback
rts





rts
lockdown

             lda $d001
            
             sta zptemp1

lda #0
sta downtrigger
rts

lockfront
lda #0
sta fronttrigger
rts


lockback
lda #0
sta backtrigger
rts



 

