##################################################################
# Address: 804d4200
# Codetype: Auto
# Annotation: Allow player to retire at will
##################################################################

#funny story, so this is actually a bit of a hackjob
#as it gives the player air then ends the function
#so I had to set it to use the hold offset for the controller
#purely so it takes 2 frames instead of 1 but uses less ram
#as I don't need to make a flag. in theory someone could lag
#it and get more air for free but this is very unlikely
#unless someone is using a TAS

#load controler pointer
lwz	r29, 0 (r3) #og line lmao 
lbz	r6, 0xA(r29) #trigers (hold mode)

#check if Z is pressed down
andi. r6,r6, 0x8 #Z = 8
beq end #no


code:
#if player is on board
lbz r6, 0x1034(r3)
cmpwi r6, 0x5
beq retire

#if player is out of air
lbz r6, 0x1034(r3)
cmpwi r6, 0x19
bne end

#give air and end function
li r6, 0x7FFF
stw r6, 0x984(r3)
b end

#retire player
retire:
li 	r6, 0x4
stb r6, 0x1034(r3)

#end function (branch to here to end)
end:
