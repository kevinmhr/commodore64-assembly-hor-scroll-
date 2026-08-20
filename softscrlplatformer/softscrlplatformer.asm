!cpu 6510
!to "softscrlplatformer.prg",cbm
      


!source "var.asm"



 
 
        *= $0801

         !word main-2,10
         !byte $9e
         !text "49152: "
         !byte $a2,$00,$00



 
*= $c000
sei 

lda $1
and #251
sta $1


ldx #0

charcopy
sei




;lda $9000,x
;sta $0800,x
;lda $9100,x
;sta $0900,x
;lda $9200,x
;sta $0a00,x
;lda $9300,x
;sta $0b00,x
;lda $9400,x
;sta $0c00,x
lda $9500,x
;sta $0d00,x
lda $9600,x
;sta $0e00,x
lda $9700,x
;sta $0f00,x


inx
cpx #255
bne charcopy



lda $1
ora #4
sta $1


lda $d016
and #%11110111
sta $d016

lda $d016
and #%11111000
ora #7
sta $d016




lda #1
sta movedir
lda #11
sta colshift
lda #1
sta pace

sta collisionr
sta collisionl
sta collisionu
sta collisiond
lda #10
sta xoffset
lda #9
sta xoffsetcol
 
lda #40
sta xoffseth

lda #7
sta xscroll



lda #144
sta $7f8
lda #%00000001
sta $d015
lda #140
sta $d000
lda #140
sta $d001

lda #1
sta jumpingspeed 
lda #11
sta $d027
lda #2
sta $d028


lda #200
sta $d002
lda #60
sta $d004
lda #80
sta $d006
lda #120
sta $d008
lda #140
sta $d00a
lda #160
sta $d00c
lda #180
sta $d00e

lda #220
sta $d005
sta $d003
sta $d007
sta $d009
sta $d00b
sta $d00d
sta $d00f

;lda $d018

;and  #%11110000

;ora  #%00000010

;sta $d018

jsr maparrangement


ldx #0
clearsc
clc
lda #32
 
sta $0400,x
sta $0500,x
sta $0600,x
sta $0700,x

sta $0c00,x
sta $0d00,x
sta $0e00,x
sta $0f00,x

 
 
inx
cpx #0
bne clearsc  









initirq
;jsr $1000

sei

 lda #%01111111

 sta $dc0d
 sta $dd0d
 lda $dc0d  
 lda $dd0d
 
 
lda $d011
and #%01111111
sta $d011

lda #254
sta $d012
lda #6
sta $d021
lda #1
sta $d019  




         lda #<irqini
         sta $0314
         lda #>irqini
         sta $0315


 lda $d01a  
 ora #%00000001
 sta $d01a
 

         cli      

 
 
  

main 





jmp main  

movejoy
                    
              
                     


                        lda $dc00
                        cmp #127
                        beq released
                        
                        cmp #$6f
                        beq shoot  
                      
                        and #15
                        cmp #11  
			beq left
                        cmp #7   
			beq right
			cmp #13   
			beq down
                        cmp #14   
		 	beq up

                    



                        cmp #6  
			beq upright
                        cmp #10  
			beq upleft
                        ;cmp #9  
			;beq leftdown 
			;cmp #6  
			;beq upright
                        ;cmp #5 
			;beq downright
			
  

jmp aftercheck



right


lda #1
sta movedir
sta jumpdir


jmp aftercheck


left

lda #2
sta movedir
sta jumpdir


jmp aftercheck

up 


lda #3
sta movedir
lda #9
sta jumpdir


jmp aftercheck

down 

lda #4
sta movedir

jmp aftercheck



upright


lda #5
sta movedir
lda #1
sta jumpdir


jmp aftercheck


shoot

jmp aftercheck   
upleft


lda #6
sta movedir

lda #2
sta jumpdir


jmp aftercheck

released

lda #9
sta movedir
lda #253
sta $d012


         lda #<irq
         sta $0314
         lda #>irq
         sta $0315


jmp aftercheck   
  

!source "irq.asm"

!source "movements.asm"


!source "playerphysics.asm"

!source "collision.asm"

!source "maprender.asm"


!source "maparrangement.asm" 



!source "tables.asm"




    
*=$1000
!source "ent.asm"