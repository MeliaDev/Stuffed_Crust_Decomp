if (obj_player1.state == (208 << 0))
{
}
if (obj_player1.state == (290 << 0))
    return;
if instance_exists(obj_jumpscare)
{
}
var hall = id
with (other)
{
    if (!other.savedposition)
    {
        other.savedposition = 1
        other.savedx = x
        other.savedy = y
    }
    x = other.savedx
    y = other.savedy
    if (!instance_exists(obj_fadeout))
    {
        var _x = (x - other.x)
        var _percentage = (_x / other.sprite_width)
        obj_player1.vertical_x = _percentage
        obj_player2.vertical_x = _percentage
        obj_player1.verticalhall_vsp = vsp
        obj_player2.verticalhall_vsp = vsp
        obj_player1.lastroom = room
        obj_player2.lastroom = room
        obj_player1.targetDoor = other.targetDoor
        obj_player1.targetRoom = other.targetRoom
        obj_player1.verticalhallway = 1
        obj_player2.verticalhallway = 1
        obj_player1.vhallwaydirection = sign(other.image_yscale)
        obj_player2.vhallwaydirection = sign(other.image_yscale)
        obj_player1.hallway = 0
        obj_player2.hallway = 0
        if instance_exists(obj_player2)
        {
            obj_player2.targetDoor = other.targetDoor
            obj_player2.targetRoom = other.targetRoom
        }
        other.visited = 1
        fmod_event_one_shot("event:/sfx/misc/door")
        with (instance_create(x, y, obj_fadeout))
        {
            offload_arr = hall.offload_arr
            group_arr = hall.group_arr
        }
    }
    if (state == (37 << 0))
    {
        trace("climbwall verticalhallway")
        verticalbuffer = 10
        verticalstate = (37 << 0)
        var i = 0
        x = floor(x)
        while (!(scr_solid((x + xscale), y)))
        {
            x += xscale
            i++
            if (i > room_width)
                break
            else
                continue
        }
    }
}
