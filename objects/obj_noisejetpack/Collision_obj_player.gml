if (state == (0 << 0) && other.grounded)
{
    depth = -500
    ds_list_add(global.saveroom, id)
    playerid = other.id
    x = other.x
    y = (other.y - 60)
    state = (46 << 0)
    cutscenebuffer = 40
    effectid = instance_create(x, y, obj_treasureeffect)
    movespeed = 2
    with (other)
    {
        fmod_event_one_shot_3d("event:/sfx/misc/secretfound", x, y)
        state = (46 << 0)
        hsp = 0
        vsp = 0
    }
}
