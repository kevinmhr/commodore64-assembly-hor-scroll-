!cpu 6510
!to "plat.prg",cbm
      


!source "var.asm"




*=$2500
!fill 25000,32
 
 
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




lda $d000,x
sta $0800,x
lda $d100,x
sta $0900,x
lda $d200,x
sta $0a00,x
lda $d300,x
sta $0b00,x
lda $d400,x
sta $0c00,x
lda $d500,x
sta $0d00,x
lda $d600,x
sta $0e00,x
lda $d700,x
sta $0f00,x


inx
cpx #255
bne charcopy



lda $1
ora #4
sta $1




lda #1
sta movedir
lda #11
sta colshift
lda #1
sta pace
lda #4
sta xoffseth
sta collisionr
sta collisionl
sta collisionu
sta collisiond
lda #55
sta xoffset
lda #$80
sta $8f7
lda #255
sta $d015
lda #140
sta $d000
sta $d001


lda #3
sta $d027

lda #0
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

lda $d018

and  #%11110000

ora  #%00000010

sta $d018

jsr maparrangement


ldx #0
clearsc
clc
lda #32
 
sta $0400,x
sta $0500,x
sta $0600,x
sta $0700,x
 
 
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

lda #200
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


jmp movejoy


aftercheck


jmp main  

movejoy
                    
                 
                        lda $dc00
                        


                      
                        and #15
                        cmp #11  
			beq left
                        cmp #7   
			beq right
			cmp #13   
			beq down
                        cmp #14   
		 	beq up

                        ;cmp #$6f
                        ;beq shoot  




                        ;cmp #10  
			;beq leftup
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
jmp aftercheck


left
lda #2
sta movedir
jmp aftercheck

up 
lda #3
sta movedir
jmp aftercheck

down 
lda #4
sta movedir
jmp aftercheck







     

!source "irq.asm"

!source "movements.asm"



!source "collision.asm"

!source "maprender.asm"



!source "maparrangement.asm" 
 
!source "tables.asm"




 


;waitforv
;wait
;lda $d012
;cmp vsync
;bne wait

 
    
;*=$1000-$7e
;!binary "A_Warm_Place.sid"