if place_meeting(x, (y - 1), obj_player1)
{
    with (obj_player1)
    {
        if (place_meeting(x, (y + 1), obj_ladder) && (!(place_meeting((other.x + 16), (y + 1), obj_solid))) && key_down && (state == (100 << 0) || ((character == "S" || character == "M") && (state == (0 << 0) || state == (103 << 0)))) && place_meeting(x, (y + 1), obj_platform))
        {
            y += 5
            state = (93 << 0)
            x = (other.x + 16)
            y = floor(y)
            if ((y % 2) == 1)
                y -= 1
        }
        if (key_down && place_meeting(x, (y + 1), obj_ladder) && (!(place_meeting((other.x + 16), (y + 1), obj_solid))) && state == (260 << 0) && place_meeting(x, (y + 1), obj_platform))
        {
            state = (261 << 0)
            if (brick == 1)
            {
                with (instance_create(x, y, obj_brickcomeback))
                {
                    wait = 1
                    instance_create(x, y, obj_genericpoofeffect)
                }
            }
            y += 5
            brick = 0
            x = (other.x + 16)
            y = floor(y)
            if ((y % 2) == 1)
                y -= 1
        }
    }
}
if instance_exists(obj_player2)
{
    if place_meeting(x, (y - 2), obj_player2)
    {
        with (obj_player2)
        {
            if (place_meeting(x, (y + 2), obj_ladder) && (!(place_meeting((other.x + 16), (y + 2), obj_solid))) && key_down && (state == (100 << 0) || (character == "S" && (state == (0 << 0) || state == (103 << 0)))) && place_meeting(x, (y + 1), obj_platform))
            {
                y += 5
                state = (93 << 0)
                x = (other.x + 16)
                y = floor(y)
                if ((y % 2) == 1)
                    y -= 1
            }
        }
    }
}
var theroomname = room_get_name(room)
if (string_pos("mansion", theroomname) != 0)
    mansionoverride = 1
if mansionoverride
    visible = true
else if instance_exists(obj_debugcontroller)
    visible = obj_debugcontroller.showcollisions
with (obj_laddermiddlepart)
{
    visible = other.visible
    depth = other.depth
}
