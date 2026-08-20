
collision



ldx entnum
lda #0
sta collisionu,x 
sta collisiond,x 

lda #$d0
sta zeropage2h

lda entnum 
clc
adc #1
sta zeropage2l
ldy #0
lda (zeropage2l),y
clc
sbc #46
tax
lda charsprtab,x
 
clc

tax


lda bufferaddressh,x
adc xoffseth
sta zeropageh
lda bufferaddressl,x
adc xoffset 
sta zeropagel 

lda entnum 
sta zeropage2l
ldy #0
lda (zeropage2l),y
sbc xscroll
tax
ldy entnum
lda $d010
and entnumforpage,y
cmp entnumforpage,y
bne mainpagespritecu

lda charsprtab+236,x

jmp hordetectiondoneu

mainpagespritecu

lda charsprtab-18,x

hordetectiondoneu

tay

 
 
lda (zeropagel),y

cmp noncolidchar

bne checkothercharu

jmp endofcollisionchecku

checkothercharu
cmp noncolidchar2
beq endofcollisionchecku

ldx entnum
lda #1
sta collisionu,x



endofcollisionchecku

 

ldy #0
lda entnum 
clc
adc #1
sta zeropage2l
 
lda (zeropage2l),y

clc

sbc #26
tax

lda charsprtab,x
 

tax
clc

lda bufferaddressh,x
adc xoffseth
sta zeropageh
lda bufferaddressl,x
adc xoffset 
sta zeropagel 




lda entnum 
sta zeropage2l
ldy #0
lda (zeropage2l),y
sbc xscroll
tax
ldy entnum
lda $d010
and entnumforpage,y
cmp entnumforpage,y
bne mainpagespritecd

lda charsprtab+236,x

jmp hordetectiondoned

mainpagespritecd

lda charsprtab-18,x

hordetectiondoned

tay


lda (zeropagel),y

cmp noncolidchar

bne checkotherchard




jmp endofcollisioncheckd

checkotherchard
cmp noncolidchar2
beq endofcollisioncheckd




ldx entnum
lda #1
sta collisiond,x

endofcollisioncheckd



ldx entnum
lda #0
sta collisionr,x  
sta collisionl,x 


lda entnum 
adc #0
sta zeropage2l
ldy #0
lda (zeropage2l),y



clc
sbc #44
tax



lda charsprtab,x
clc
tax


lda bufferaddressh,x
adc xoffseth
sta zeropageh
lda bufferaddressl,x
adc xoffset 
sta zeropagel 

lda entnum 
sta zeropage2l
ldy #0
lda (zeropage2l),y
sbc xscroll
tax
ldy entnum
lda $d010
and entnumforpage,y
cmp entnumforpage,y
bne mainpagespritecr

lda charsprtab+240,x

jmp hordetectiondoner

mainpagespritecr

lda charsprtab-10,x

hordetectiondoner

tay

lda (zeropagel),y
cmp noncolidchar
bne checkothercharr
inc zeropageh
lda (zeropagel),y
cmp noncolidchar
bne checkothercharr



jmp endofcollisioncheckr
checkothercharr
cmp noncolidchar2
beq endofcollisioncheckr

ldx entnum
lda #1
sta collisionr,x

endofcollisioncheckr

lda entnum 
adc #0
sta zeropage2l
ldy #0
lda (zeropage2l),y




clc
sbc #44
tax




lda charsprtab,x

clc
tax

lda bufferaddressh,x
adc xoffseth
sta zeropageh
lda bufferaddressl,x
adc xoffset 
sta zeropagel 


lda entnum 
sta zeropage2l
ldy #0
lda (zeropage2l),y
sbc xscroll
tax
ldy entnum
lda $d010
and entnumforpage,y
cmp entnumforpage,y
bne mainpagespritecl

lda charsprtab+240,x

jmp hordetectiondonel

mainpagespritecl

lda charsprtab-16,x

hordetectiondonel

tay
dey
 
lda (zeropagel),y
cmp noncolidchar
bne checkothercharl
inc zeropageh
lda (zeropagel),y
cmp noncolidchar
bne checkothercharl


jmp endofcollisioncheckl

checkothercharl
cmp noncolidchar2
beq endofcollisioncheckl
ldx entnum
lda #1
sta collisionl,x



endofcollisioncheckl


lda entnum
cmp #0
beq jmpcollisionb0

 


jmp collisionb



jmpcollisionb0
jmp collisionb0


 

