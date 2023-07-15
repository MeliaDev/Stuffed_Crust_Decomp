image_speed = 0.35
hsp = 0
vsp = 0
hsp_carry = 0
vsp_carry = 0
platformid = -4
grav = 0.5
part = 0
partx = 0
party = 0
if place_meeting(x, y, obj_solid)
{
    y = 16
    part = 1
    partx = x
    party = y
    alarm[0] = 1
}
if place_meeting(x, y, obj_solid)
    x = clamp(x, 96, (room_width - 96))
if ((obj_player.character == "P" && obj_player.ispeppino == 0) || obj_player.character == "N")
    sprite_index = spr_bossfight_noiseHP
