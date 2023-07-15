if ((!instance_exists(obj_policecar)) && distance_to_object(obj_player1) < 300)
{
    if ((!released) && activate)
    {
        if (inst != noone && (!instance_exists(inst)))
            inst = noone
        if ((obj_player1.x < x && playerside == 1) || (obj_player1.x > x && playerside == 0))
        {
            released = 1
            image_speed = 0.35
            updatepos = 1
        }
    }
    else if (floor(image_index) == 3 && (!instance_exists(inst)))
    {
        inst = instance_create(x, (y + 13), obj_policecar)
        fmod_event_one_shot("event:/sfx/misc/taximove")
        inst.targetplayer = 530
        inst.targetRoom = targetRoom
        inst.targetDoor = targetDoor
    }
}
if (updatepos == 1)
{
    if (obj_player.x > x)
        playerside = 1
    else
        playerside = 0
    updatepos = 0
}
if (!global.panic)
{
    if (activetimer > 0)
        activetimer--
    else
    {
        activetimer = 0
        activate = 0
    }
}
