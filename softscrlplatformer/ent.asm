

entityindex



ldy xoffseth
sbc sprchartab,y
adc #64
ldx #2
sta enty,x
ldx #4
sta enty,x
ldx #6
sta enty,x
ldx #8
sta enty,x







lda #2
sta entnum
jmp entity
entityb2

lda #4
sta entnum
jmp entity
entityb4


lda #6
sta entnum
jmp entity
entityb6

entityb8

entityb10

entityb12

entityb14


jmp entityindexb






entity

jmp collision
collisionb




ldx entnum


lda collisionl,x
cmp #1
beq reverseentr


;lda collisionu,x
;cmp #1
;beq reverseentl

lda collisionr,x
cmp #1
beq reverseentl

;lda collisiond,x
;cmp #1
;beq reverseentr



jmp moveent

reverseentr
 
lda #0
sta entdiry,x
lda #1
sta entdirx,x


jmp moveent


reverseentl
 
lda #0
sta entdiry,x
lda #2
sta entdirx,x


jmp moveent



reverseentu
 
lda #0
sta entdirx,x


lda #1
sta entdiry,x


jmp moveent




reverseentd
 

lda #0
sta entdirx,x


lda #2
sta entdiry,x



moveent


lda entdirx,x
cmp #1
beq moveentright
cmp #2
beq moveentleft


lda entdiry,x
cmp #1
beq moveentup
cmp #2
beq moveentdown


jmp moveentnot




moveentright

 
ldx entnum
lda entnumforspritepage,x
tay 
lda #138
clc
adc entanim,x
sta $7f8,y
 

lda #0
sta entdiry,x

inc entx,x


lda entx,x
cmp #255

beq changepage2forent


jmp moveentnot


changepage2forent
ldx entnum

lda #0
sta entx,x

lda $d010
and #%11111111
ora entnumforpage,x
sta $d010




jmp moveentnot


moveentup
 

lda #0
sta entdirx,x

ldx entnum
lda entnumforspritepage,x
tay 
lda #138
clc
adc entanim,x
sta $7f8,y




dec enty,x

jmp moveentnot

moveentdown
 
ldx entnum
lda #0
sta entdirx,x

ldx entnum
lda entnumforspritepage,x
tay 
lda #136
clc
adc entanim,x
sta $7f8,y



inc enty,x

jmp moveentnot


moveentleft
 
lda #0
sta entdiry,x

ldx entnum
lda entnumforspritepage,x
tay 
lda #136
clc
adc entanim,x
sta $7f8,y

dec entx,x


lda entx,x
cmp #255
beq changepage1forent


jmp moveentnot

changepage1forent


lda $d010
and #%11111111
eor entnumforpage,x
sta $d010



moveentnot

 

clc
inc entitymovetime,x
lda entitymovetime,x
ora #%00011111
sta entitymovetime,x
adc #%00000111
bcs animateent

jmp notanimateent

animateent
ldx entnum
inc entanim,x
notanimateent
lda entanim,x
cmp #3
beq zeroentanim
jmp notzeroentanim
zeroentanim
 
lda #1
sta entanim,x
notzeroentanim




ldx entnum

 


ldy xoffseth

sbc sprchartab,y
adc #64
sta enty,x


lda entx,x
sta $d000,x
 

lda enty,x
inx
sta $d000,x




ldx entnum

lda $d010

and entnumforpage,x
cmp entnumforpage,x
beq checkforentx
jmp notcheckforentx
checkforentx
lda entx,x
cmp #100
beq resetentpage
jmp notcheckforentx
resetentpage
lda $d010
and #%11111111
eor entnumforpage,x
sta $d010
notcheckforentx




lda entnum
cmp #2
beq nextback2
cmp #4
beq nextback4
cmp #6
beq nextback6
cmp #8
beq nextback8
cmp #10
beq nextback10
cmp #12
beq nextback12
cmp #14
beq nextback14

jmp $ea81
nextback2
jmp entityb2
nextback4
jmp entityb4
nextback6
jmp entityb6
nextback8
jmp entityb8
nextback10
jmp entityb10
nextback12
jmp entityb12
nextback14
jmp entityb14




