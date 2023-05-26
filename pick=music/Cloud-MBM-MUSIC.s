##################################################################
# Address: 8003dc28
# Codetype: Auto
# Annotation: KX-LEG-MUSIC
##################################################################
stwu	r8, 0x0004 (r7)		#og line


#player data
lis r10, 0x8061 
ori r10, r10, 0xA040 

#run it 8 times
li r12, 7
mtctr r12


PlayerCheck:
lbz r8, 0xBB(r10) #check board
cmpwi r8, 0x11 # if leg
beq Music #go to music
addi r10, r10, 0x1080 #go to player 2 data
bdnz PlayerCheck #
bne end

Music:
lis r9, 0x8068			#8068C9E4 - string, music 37 34 2E 41 44 58
ori r9, r9, 0xc9e0 

lis r8, 0x3734
ori r8, r8, 0x2E41
stw r8, 4(r9)

lis r8, 0x4458
ori r8, r8, 0x0000
stw r8, 8(r9)
b end



end:
#og line
