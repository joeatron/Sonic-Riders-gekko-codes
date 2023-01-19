##################################################################
# Address: 804f4290
# Codetype: Auto
# Annotation: Custom colour menu v3
##################################################################

#load run counter
lis r12, 0x80E1
ori r12, r12, 0x9CE0
lbz r11, 0(r12)

#compare for the run that contrains background
cmpwi r11, 0x1
beq colours


stw r25, 4(r12)
li r11, 0x1
stb r11, 0(r12)
#load colours
colours:
lwz r10, 4(r12)


#AC		-background
lis r11, 0x0000
ori r11, r11, 0x00FF
stw r11, 0x00AC(r10)

#16c	-background animation
lis r11, 0xFF00
ori r11, r11, 0x00FF
stw r11, 0x016C(r10)


end:
lwz	r28, 0x00AC (r25)		#og line




#notes:
#
#0x540 is how far button colour is from menu colour
#0xC0 in size
