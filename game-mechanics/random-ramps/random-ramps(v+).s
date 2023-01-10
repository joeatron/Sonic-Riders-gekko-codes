##################################################################
# Address: 803fee48
# Codetype: Auto
# Annotation: random ramps
##################################################################


lbz	r7, 0x09F9 (r28)
cmpwi r7, 0x1
beq dumb
cmpwi r7, 0x0
beq dumb

li r3, 0x6
b random

dumb:
li r3, 0x2

random:
lis r7, 0x8053
ori r7, r7, 0xB578
mtlr r7       
blrl

stb r3, 0x09F9 (r28)

lbz	r7, 0x09F9 (r28)