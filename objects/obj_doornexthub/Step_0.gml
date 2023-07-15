var _save = 0
var door = id
if (key && (obj_player1.state == (0 << 0) || obj_player1.state == (103 << 0) || obj_player1.state == (58 << 0) || obj_player1.state == (104 << 0) || obj_player1.state == (121 << 0) || obj_player1.state == (99 << 0)) && sprite_index == spr_elevatorlocked && obj_player1.key_up && obj_player1.grounded && place_meeting(x, y, obj_player1))
{
    _save = 1
    ds_list_add(global.saveroom, id)
    obj_player1.state = (98 << 0)
    obj_player1.image_index = 0
    if (instance_exists(obj_player2) && global.coop == 1)
    {
        obj_player2.x = obj_player1.x
        obj_player2.y = obj_player1.y
        obj_player2.state = (98 << 0)
        obj_player2.image_index = 0
    }
    image_index = 0
    sprite_index = spr_elevatoropening
    fmod_event_one_shot_3d("event:/sfx/misc/elevatorstart", x, y)
    fmod_event_one_shot_3d("event:/sfx/misc/keyunlock", x, y)
    image_speed = 0.35
    obj_player1.sprite_index = obj_player1.spr_victory
    obj_player2.sprite_index = obj_player2.spr_victory
    with (instance_create((x + 50), (y + 50), obj_lock))
        sprite_index = spr_elevatorlock
    global.key_inv = 0
    instance_destroy(obj_giantkeyfollow)
}
if instance_exists(obj_player2)
{
    if (key && (!instance_exists(obj_jumpscare)) && obj_player2.state == (0 << 0) && obj_player2.grounded && obj_player2.key_up && place_meeting(x, y, obj_player2))
    {
        _save = 1
        ds_list_add(global.saveroom, id)
        obj_player2.state = (98 << 0)
        obj_player2.image_index = 0
        obj_player1.x = obj_player2.x
        obj_player1.y = obj_player2.y
        obj_player1.sprite_index = obj_player1.spr_victory
        obj_player2.sprite_index = obj_player2.spr_victory
        obj_player1.state = (98 << 0)
        obj_player1.image_index = 0
        image_index = 0
        sprite_index = spr_doorkeyopen
        image_speed = 0.35
        instance_create((x + 50), (y + 50), obj_lock)
        global.key_inv = 0
    }
}
if (floor(image_index) == (image_number - 1))
    image_index = (image_number - 1)
if _save
{
    unlocked = 1
    ini_open_from_string(obj_savesystem.ini_str)
    ini_write_real(save, "door", 1)
    obj_savesystem.ini_str = ini_close()
    gamesave_async_save()
}
if (sprite_index == spr_elevatoropening && floor(image_index) == (image_number - 1) && place_meeting(x, y, obj_player1) && (!instance_exists(obj_jumpscare)) && floor(obj_player1.image_index) == (obj_player1.image_number - 1) && obj_player1.state == (98 << 0))
{
    with (obj_player1)
    {
        obj_player1.targetDoor = other.targetDoor
        obj_player1.targetRoom = other.targetRoom
        if (instance_exists(obj_player2) && global.coop == 1)
        {
            obj_player2.targetDoor = other.targetDoor
            obj_player2.targetRoom = other.targetRoom
        }
        if (!instance_exists(obj_fadeout))
        {
            instance_create(x, y, obj_fadeout)
            instance_create((door.x + (door.sprite_width / 2)), (door.y + (door.sprite_height / 2)), obj_doortransition)
        }
    }
}
with (obj_player)
{
    if (state == (95 << 0) && other.doored == 0)
    {
        if ((!instance_exists(obj_doortransition2)) && place_meeting(x, y, other.id))
        {
            other.doored = 1
            instance_create((other.x + (other.sprite_width / 2)), (other.y + (other.sprite_height / 2)), obj_doortransition2)
        }
    }
}
if place_meeting(x, y, obj_doorA)
    targetDoor = "A"
if place_meeting(x, y, obj_doorB)
    targetDoor = "B"
if place_meeting(x, y, obj_doorC)
    targetDoor = "C"
if place_meeting(x, y, obj_doorD)
    targetDoor = "D"
if place_meeting(x, y, obj_doorE)
    targetDoor = "E"
if place_meeting(x, y, obj_doorF)
    targetDoor = "F"
if place_meeting(x, y, obj_doorG)
    targetDoor = "G"
