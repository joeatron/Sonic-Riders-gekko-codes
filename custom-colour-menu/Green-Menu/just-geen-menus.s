##################################################################
# Address: 804f4290
# Codetype: Auto
# Annotation: Green menu
##################################################################

lis r11, 0x00AA
ori r11, r11, 0x00FF

stw r11, 0x00AC(r25)
lwz	r28, 0x00AC (r25)
