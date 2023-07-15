var p = other.id
with (other)
{
    if (state != (265 << 0) && state != (84 << 0) && state != (61 << 0) && other.cooldown == 0)
    {
        create_transformation_tip(lang_get_value("antigravtip"), "antigrav")
        if (state == (184 << 0) || state == (185 << 0))
        {
            with (instance_create(x, (y + 12), obj_rocketdead))
            {
                hsp = (p.xscale * 6)
                vsp = 5
                image_xscale = sign(hsp)
            }
        }
        state = (265 << 0)
        vsp = 0
        fmod_event_one_shot("event:/sfx/antigrav/start")
        fmod_event_one_shot_3d("event:/sfx/misc/bubblestation", x, y)
        with (obj_antigravbubble)
        {
            if (playerid == other.id)
                instance_destroy()
        }
        other.cooldown = 50
        with (instance_create(x, y, obj_antigravbubble))
            playerid = other.id
        other.image_index = 0
        other.sprite_index = spr_antigrav_activate
    }
}
