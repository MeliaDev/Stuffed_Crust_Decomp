if (!unlocked)
    return;
var _actor = 0
var door = id
with (obj_player)
{
    if (state == (146 << 0))
        _actor = 1
}
if _actor
    return;
if global.horse
    return;
if (!(place_meeting(x, y, obj_doorblocked)))
{
    with (other)
    {
        if (key_up && (!instance_exists(obj_jumpscare)) && other.sprite_index == spr_elevatoropen && grounded && (state == (0 << 0) || state == (103 << 0) || state == (104 << 0) || state == (58 << 0) || state == (121 << 0) || state == (99 << 0)) && ((character != "M" && y == (other.y + 50)) || (character == "M" && y == (other.y + 55))) && (!instance_exists(obj_noisesatellite)) && (!instance_exists(obj_fadeout)) && state != (112 << 0) && state != (95 << 0))
        {
            obj_player1.lastroom = room
            obj_player2.lastroom = room
            fmod_event_one_shot("event:/sfx/misc/door")
            obj_camera.chargecamera = 0
            ds_list_add(global.saveroom, id)
            if (object_index == obj_player1)
                obj_player1.sprite_index = obj_player1.spr_lookdoor
            if (object_index == obj_player2)
                obj_player2.sprite_index = obj_player2.spr_lookdoor
            obj_player1.targetDoor = other.targetDoor
            obj_player1.targetRoom = other.targetRoom2
            obj_player2.targetDoor = other.targetDoor
            obj_player2.targetRoom = other.targetRoom2
            obj_player.image_index = 0
            obj_player.state = (112 << 0)
            obj_player.mach2 = 0
            if (instance_exists(obj_player2) && global.coop == 1)
            {
                if (object_index == obj_player2)
                {
                    obj_player1.x = obj_player2.x
                    obj_player1.y = obj_player2.y
                }
                if (object_index == obj_player1)
                {
                    obj_player2.x = obj_player1.x
                    obj_player2.y = obj_player1.y
                }
            }
            other.visited = 1
            instance_create(x, y, obj_fadeout)
            instance_create((door.x + (door.sprite_width / 2)), (door.y + (door.sprite_height / 2)), obj_doortransition)
        }
    }
}
