##################################################################
# Address: 8053fa38
# Codetype: Auto
# Annotation: L = random stage on CSS te2 (for TurboStar person)
##################################################################
lwz r10, 0(r23)
lbz r10, 0xE(r10)

andi. r10, r10, 0x2
beq end


#generate random number
li r3, 0xF

lis r10, 0x8053
ori r10, r10, 0xf554
mtlr r10
blrl 

cmpwi r3, 0
bne store
li r3, 0x10
store:
lis r10, 0x8062
ori r10, r10, 0x35AB
stb r3, 0(r10)

end:
lis	r3, 0x806C		#og line
