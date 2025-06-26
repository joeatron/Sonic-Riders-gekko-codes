#
#music code 
#8005e2ac - put here (TE 2.4.5.2)
#

#load player data TE 2.4.5.2
lis r6, 0x8053
ori r6, r6, 0x19E0
li r4, 0x8

mtctr r4
loop:

#check for character
lbz r4, 0xBA(r6)
cmpwi r4, 0x0B	#SS
beq loadsong			#comment this out if you plan on locking it to a gear as well

### uncomment all of this for gears to be a factor as well
#bne loopagain

#check for gear
#lbz r4, 0xBB(r6)
#cmpwi r4, 0x22   #SHO
#beq loadsong

loopagain:
addi r6, r6, 0x1080
bdnz loop
b end

loadsong:
#load song address TE 2.4.5.2
lis r6, 0x805A
ori r6, r6, 0x43A4


#load first part (SH11)
lis r4, 0x5348
ori r4, r4, 0x3131


#store
stw r4, 0x0(r6)

#load second half (.ADX)
lis r4, 0x2E41
ori r4, r4, 0x4458


#store 
stw r4, 0x4(r6)

#skip
end:
lwz	r4, 0x00AC (r30) #og line


#r4, r3 and r6 are free
#https://www.rapidtables.com/convert/number/ascii-to-hex.html - use this site for help

