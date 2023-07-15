function scr_player_crouchjump() //scr_player_crouchjump
{
    move = (key_left + key_right)
    mask_index = spr_crouchmask
    hsp = (move * movespeed)
    movespeed = 4
    if ((!key_jump2) && jumpstop == 0 && jumpAnim == 1)
    {
        vsp /= 2
        jumpstop = 1
    }
    if (scr_solid(x, (y - 1)) && jumpstop == 0 && jumpAnim == 1)
    {
        vsp = grav
        jumpstop = 1
    }
    if grounded
    {
        state = (100 << 0)
        jumpAnim = 1
        crouchAnim = 1
        image_index = 0
        jumpstop = 0
        fmod_event_one_shot_3d("event:/sfx/pep/step", x, y)
    }
    if (jumpAnim == 1)
    {
        if (shotgunAnim == 0)
            sprite_index = spr_crouchjump
        else
            sprite_index = spr_shotgun_crouchjump1
        if (floor(image_index) == (image_number - 1))
            jumpAnim = 0
    }
    if (jumpAnim == 0)
    {
        if (shotgunAnim == 0)
            sprite_index = spr_crouchfall
        else
            sprite_index = spr_shotgun_crouchjump2
    }
    if scr_check_groundpound()
    {
        input_buffer_slap = 0
        groundpoundjumpanim = 10
        if (!shotgunAnim)
        {
            sprite_index = spr_bodyslamstart
            image_index = 0
            state = (108 << 0)
            pistolanim = -4
            vsp = -6
        }
        else
        {
            fmod_event_one_shot_3d("event:/sfx/enemies/killingblow", x, y)
            sprite_index = spr_shotgunjump1
            image_index = 0
            state = (108 << 0)
            vsp = -11
            with (instance_create(x, y, obj_shotgunblast))
            {
                sprite_index = spr_shotgunblastdown
                with (bulletID)
                {
                    sprite_index = other.sprite_index
                    mask_index = other.mask_index
                }
            }
        }
    }
    if (move != 0)
        xscale = move
    image_speed = 0.35
}

