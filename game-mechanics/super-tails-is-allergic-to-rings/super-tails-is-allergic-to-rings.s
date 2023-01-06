##################################################################
# Address: 804880b8
# Codetype: Auto
# Annotation: super tails is allergic to rings
##################################################################

#This address is in a function that handles when a player touches a ring
#the exact possition is where it loads the levels, so the code only activates
#when a player touches a coin, this is why the code is so short as I only
#need to check for Super Tails and kill the player if it is.


#check for super tails super tails
lhz r3, 0xBA(r21)			#load character and board from player data
cmpwi r3, 0x0112			#compare both of them
bne end						#if not skip code


#kill player
li r3, 0x4					#0x4 = retire
stb r3, 0x1034(r21)			#0x1034 = player state


end:
lbz	r3, 0x102E (r21)		#OG line (loads levels in to R3)