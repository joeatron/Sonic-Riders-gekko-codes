##################################################################
# Address: 	80510e5c 
# Codetype: Auto
# Annotation: random stage, char5cter, board code (joe edition)
##################################################################0
lis r5, 0x8060			#load player
ori r5, r5, 0x9440		

li r3, 0xF				#stages 

lis r6, 0x8053			#go to random number generator (r3 is num to 0)
ori r6, r6, 0xB578
mtlr r6
blrl


cmpwi r3, 0
bne store
li r3, 0x10

store:
lis r6, 0x8061			#store output in to stage
stb r3, 0x29AB(r6)


li r6, 7				#player handler
mtctr r6				#put 8 in to CTR (we want to run it 8 times)

#-----------------------------------
player:					#player loop
li r3, 0x13				#character (V = F, DX = 13)
lis r6, 0x8053
ori r6, r6, 0xB578
mtlr r6
blrl

cmpwi r3, 11
beq player

cmpwi r3, 0x12			#DX only code, moves chaos to inbetween metal and silver, remove for vanilla
bne this				#|
li r3, 0x15				#|
						#|
this:					#|
stb	r3, 0xBA(r5)		#end of DX only code

board:
li r3, 0x28				#board
lis r6, 0x8053
ori r6, r6, 0xB578
mtlr r6
blrl
stb	r3, 0xBB(r5)
cmpwi r3, 18
bne nextplayer

#
lbz r3, 0xBA(r5)

cmpwi r3, 0x8
beq board
cmpwi r3, 0x9
beq board
cmpwi r3, 0x12
beq board
cmpwi r3, 0x13
beq board


nextplayer:
addi r5, r5, 0x1080
bdnz player				#loop ends, go back to player until CTR = 0
#---------------------------------
end:
lis	r4, 0x8061
# 8053B578 vanilla+ random function








#types 
# Gears still grant types and normal type version
# address: 804ee174
#-------------------------------------
stwu r1, -0x20 (r1)			#store registers
stw r4, 8(sp)
stw r3, 0xC(sp)
mflr r4						
stw r4, 0x10(sp)
stw r0, 0x14(sp)

#mr r7, r3

li r3,  4					#call random function
lis r4, 0x8053
ori r4, r4, 0xB578
mtlr r4       
blrl

addi r3, r3, 0x1            #add 1 to type due to how computers work

#ok funny bit here to put no type (0x8) in to the game
cmpwi r3, 0x3
bne typegearcheck
li r3, 0x8


#check if the gear is a type giving gear
typegearcheck:
lwz r7, 0xC(sp)
lbz r4, 0xbb(r7)

cmpwi r4, 0x8 #access
beq flyadd
cmpwi r4, 0x1C #destroyer
beq poweradd
cmpwi r4, 0x1D #Omnipotence
beq all
cmpwi r4, 0x24 #grinder
beq addspeed
lbz r4, 0xBA(r7)
cmpwi r4, 0xB #SuperSonic
bne store
li r3, 0x7
b store

addspeed:
ori r3, r3, 0x1
b store

flyadd:
ori r3, r3, 0x2
b store

poweradd:
ori r3, r3, 0x4

store:
stw r3, 0xBD0(r7)			#store value	


#load registers back to what they were before code
lwz r4, 0x10(sp)
mtlr r4  
lwz r4, 8(sp)
mr r3, r7
lwz r0, 0x14(sp)
addi r1, r1, 0x20
#stw    r0, 0x0BD0 (r3)




#types 
# all types version
# address:  804ee174
#-------------------------------------
stwu r1, -0x20 (r1)
stw r4, 8(sp)
stw r3, 0xC(sp)
mflr r4
stw r4, 0x10(sp)
stw r0, 0x14(sp)
#mr r7, r3
li r3, 7
lis r4, 0x8053
ori r4, r4, 0xB578
mtlr r4       
blrl
addi r3, r3, 0x1             #add 1 to type
lwz r7, 0xC(sp)
stw r3, 0xBD0(r7)
lwz r4, 0x10(sp)
mtlr r4  
lwz r4, 8(sp)
mr r3, r7
lwz r0, 0x14(sp)
addi r1, r1, 0x20
#stw    r0, 0x0BD0 (r3)


#notes about the address used by this code:
#r7 is the player address
#r5 is the gear address


#gears effected by code to fix
#grinder - speed 0x24
#destroyer - power
#omni - all
#access - fly - 		0x8
#Note = Broom would also be here if it did not loose this in DX and TE


#Types:
#0x1 = speed
#0x2 = fly
#0x3 = speed+fly 
#0x4 = power
#0x5 = power+speed 
#0x6= power+fly 
#0x7 = all type 
#0x8 = no type


