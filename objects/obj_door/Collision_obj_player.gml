if locked
    return;
var _actor = 0
var door = id
with (obj_player)
{
    if (state == (146 << 0))
        _actor = 1
}
if ((john && global.panic) || global.horse || _actor)
    return;
if (!(place_meeting(x, y, obj_doorblocked)))
{
    with (other)
    {
        if (key_up && (!instance_exists(obj_jumpscare)) && grounded && (((state == (191 << 0) || state == (198 << 0)) && brick) || state == (0 << 0) || state == (103 << 0) || state == (104 << 0) || state == (58 << 0) || state == (41 << 0) || state == (42 << 0) || state == (153 << 0) || state == (121 << 0) || state == (99 << 0)) && y == (other.y + 50) && (!instance_exists(obj_noisesatellite)) && (!instance_exists(obj_fadeout)) && state != (112 << 0) && state != (95 << 0))
        {
            if (room == tower_5)
            {
                obj_player1.backtohubroom = room
                obj_player1.backtohubstartx = obj_player1.x
                obj_player1.backtohubstarty = obj_player1.y
            }
            obj_player1.lastroom = room
            obj_player2.lastroom = room
            fmod_event_one_shot("event:/sfx/misc/door")
            obj_camera.chargecamera = 0
            ds_list_add(global.saveroom, id)
            if (object_index == obj_player1)
            {
                if obj_player1.isgustavo
                    obj_player1.sprite_index = spr_ratmount_enterdoor
                else
                    obj_player1.sprite_index = obj_player1.spr_lookdoor
            }
            if (object_index == obj_player2)
                obj_player2.sprite_index = obj_player2.spr_lookdoor
            obj_player1.targetDoor = other.targetDoor
            obj_player2.targetDoor = other.targetDoor
            if (other.object_index == obj_goldendoor)
            {
                if (room == tower_1 || room == tower_2 || room == tower_3 || room == tower_4 || room == tower_5)
                    global.optionsbackroom = room
            }
            obj_player1.targetRoom = other.targetRoom
            obj_player2.targetRoom = other.targetRoom
            with (obj_player)
            {
                image_index = 0
                if (state != (186 << 0))
                    state = (112 << 0)
                mach2 = 0
            }
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
            with (obj_player2)
            {
                if instance_exists(obj_coopplayerfollow)
                    state = (186 << 0)
            }
            other.visited = 1
            if (ds_list_find_index(global.saveroom, other.id) == -1)
                ds_list_add(global.saveroom, other.id)
            with (instance_create(x, y, obj_fadeout))
            {
                door_override = 1
                offload_arr = door.offload_arr
                group_arr = door.group_arr
            }
            instance_create((door.x + (door.sprite_width / 2)), (door.y + (door.sprite_height / 2)), obj_doortransition)
        }
    }
}
