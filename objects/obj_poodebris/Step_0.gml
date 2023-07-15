if (place_meeting(x, y, obj_player) && instance_place(x, y, obj_player).state == (100 << 0))
    standbuffer++
else
    standbuffer = 0
if (standbuffer >= 600)
{
    standbuffer = 0
    notification_push((52 << 0), [room])
}
