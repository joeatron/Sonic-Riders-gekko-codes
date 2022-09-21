##################################################################
# Address: 804108F0
# Codetype: Auto
# Annotation: X/Y to fly (TE-2.0 compatable version)
##################################################################

lwz r10, 0(r24)
lbz	r12, 0xb(r10)

#for Y to fly change 0x4 to 0x8
cmpwi r12, 0x4
beq	button
b end

button:
li 	r12, 0x13
stb r12, 0x1034(r24)

end:
lbz	r3, 0x1034 (r24)
