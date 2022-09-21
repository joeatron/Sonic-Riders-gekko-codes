##################################################################
# Address: 80411c18
# Codetype: Auto
# Annotation: X to fly (y to fly but TE 1.4X, DX1 and 2 compatable)
##################################################################

lwz r10, 0(r29)
lbz	r4, 0xb(r10)

#for Y to fly change 0x4 to 0x8
cmpwi r4, 0x4
beq	button
b end

button:
li 	r4, 0x13
stb r4, 0x1034(r29)

end:
lbz	r0, 0x1034 (r29)
