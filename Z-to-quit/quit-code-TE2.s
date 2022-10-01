##################################################################
# Address: 80052b18
# Codetype: Auto
# Annotation: Allow player to retire at will (TE2 version)
##################################################################

#funny story, so this is actually a bit of a hackjob
#as it gives the player air then ends the function
#so I had to set it to use the hold offset for the controller
#purely so it takes 2 frames instead of 1 but uses less ram
#as I don't need to make a flag. in theory someone could lag
#it and get more air for free but this is very unlikely
#unless someone is using a TAS (this is not important 
#in the TE 2 verison as it runs 3 times a frame and by pure
#luck, it actully works like that)

#load controler pointer
lwz	r10, 0 (r27) #og line lmao 
lbz	r4, 0xA(r10) #trigers (hold mode)

#check if Z is pressed down
cmpwi r4, 0x8 #Z = 8
beq code #yes
b end #no


code:
#if player is on board
lbz r4, 0x1034(r27)
cmpwi r4, 0x5
beq retire

#if player is out of air
lbz r4, 0x1034(r27)
cmpwi r4, 0x19
bne end

#give air and end function
li r4, 0x7FFF
stw r4, 0x984(r27)
b end

#retire player
retire:
li 	r4, 0x4
stb r4, 0x1034(r27)

#end function (branch to here to end)
end:
li	r4, 0