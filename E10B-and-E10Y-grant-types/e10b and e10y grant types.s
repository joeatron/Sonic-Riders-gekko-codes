##################################################################
# Address: 817e38e4
# Codetype: Auto
# Annotation: E10B and E10Y skins grant type
##################################################################

#replace with a UI code instead, so edit the texture loaded instead of type changes due to a old code still being in the game

#lis r11, 0x800E
#ori r11, r11, 0xD4F4
#lbz r10, 0x1029(r3)
#lbzx r11, r10, r11

#lbz r10, 0xBA(r5)
#cmpwi r10, 0xF
#beq r10B
#cmpwi r10, 0x10
#bne end

#E10Y
#cmpwi r11, 0x1
#bne E10R

#b store

#E10R:


#b store

#E10B:
#cmpwi r11, 0x1
#bne E10G

#b store


#E10G:


#store:
#stw r10, 0xBD0(r5)

#end:
#---------------------------------
#stbx	r9, r4, r8


#notes:
#E10B is skin 1 of E10G
#E10Y is skin 1 of E10Y



#player pointer is in R5
#current texture is r9
#player index is r8
#texture pointer is r4



#---------------------------------
#types 
# Gears still grant types and normal type version
# address: 804ee174
#-------------------------------------
stwu r1, -0x20 (r1)			#store registers
stw r7, 0xC(sp)
stw r10, 0x10(sp)
#----

lis r7, 0x800E
ori r7, r7, 0xD4F4

lbz r10, 0x1029(r3)
lbzx r7, r10, r7
cmpwi r7, 0x1
bne end

lbz r10, 0xBA(r3)
cmpwi r10, 0xF
beq E10B
cmpwi r10, 0x10
bne end

#E10Y
li r6, 0x2
b end

E10B:
li r6, 0x1


end:
stw r6, 0xBD0(r3)
#load registers back to what they were before code
lwz r7, 0xC(sp)
lwz r10, 0x10(sp)
addi r1, r1, 0x20

#stw    r0, 0x0BD0 (r3)

