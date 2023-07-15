if (ds_queue_size(followqueue) < LAG_STEPS || state == (152 << 0))
    return;
with (obj_player)
{
    if (cutscene == 0)
    {
        targetRoom = other.targetRoom
        lastroom = room
        targetDoor = other.targetDoor
        visible = false
        if (state != (186 << 0))
            state = (152 << 0)
        cutscene = 1
        hsp = 0
        vsp = 0
    }
}
grav = 0
state = (152 << 0)
hsp = 10
image_xscale = 1
vsp = 0
if (gotcha == 0)
    gotcha = 1
