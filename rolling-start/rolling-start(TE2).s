##################################################################
# Address: 8040d9dc (in AI check function)
# Codetype: Auto
# Annotation: Rolling start v1.1 (TE 2.0)
##################################################################

#load inputs 
lwz r10, 0(r3)
lbz	r4, 0xf(r10)

#check for A
andi. r4, r4, 0x8
beq	end

#check if player is in start run
statecheck:
lbz	r4, 0x1034 (r3) 
cmpwi r4, 0x1 
bne end

#make player fly temp (funny thing, this just resets player to 5)
li 	r4, 0x19		 #(putting 5 in there does not work, so I did this)
stb r4, 0x1034(r3)

end:
lwz	r4, 0 (r3)		#og line