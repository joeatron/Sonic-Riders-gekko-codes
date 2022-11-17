##################################################################
# Address: 804f4290
# Codetype: Auto
# Annotation: Green menu v2
##################################################################

#load run counter
lis r12, 0x80E1
ori r12, r12, 0x9CE0
lbz r11, 0(r12)

#compare for the run that contrains background
cmpwi r11, 0x1
beq end 

#load green screen
loadgreen:
lis r11, 0x00AA
ori r11, r11, 0x00FF
stw r11, 0x00AC(r25)


end:
li r11, 0x1			#bump counter
stb r11, 0(r12)
lwz	r28, 0x00AC (r25)		#og line