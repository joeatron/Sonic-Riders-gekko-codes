################################################################## 
#Battle Race Mode
# + Mario Tenis Aces Gear (same code, but locked to a gear)
##################################################################





##################################################################
# Address: 80445110
# Codetype: Auto
# Annotation: if gear has been attacked
##################################################################
#for next code us 0x4,5,6,7 - one of these

lis r11, 0x8060
ori r11, r11, 0x9440

li r10, 0x7
mtctr r10

checkforgear:
lbz r10, 0xBB(r11)
cmpwi r10, 0x15 #gear (temporarily power gear)
bne nextplayer
lbz r10, 0x1034(r11)
cmpwi r10, 21
bne nextplayer
lbz r10, 0x4(r29)
subi r10, r10, 0x1
stb	r10, 0x4(r29)


nextplayer:
addi r11, r11, 0x1080 
bdnz checkforgear


stw	r0, 0x0B98 (r29)		#og line

#r29 = victim player data

##################################################################
# Address: 8040c7c0
# Codetype: Auto
# Annotation: kill player
##################################################################
#for next code us 0x4,5,6,7 - one of these
lbz	r10, 0x1034(r30)
cmpwi r10, 5
bne end
lbz r10, 0x4(r30)
cmpwi r10, 0x0
bne end
li r10, 0x4
stb	r10, 0x1034(r30)

end:
lwz	r27, 0 (r30)		#og line

##################################################################
# Address: 80225844
# Codetype: Auto
# Annotation: Reset player health 
##################################################################
li r6, 0x5 
stb r6, 0x4 (r3)
lbz	r6, 0x00BA (r3)