#
#music code 
#8009a730 - put here
#

#load player data
lis r6, 0x8053
ori r6, r6, 0x2100
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
#load song address
lis r6, 0x805A
ori r6, r6, 0x4AA4


#load first part (7c.a)
lis r4, 0x3763
ori r4, r4, 0x2E61


#store
stw r4, 0x0(r6)

#load second half (dx  )
lis r4, 0x6478
ori r4, r4, 0x0000


#store 
stw r4, 0x4(r6)

#skip
end:
lwz	r4, 0x00AC (r30) #og line


#r4, r3 and r6 are free
#https://www.rapidtables.com/convert/number/ascii-to-hex.html - use this site for help



#805321BA


#8003ddac


