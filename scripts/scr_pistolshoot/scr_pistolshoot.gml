function scr_pistolshoot(argument0) //scr_pistolshoot
{
    if ((pistolcooldown <= 0 && state == argument0 && state != (106 << 0) && instance_number(obj_pistolbullet) < 3) || pistolchargeshooting == 1)
    {
        input_buffer_shoot = 0
        pistolanim = spr_pistolshot
        pistolindex = 0
        pistolcooldown = 10
        machslideAnim = 0
        landAnim = 0
        jumpAnim = 0
        crouchslideAnim = 0
        crouchAnim = 0
        stompAnim = 0
        if (argument0 == (121 << 0) || argument0 == (104 << 0))
            state = (0 << 0)
        windingAnim = 0
        with (instance_create((x + (xscale * 35)), y, obj_parryeffect))
        {
            if other.pistolchargeshooting
                sprite_index = spr_giantpistoleffect
            else
                sprite_index = spr_player_pistoleffect
            image_xscale = other.xscale
            image_speed = 0.4
        }
        if (!pistolchargeshooting)
            fmod_event_one_shot_3d("event:/sfx/pep/pistolshot", (x + (xscale * 20)), y)
        else
            fmod_event_one_shot_3d("event:/sfx/pep/revolverBIGshot", (x + (xscale * 20)), y)
        with (instance_create((x + (xscale * 20)), y, obj_pistolbullet))
        {
            image_xscale = other.xscale
            if other.pistolchargeshooting
            {
                GamepadSetVibration(0, 1, 1, 0.8)
                sprite_index = spr_peppinobulletGIANT
                x += 25
            }
            else
                GamepadSetVibration(0, 0.3, 0.6)
        }
    }
}

