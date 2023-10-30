#music randomiser SRDX2023
#8009A5AC

#store registers
stwu r1, -0x20 (r1)			
stw r4, 8(sp)
stw r5, 0xC(sp)
mflr r4						
stw r4, 0x10(sp)

#run random function
li r3, 0x6E #temp
lis r8, 0x8053
ori r8, r8, 0xB578
mtlr r8
blrl


#put starting values
li r9, 0x30
li r8, 0x2F #song ID 00 - 1 (00 = 3030)
mtctr r3

#R9 will be top half
#R8 will be bottom half

loop:
addi r8, r8, 0x1


#adjust by 0x7 for ascii value offset
cmpwi r8, 0x3A
bne _40check
addi r8, r8, 0x7

#check for ascii 0x40
_40check:
cmpwi r8, 0x47
bne _4Ccheck
subi r8, r8, 0x17 #reset R8 to 0x30 (0)
addi r9, r9, 0x1 #add 1

#runs once, puts r9 to 70
_4Ccheck:
cmpwi r9, 0x34
bne _74check
cmpwi r8, 0x43
bne _74check
addi r9, r9, 0x3
subi r8, r8, 0x13

#puts 90 in to it from 74 (as there are only 4 70 songs)
_74check:
cmpwi r9, 0x37
bne _98check
cmpwi r8, 0x34
bne _98check

addi r9, r9, 0x2
subi r8, r8, 0x4

_98check: #takes you to S)
cmpwi r9, 0x39
bne S9check
cmpwi r8, 0x39
bne S9check

#load S in to r9
addi r9, r9, 0x1A
subi r8, r8, 0x8 #we start at S1 not S0

S9check:
cmpwi r9, 0x53 #S
bne loopagain
cmpwi r8, 0x39 
bne loopagain

#move on to the misc songs that don't fit XX.adx
mfctr r10
b _3longsongs


loopagain:
bdnz loop

#8068c9e0 # for debugging purposes 
store:
slwi r9, r9, 8
add r8, r9, r8

lis r9, 0x8067
ori r9, r9, 0xBDE0    

#<ID>.A
slwi r8, r8, 16
ori r8, r8, 0x2E41
stw r8, 4(r9)

#DX__
lis r8, 0x4458
ori r8, r8, 0x0000
stw r8, 8(r9)
b end


#we can optimise the space on this even more as all of these songs 
#are SXX (3 bytes long), so there no longer is a need to store the 
#last 8 bytes as we can enter that all in 1 go


_3longsongs:
bl list
mflr r9

slwi r10, r10, 2 #multiply by 4 to make it contain entire 4 bytes
lwzx r8, r9, r10
#8067BDE4
lis r9, 0x8067
ori r9, r9, 0xBDE0     



stw r8, 4(r9)

#ADX
lis r8, 0x4144
ori r8, r8, 0x5800
stw r8, 8(r9)
b end

list:
blrl
.4byte 0x5332302E
.4byte 0x5333302E
.4byte 0x5332312E
.4byte 0x5332322E
.4byte 0x5332332E
.4byte 0x5356312E
.4byte 0x5336302E
.4byte 0x5336312E
.4byte 0x5336322E
.4byte 0x5336332E



end:

#load registers back to what they were before code
lwz r4, 0x10(sp)
mtlr r4  
lwz r4, 8(sp)
lwz r5, 0xC(sp)
addi r1, r1, 0x20
lwz	r4, 0x00AC (r30)#og line
