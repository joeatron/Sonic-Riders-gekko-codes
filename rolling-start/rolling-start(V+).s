##################################################################
# Address: 804d41fc
# Codetype: Auto
# Annotation: Rolling start v1.1 (Vanilla+)
##################################################################

#load inputs 
lwz r10, 0(r29)
lbz	r4, 0xf(r10)

#check for A
andi. r4, r4, 0x8
beq	end

#check if player is in start run
statecheck:
lbz	r4, 0x1034 (r29) 
cmpwi r4, 0x1 
bne end

#make player fly temp (funny thing, this just resets player to 5)
li 	r4, 0x19		 #(putting 5 in there does not work, so I did this)
stb r4, 0x1034(r29)

end:
lis	r7, 0x805D		#og line