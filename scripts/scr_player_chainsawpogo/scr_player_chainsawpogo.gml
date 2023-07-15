function scr_player_chainsawpogo() //scr_player_chainsawpogo
{
    move = (key_left + key_right)
    hsp = (move * movespeed)
    if (move != 0)
        xscale = move
    if ((scr_solid((x + 1), y) && xscale == 1) || (scr_solid((x - 1), y) && xscale == -1))
        movespeed = 0
    landAnim = 1
    if (ladderbuffer > 0)
        ladderbuffer--
    if (scr_solid(x, (y - 1)) && jumpstop == 0 && jumpAnim == 1)
    {
        vsp = grav
        jumpstop = 1
    }
    if (scr_solid((x + (1 * xscale)), y) && (!(place_meeting((x + sign(hsp)), y, obj_slope))))
    {
        fmod_event_one_shot_3d("event:/sfx/pep/splat", x, y)
        machhitAnim = 0
        state = (41 << 0)
        hsp = (4.5 * xscale)
        vsp = (-4 - (4 * (movespeed / 20)))
        mach2 = 0
        image_index = 0
        sprite_index = spr_player_chainsawbump
        instance_create((x + 10), (y + 10), obj_bumpeffect)
    }
    if grounded
    {
        image_index = 0
        mask_index = spr_player_mask
        sprite_index = spr_player_chainsawrev
        state = (41 << 0)
    }
    if (sprite_index != spr_player_chainsawpogobounce)
    {
        if (sprite_index == spr_player_chainsawpogo1 && floor(image_index) == 3)
        {
            sprite_index = spr_player_chainsawpogo2
            mask_index = spr_chainsawpogomask
        }
        if (!instance_exists(obj_chainsawpogo_hitbox))
        {
            with (instance_create(x, y, obj_chainsawpogo_hitbox))
                playerid = other.id
        }
    }
    else if (floor(image_index) == 4)
        sprite_index = spr_player_chainsawpogo2
    image_speed = 0.35
}

