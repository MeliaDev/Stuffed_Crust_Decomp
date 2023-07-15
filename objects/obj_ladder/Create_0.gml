depth = 7
visible = false
spr = spr_ladder
debounce = 0
previ = -4
mansionoverride = 0
var theroomname = room_get_name(room)
if (string_pos("mansion", theroomname) != 0)
    mansionoverride = 1
for (var i = 1; i < (image_yscale - 1); i++)
{
    with (instance_create(x, (y + (32 * i)), obj_laddermiddlepart))
    {
        visible = other.visible
        depth = other.depth
    }
}
