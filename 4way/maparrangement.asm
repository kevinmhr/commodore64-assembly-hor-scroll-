


mapdesignfirstram


clc
lda mapblkheight
adc #$25
adc mapblky
sta mapblkheightt
clc
lda #$25
adc mapblky
tax
 
ldy #0


map
clc

stx zeropageh

lda mapblkofst
sta zeropagel


ldy #0

mapwidth

clc
lda mapblkchar
sta (zeropagel),y
iny 

cpy mapblkwidth
bne mapwidth
 
 

inx
cpx mapblkheightt
bne map

rts



mapdesignsecondram
 clc
lda mapblkheight
adc #$65
adc mapblky
sta mapblkheightt
 
lda #$65
clc
adc mapblky
 

tax
 
ldy #0

mapbottom
 

stx zeropageh 

lda mapblkofst

sta zeropagel


ldy #0

mapwidthbottom

 
lda mapblkchar
sta (zeropagel),y
iny 

cpy mapblkwidth
bne mapwidthbottom
 


inx


cpx mapblkheightt
bne mapbottom


rts



rectanglehollowtop

clc

lda recty
sta mapblky
lda rectwidth
adc rectthick
sta mapblkwidth
lda rectthick
sta mapblkheight
lda rectpos
sta mapblkofst

jsr mapdesignfirstram

clc
lda recty
adc rectheight
sta mapblky 

jsr mapdesignfirstram

clc
lda recty
sta mapblky 
lda rectthick
sta mapblkwidth
lda rectheight
sta mapblkheight

jsr mapdesignfirstram

clc
lda rectpos
adc rectwidth
sta mapblkofst


jsr mapdesignfirstram
rts

rectanglehollowbottom

clc

lda recty
sta mapblky
lda rectwidth
adc rectthick
sta mapblkwidth
lda rectthick
sta mapblkheight
lda rectpos
sta mapblkofst

jsr mapdesignsecondram

clc
lda recty
adc rectheight
sta mapblky 

jsr mapdesignsecondram

clc
lda recty
sta mapblky 
lda rectthick
sta mapblkwidth
lda rectheight
sta mapblkheight

jsr mapdesignsecondram

clc
lda rectpos
adc rectwidth
sta mapblkofst


jsr mapdesignsecondram

rts

maparrangement

;borders 




lda #111
sta mapblkchar
lda #0
sta mapblky 
lda #255
sta mapblkwidth
lda #6
sta mapblkheight
lda #0
sta mapblkofst
jsr mapdesignfirstram


lda #30
sta mapblky 
lda #255
sta mapblkwidth
lda #6
sta mapblkheight
lda #0
sta mapblkofst
jsr mapdesignsecondram


lda #0
sta mapblky 
lda #32
sta mapblkwidth
lda #65
sta mapblkheight
lda #240
sta mapblkofst
 
jsr mapdesignfirstram
jsr mapdesignsecondram





jsr level1

















colbutton
lda #6
sta mapblky 
lda #2
sta mapblkwidth
lda #2
sta mapblkheight
lda #100
sta mapblkofst
lda #255
sta mapblkchar
lda #2
sta col
jsr mapdesignfirstram


rts


level1
;4 small rooms top and down at size 10

lda #1
sta rectthick
lda #97
sta mapblkchar
 
lda #7
sta recty
lda #10
sta rectwidth
lda #10
sta rectheight
lda #80
sta rectpos
jsr rectanglehollowbottom
jsr rectanglehollowtop

lda #50
sta rectpos
jsr rectanglehollowbottom
jsr rectanglehollowtop

;doors for the small rooms at size 10


lda #91
sta mapblkchar
lda #17
sta mapblky 
lda #3
sta mapblkwidth
lda #1
sta mapblkheight


lda #85
sta mapblkofst
jsr mapdesignfirstram
lda #55
sta mapblkofst
jsr mapdesignfirstram
lda #7
sta mapblky 
jsr mapdesignsecondram
lda #85
sta mapblkofst
jsr mapdesignsecondram


;2 rooms top at size 15

lda #50
sta rectpos
lda #95
sta mapblkchar
lda #35
sta recty
lda #15
sta rectwidth
lda #15
sta rectheight
jsr rectanglehollowtop
 
lda rectpos
adc #25
sta rectpos
jsr rectanglehollowtop



;doors for 2 rooms top at size 15

lda #91
sta mapblkchar
lda #35
sta mapblky 
lda #3
sta mapblkwidth
lda #1
sta mapblkheight


lda #80
sta mapblkofst
jsr mapdesignfirstram
lda #55
sta mapblkofst
jsr mapdesignfirstram













lda #20
sta mapblky 
lda #2
sta mapblkwidth
lda #2
sta mapblkheight
lda #31
sta mapblkofst
lda #110
sta mapblkchar
jsr mapdesignsecondram



lda mapblkofst
adc #5
sta mapblkofst
jsr mapdesignsecondram
lda mapblkofst
adc #5
sta mapblkofst
jsr mapdesignsecondram
lda mapblkofst



 
lda #190
sta mapblkwidth
lda #2
sta mapblkheight
lda #41
sta mapblkofst
lda #110
sta mapblkchar
jsr mapdesignsecondram

rts


