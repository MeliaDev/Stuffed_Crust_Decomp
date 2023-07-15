image_speed = 0.35
with (playerid)
{
    if (!(place_meeting(x, y, obj_uparrowhitbox)))
        instance_destroy(other)
    if ((!grounded) || (state != (0 << 0) && state != (191 << 0)))
        instance_destroy(other)
}
x = playerid.x
y = (playerid.y - 50)
