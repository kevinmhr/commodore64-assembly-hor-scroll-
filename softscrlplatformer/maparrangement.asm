


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


;bg



lda #64
sta mapblkchar
lda #0
sta mapblky 
lda #255
sta mapblkwidth
lda #100
sta mapblkheight
lda #0
sta mapblkofst
jsr mapdesignfirstram



lda #10
sta mapfillx
bgbarslp
lda mapfillx
clc
adc #20
sta mapfillx

lda mapfillx
sta mapblkofst
lda #1
sta mapblkwidth
lda #30
sta mapblkheight
lda #210
sta mapblkchar
lda #0
sta mapblky 
jsr mapdesignsecondram

lda mapfillx
cmp #250
bne bgbarslp








;borders 





lda #235
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





lda #24
sta mapblky 
lda #5
sta mapblkwidth
lda #6
sta mapblkheight
lda #31
sta mapblkofst
lda #110
sta mapblkchar
jsr mapdesignsecondram



lda mapblkofst
adc #30
sta mapblkofst
jsr mapdesignsecondram
lda mapblkofst
adc #30
sta mapblkofst
jsr mapdesignsecondram





lda mapblkofst
adc #4
sta mapblkofst
lda #24
sta mapblky 

jsr mapdesignsecondram

lda #18
sta mapblky 

jsr mapdesignsecondram
lda mapblkofst
adc #4
sta mapblkofst
lda #12
sta mapblky 

jsr mapdesignsecondram






lda mapblkofst
adc #4
sta mapblkofst
lda #18
sta mapblky 

jsr mapdesignsecondram

lda mapblkofst
adc #4
sta mapblkofst
lda #24
sta mapblky 

jsr mapdesignsecondram


lda mapblkofst
sbc #4
sta mapblkofst
lda #24
sta mapblky 

jsr mapdesignsecondram


lda #1
sta mapblkwidth
lda #1
sta mapblkheight

;clouds
lda #10
sta mapfillx
cloudslp
lda mapfillx
clc
adc #10
sta mapfillx


lda #136
sta mapblkchar

lda mapfillx
sta mapblkofst

lda #5
sta mapblky 
jsr mapdesignsecondram
inc mapblkofst
lda #137
sta mapblkchar
jsr mapdesignsecondram
inc mapblkofst
lda #138
sta mapblkchar
jsr mapdesignsecondram


lda mapfillx
sta mapblkofst

lda #168
sta mapblkchar


lda #6
sta mapblky 
jsr mapdesignsecondram
inc mapblkofst
lda #169
sta mapblkchar
jsr mapdesignsecondram
inc mapblkofst
lda #170
sta mapblkchar
jsr mapdesignsecondram


lda mapfillx
cmp #240
bne cloudslp











;trees






lda #50
sta mapfillx
treeslp
lda mapfillx
clc
adc #10
sta mapfillx

lda mapfillx
sta mapblkofst
lda #1
sta mapblkwidth
lda #1
sta mapblkheight
lda #230
sta mapblkchar
lda #29
sta mapblky 
jsr mapdesignsecondram
lda #231
sta mapblkchar
inc mapblkofst
jsr mapdesignsecondram


lda #198
sta mapblkchar

dec mapblkofst
lda #28
sta mapblky 
jsr mapdesignsecondram
inc mapblkchar
inc mapblkofst
jsr mapdesignsecondram
lda #166
sta mapblkchar



dec mapblkofst
lda #27
sta mapblky 
jsr mapdesignsecondram
inc mapblkchar
inc mapblkofst
jsr mapdesignsecondram


lda #134
sta mapblkchar


dec mapblkofst
lda #26
sta mapblky 
jsr mapdesignsecondram
inc mapblkchar
inc mapblkofst
jsr mapdesignsecondram
lda #170
sta mapblkchar
lda #30
sta mapblky 
lda #2
sta mapblkwidth
lda #5
sta mapblkheight
jsr mapdesignsecondram
lda #0
sta mapblky 


lda mapfillx
cmp #240
bne jmptreeslp



rts

jmptreeslp
jmp treeslp