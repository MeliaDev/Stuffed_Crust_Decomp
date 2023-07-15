hsp = 0
vsp = 0
grav = 0.5
hsp_carry = 0
vsp_carry = 0
platformid = -4
thrown = 0
hithsp = 0
hitvsp = 0
destroy = 0
clone = 0
image_speed = 0.35
alarm[0] = 10
while place_meeting(x, y, obj_solid)
{
    if (x > (room_width / 2))
        x--
    else
        x++
}
