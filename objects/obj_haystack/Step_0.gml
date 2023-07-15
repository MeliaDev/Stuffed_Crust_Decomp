mask_index = spr_haystack
if (sprite_index != spr_haystackburning && sprite_index != spr_haystackburningup)
{
    with (obj_farmerbaddie3)
    {
        if (state == (128 << 0) && place_meeting((x + hsp), y, other))
            other.sprite_index = spr_haystackburningup
    }
    with (obj_chilidude_fire)
    {
        if place_meeting(x, y, other)
            other.sprite_index = spr_haystackburningup
    }
    with (obj_player)
    {
        if ((state == (10 << 0) && (place_meeting((x + hsp), y, other) || place_meeting(x, (y + 1), other))) || (state == (9 << 0) && place_meeting(x, (y + 1), other)))
            other.sprite_index = spr_haystackburningup
    }
    with (obj_weeniehitbox)
    {
        if (baddieID.object_index == obj_chilidude && place_meeting(x, y, other))
        {
            with (other)
                sprite_index = spr_haystackburningup
        }
    }
}
else if (sprite_index == spr_haystackburning || sprite_index == spr_haystackburningup)
{
    if (sprite_index == spr_haystackburningup)
    {
        if (floor(image_index) == (image_number - 1))
            sprite_index = spr_haystackburning
    }
    with (instance_place((x + 1), y, obj_haystack))
    {
        if (sprite_index != spr_haystackburningup && sprite_index != spr_haystackburning)
            sprite_index = spr_haystackburningup
        if (other.permaburn == 1)
            permaburn = 1
    }
    with (instance_place((x - 1), y, obj_haystack))
    {
        if (sprite_index != spr_haystackburningup && sprite_index != spr_haystackburning)
            sprite_index = spr_haystackburningup
        if (other.permaburn == 1)
            permaburn = 1
    }
    with (instance_place(x, (y + 1), obj_haystack))
    {
        if (sprite_index != spr_haystackburningup && sprite_index != spr_haystackburning)
            sprite_index = spr_haystackburningup
        if (other.permaburn == 1)
            permaburn = 1
    }
    with (instance_place(x, (y - 1), obj_haystack))
    {
        if (sprite_index != spr_haystackburningup && sprite_index != spr_haystackburning)
            sprite_index = spr_haystackburningup
        if (other.permaburn == 1)
            permaburn = 1
    }
    with (instance_place(x, (y - 6), obj_baddie))
    {
        if (object_index != obj_chilidude)
            instance_destroy()
    }
    with (instance_place(x, (y - 32), obj_ratblock))
        instance_destroy()
    if (ds_list_find_index(global.saveroom, id) == -1)
        ds_list_add(global.saveroom, id)
    if (!permaburn)
    {
        if (firetimer > 0 && sprite_index == spr_haystackburning && firetimeinf == 0)
            firetimer--
        if (firetimer <= 0 && sprite_index == spr_haystackburning && firetimeinf == 0)
        {
            sprite_index = spr_haystack
            firetimer = 200
        }
    }
    var playerid = instance_place(x, (y - 1), obj_player)
    with (playerid)
    {
        if (character == "V")
            scr_hurtplayer(id)
        else if (state != (9 << 0) && state != (3 << 0) && state != (89 << 0) && state != (31 << 0) && state != (186 << 0))
        {
            var _pindex = (object_index == obj_player1 ? 0 : 1)
            GamepadSetVibration(_pindex, 1, 1, 0.85)
            if (state != (9 << 0))
                notification_push((37 << 0), [room])
            state = (9 << 0)
            vsp = -20
            fireasslock = 0
            sprite_index = spr_fireass
            image_index = 0
            movespeed = hsp
            fmod_event_one_shot_3d("event:/sfx/pep/burn", x, y)
            if (character == "V")
            {
                if (!fmod_event_instance_is_playing("event:/sfx/voice/vigiangry"))
                    fmod_event_one_shot_3d("event:/sfx/voice/vigiangry", x, y)
            }
            else if ispeppino
            {
                if (!fmod_event_instance_is_playing(global.snd_fireass))
                    fmod_event_instance_play(global.snd_fireass)
            }
            else if (!fmod_event_instance_is_playing("event:/sfx/voice/noisescream"))
                fmod_event_one_shot_3d("event:/sfx/voice/noisescream", x, y)
        }
    }
}
if (state == (8 << 0))
{
    hsp = (movespeed * dir)
    if (place_meeting((x + sign(hsp)), y, obj_solid) && ((!(place_meeting((x + sign(hsp)), y, obj_slope))) || place_meeting((x + sign(hsp)), (y - 4), obj_solid)))
        x_to = x
    if ((dir > 0 && x >= x_to) || (dir < 0 && x <= x_to))
    {
        x = x_to
        hsp = 0
        state = (0 << 0)
    }
}
