spr_dead = spr_ratblock_dead
var theroomname = room_get_name(room)
if (sprite_index == spr_ratblock)
{
    if (string_pos("medieval", theroomname) != 0 || string_pos("chateu", theroomname) != 0)
    {
        sprite_index = spr_ratblock5
        spr_dead = spr_ratblock5_dead
    }
    else if (string_pos("badland", theroomname) != 0 || string_pos("saloon", theroomname) != 0)
    {
        sprite_index = choose(spr_ratblock4, spr_ratblock7)
        if (sprite_index == spr_ratblock4)
            spr_dead = spr_ratblock4_dead
        if (sprite_index == spr_ratblock7)
            spr_dead = spr_ratblock7_dead
    }
    else if (string_pos("plage", theroomname) != 0 || string_pos("beach", theroomname) != 0)
    {
        sprite_index = spr_ratblock3
        spr_dead = spr_ratblock3_dead
    }
    else if (string_pos("forest", theroomname) != 0)
    {
        sprite_index = spr_ratblock7
        spr_dead = spr_ratblock7_dead
    }
    else if (string_pos("city", theroomname) != 0 || string_pos("street", theroomname) != 0)
    {
        sprite_index = choose(spr_ratblock2, spr_ratblock1)
        if (sprite_index == spr_ratblock1)
            spr_dead = spr_ratblock1_dead
        if (sprite_index == spr_ratblock2)
            spr_dead = spr_ratblock2_dead
    }
    else if (string_pos("tower", theroomname) != 0)
    {
        if (irandom(100) >= 77)
            sprite_index = choose(spr_ratblock1, spr_ratblock2, spr_ratblock3, spr_ratblock4, spr_ratblock5)
        if (sprite_index == spr_ratblock1)
            spr_dead = spr_ratblock1_dead
        if (sprite_index == spr_ratblock2)
            spr_dead = spr_ratblock2_dead
        if (sprite_index == spr_ratblock3)
            spr_dead = spr_ratblock3_dead
        if (sprite_index == spr_ratblock4)
            spr_dead = spr_ratblock4_dead
        if (sprite_index == spr_ratblock5)
            spr_dead = spr_ratblock5_dead
    }
    else
    {
        if (irandom(100) == 7 || irandom(100) == 77)
            sprite_index = choose(spr_ratblock1, spr_ratblock2, spr_ratblock3, spr_ratblock4, spr_ratblock5)
        if (sprite_index == spr_ratblock1)
            spr_dead = spr_ratblock1_dead
        if (sprite_index == spr_ratblock2)
            spr_dead = spr_ratblock2_dead
        if (sprite_index == spr_ratblock3)
            spr_dead = spr_ratblock3_dead
        if (sprite_index == spr_ratblock4)
            spr_dead = spr_ratblock4_dead
        if (sprite_index == spr_ratblock5)
            spr_dead = spr_ratblock5_dead
    }
}
depth = 2
anim = 0
baddie = 0
animy = 0
sniffsnd = fmod_event_create_instance("event:/sfx/rat/ratsniff")
fmod_event_instance_set_3d_attributes(sniffsnd, x, y)
use_sound = ground_boundtitrle_cardd
deadsnd = "event:/sfx/rat/ratdead"
if (place_meeting((x + 1), y, object_index) && place_meeting((x - 1), y, object_index))
    use_sound = 0
if (use_sound && place_meeting((x + 1), y, object_index) && (!(place_meeting((x - 1), y, object_index))))
    use_sound = 0
