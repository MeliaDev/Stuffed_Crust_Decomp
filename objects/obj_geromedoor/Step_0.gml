if (global.gerome == 1 || image_index != 0)
{
    if (!uparrow)
    {
        uparrow = 1
        uparrowID = scr_create_uparrowhitbox()
    }
}
else if uparrow
{
    uparrow = 0
    instance_destroy(uparrowID)
}
if ((!global.horse) && (obj_player1.state == (0 << 0) || obj_player1.state == (103 << 0) || obj_player1.state == (42 << 0) || obj_player1.state == (58 << 0) || obj_player1.state == (104 << 0) || obj_player1.state == (121 << 0) || obj_player1.state == (99 << 0)) && obj_player1.key_up && obj_player1.grounded && place_meeting(x, y, obj_player1))
{
    if (global.gerome == 1)
    {
        ds_list_add(global.saveroom, id)
        fmod_event_one_shot_3d("event:/sfx/misc/keyunlock", x, y)
        fmod_event_one_shot("event:/sfx/misc/cheers")
        with (obj_player)
        {
            targetRoom = other.targetRoom
            targetDoor = other.targetDoor
        }
        obj_geromefollow.visible = false
        obj_geromefollow.do_end = 1
        with (instance_create((obj_player1.x - 30), obj_player1.y, obj_geromeanim))
        {
            sprite_index = spr_gerome_opendoor
            image_index = 0
            image_speed = 0.35
        }
        obj_player1.state = (98 << 0)
        obj_player1.image_index = 0
        if (instance_exists(obj_player2) && global.coop == 1)
        {
            obj_player2.x = obj_player1.x
            obj_player2.y = obj_player1.y
            obj_player2.state = (98 << 0)
            obj_player2.image_index = 0
        }
        global.gerome = 2
        image_index = 1
    }
    else if (obj_player1.key_up2 && image_index == 0 && obj_player1.grounded)
        fmod_event_one_shot_3d("event:/sfx/misc/keyunlock", x, y)
}
if (place_meeting(x, y, obj_player1) && floor(obj_player1.image_index) == (obj_player1.image_number - 1) && (obj_player1.state == (98 << 0) || obj_player1.state == (112 << 0)))
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
            instance_create(x, y, obj_fadeout)
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
