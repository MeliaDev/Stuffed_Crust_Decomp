global.switchbuffer = 0
image_speed = 0.35
playerid = obj_player1.id
image_xscale = 1
escape = 0
depth = -5
palettespr = spr_peppalette
switchspr1 = spr_peppinoswitch1
switchspr2 = 1798
if (obj_player.character == "N" || (obj_player.character == "P" && obj_player.ispeppino == 0))
{
    palettespr = spr_noisepalette
    switchspr1 = 1410
    switchspr2 = 1179
}
sprite_index = switchspr1
