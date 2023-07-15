if (grounded && vsp > 0)
{
    fmod_event_one_shot_3d("event:/sfx/pep/splat", x, y)
    fmod_event_one_shot_3d("event:/sfx/pep/jump", x, y)
    vsp = -9
    instance_create(x, (y + 43), obj_bangeffect)
    create_particle(x, y, (3 << 0))
}
mask_index = spr_player_mask
scr_collide()
if (afterimage > 0)
    afterimage--
else
{
    afterimage = 5
    if (global.blueeffects > 0 && global.blueeffects < 4)
    {
        if (global.blueeffects == 1)
        {
            with (create_firemouth_afterimage(x, y, sprite_index, image_index, 1))
            {
                image_xscale = other.image_xscale
                playerid = other.id
                depth = (other.depth + 1)
            }
        }
        if (global.blueeffects == 2)
        {
            with (create_blue_afterimage(x, y, sprite_index, image_index, 1))
            {
                image_xscale = other.image_xscale
                playerid = other.id
                depth = (other.depth + 1)
            }
        }
        if (global.blueeffects == 3)
        {
            with (create_red_afterimage(x, y, sprite_index, image_index, 1))
            {
                image_xscale = other.image_xscale
                playerid = other.id
                depth = (other.depth + 1)
            }
        }
    }
    else
    {
        with (create_mach3effect(x, y, sprite_index, image_index, 1))
        {
            image_xscale = other.image_xscale
            playerid = other.id
            depth = (other.depth + 1)
        }
    }
}
