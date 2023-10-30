##################################################################
# Address: 	8053b9b0
# Codetype: Auto
# Annotation: random stage, char11cter, board code (joe edition)
##################################################################
lis r10, 0x803E
lbz r10, 0x2990(r10)
cmpwi r10, 5
beq end

lis r11, 0x8060			#load player
ori r11, r11, 0x9440		

lwz r10, 0(r11)
lbz r10, 0xE(r10)		#controller tringgers

andi. r10, r10, 0x2		#l
beq check

lis r10, 0x80E1
ori r10,r10, 0x9CE1		#next to my menu ram address
lbz r3, 0(r10)
not r3, r3				#flips the value from 0 to ff or from ff to 0
stb r3, 0(r10)


check:					#checks if its 0, if its zero it will not run
lis r10, 0x80E1
ori r10,r10, 0x9CE1
lbz r10, 0(r10)
cmpwi r10, 0
beq end

li r3, 0xF				#stages 

lis r10, 0x8053			#go to random number generator (r3 is num to 0)
ori r10, r10, 0xB578
mtlr r10
blrl


cmpwi r3, 0
bne store
li r3, 0x10

store:
lis r10, 0x8061			#store output in to stage
stb r3, 0x29AB(r10)


li r10, 7				#player handler
mtctr r10				#put 8 in to CTR (we want to run it 8 times)

#-----------------------------------
player:					#player loop
li r3, 0x13				#character (V = F, DX = 13)
lis r10, 0x8053
ori r10, r10, 0xB578
mtlr r10
blrl

cmpwi r3, 11
beq player

cmpwi r3, 0x12			#DX only code, moves chaos to inbetween metal and silver, remove for vanilla
bne this				#|
li r3, 0x15				#|
						#|
this:					#|
stb	r3, 0xBA(r11)		#end of DX only code

board:
li r3, 0x28				#board
lis r10, 0x8053
ori r10, r10, 0xB578
mtlr r10
blrl
stb	r3, 0xBB(r11)

cmpwi r3, 18
bne nextplayer

lbz r3, 0xBA(r11)

cmpwi r3, 0x8
beq board
cmpwi r3, 0x9
beq board
cmpwi r3, 0x12
beq board
cmpwi r3, 0x13
beq board


nextplayer:
addi r11, r11, 0x1080
bdnz player				#loop ends, go back to player until CTR = 0
#---------------------------------
end:
lis	r3, 0x8061
# 8053B578 vanilla+ random function