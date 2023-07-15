with (obj_secretportal)
{
    if touched
        return;
}
if ((!instance_exists(obj_fadeout)) && state != (217 << 0) && other.state != (146 << 0) && other.state != (61 << 0) && other.state != (137 << 0) && (!other.cutscene) && other.state != (112 << 0) && (!instance_exists(obj_jumpscare)))
{
    if (!global.panic)
    {
        with (obj_player)
        {
            state = (146 << 0)
            hsp = 0
            vsp = 0
        }
    }
    else if global.panic
    {
        with (obj_monster)
        {
            state = (217 << 0)
            x = xstart
            y = ystart
        }
    }
    if (room == kidsparty_secret2)
    {
        global.spaceblockswitch = 1
        with (obj_spaceblockswitch)
            sprite_index = spr_switchblock_happy
        with (obj_patroller)
        {
            x = xstart
            y = ystart
            state = (134 << 0)
        }
        x = xstart
        y = ystart
    }
    with (instance_create(x, y, obj_jumpscare))
    {
        switch other.object_index
        {
            case obj_robotmonster:
                monsterid = 0
                break
            case 1094:
                monsterid = 1
                break
            case 991:
                monsterid = 2
                break
            case 15:
                monsterid = 3
                break
        }

        if (other.oktoberfest && random(100) <= 10)
        {
            fmod_event_one_shot("event:/sfx/voice/yodeling")
            oktoberfest = 1
        }
        else
            fmod_event_one_shot("event:/sfx/enemies/jumpscare")
    }
    if ((!oktoberfest) && ds_list_find_index(global.saveroom, room_get_name(room)) == -1)
    {
        oktoberfest = 1
        ds_list_add(global.saveroom, room_get_name(room))
    }
}
