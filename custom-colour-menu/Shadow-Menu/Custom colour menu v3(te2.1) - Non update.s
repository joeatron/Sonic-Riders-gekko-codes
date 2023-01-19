##################################################################
# Address: 804f7fc4
# Codetype: Auto
# Annotation: 17/01/2023 - Green menu TE 2.1 version (not updating TE as they are going to release a new version soon)
##################################################################

#load run counter
lis r12, 0x80E1
ori r12, r12, 0x9CE0
lbz r11, 0(r12)

#compare for the run that contrains background
cmpwi r11, 0x1
beq end 

#work out colour
lis r11, 0x0000
ori r11, r11, 0x00FF
stw r11, 0x00AC(r25)

#16c	-background animation
lis r11, 0xFF00
ori r11, r11, 0x00FF
stw r11, 0x016C(r25)


end:
li r11, 0x1			#bump counter
stb r11, 0(r12)
lwz	r28, 0x00AC (r25)		#og line
