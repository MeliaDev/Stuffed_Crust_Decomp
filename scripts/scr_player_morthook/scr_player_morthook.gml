function scr_player_morthook() //scr_player_morthook
{
    jumpstop = 1
    doublejump = 0
    hsp = 0
    vsp = 0
    if (!instance_exists(morthookID))
    {
        state = (12 << 0)
        sprite_index = spr_fall
    }
    image_speed = 0.35
    x = Approach(x, morthookID.x, movespeed)
    y = Approach(y, morthookID.y, movespeed)
    if (floor(x) == morthookID.x && floor(y) == morthookID.y)
    {
        fmod_event_one_shot_3d("event:/sfx/mort/doublejump", x, y)
        state = (12 << 0)
        sprite_index = spr_mortdoublejumpstart
        image_index = 0
        vsp = -14
        repeat (6)
            create_debris(x, y, 1541)
        with (instance_create(x, y, obj_speedlinesup))
            playerid = other.id
        movespeed = (xscale * 12)
    }
}

