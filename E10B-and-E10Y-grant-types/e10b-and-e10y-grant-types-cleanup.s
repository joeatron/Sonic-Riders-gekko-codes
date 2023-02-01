##################################################################
# Address: 804ee174
# Codetype: Auto
# Annotation: E10B and E10Y skins grant type
##################################################################

stwu r1, -0x20 (r1)			#store registers
stw r7, 0xC(sp)
stw r10, 0x10(sp)
#----

lis r7, 0x800E
ori r7, r7, 0xD4F4

lbz r10, 0x1029(r3)
lbzx r7, r10, r7			#load indexed 
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


#r3 = player data
