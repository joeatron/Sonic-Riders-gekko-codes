#
#music code 
#8009a570 - put here
#

#load player data
lis r6, 0x8044
ori r6, r6, 0xBDC0

#check for character
#lbz r4, 0xBA(r6)
#cmpwi r4, 0xB	#both hyper and super (:
#bne end


#check for gear
lbz r4, 0xBB(r6)
cmpwi r4, 33   #hang on
bne end

#load song address
lis r6, 0x804B
ori r6, r6, 0xE764


#load first part (7a.a)
lis r4, 0x3761
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