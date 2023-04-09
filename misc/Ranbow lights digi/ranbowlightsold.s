##################################################################
# Address: 8057e554 
# Codetype: Auto
# Annotation: ranbow lights in digi
##################################################################

#first 4 bytes, can make cool effects
li	r7, 0	
stw r7, 0x20(r25)


#second word, what I am using to make colours

#colour (this does a colour cycle, no idea why)
lis r7, 0x0001
ori r7, r7, 0xB613



stw r7, 0x24(r25)		
	
	
	
	
end:
li	r7, 0		#OG line	

#------------------------------------
#Notes:
#809924D0 - Wipe for pure colours
#809924D4 - mess around with (Null, first nibble needs to be even, edit, edit)
#r25 = 809924b0
