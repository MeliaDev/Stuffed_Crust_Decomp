function scr_player_ratmountspit() //scr_player_ratmountspit
{
    if (sprite_index == spr_lonegustavo_sploded)
    {
        if (floor(image_index) == (image_number - 1))
        {
            image_speed = 0
            image_index = (image_number - 1)
            if brick
                sprite_index = spr_player_ratmountidle
            else
                sprite_index = spr_lonegustavo_idle
            state = (191 << 0)
        }
        else
            image_speed = 0.35
    }
    else if (sprite_index == spr_player_ratmountmissilecharge)
    {
        if key_shoot
            ratmissilecharge++
        if (ratmissilecharge == 10)
            fmod_event_one_shot_3d("event:/sfx/pep/revolvercharge", x, y)
        if (ratmissilecharge == 20)
            fmod_event_one_shot_3d("event:/sfx/pep/revolvercharge", x, y)
        if (ratmissilecharge == 30)
        {
            fmod_event_one_shot_3d("event:/sfx/pep/gotsupertaunt", x, y)
            flash = 1
        }
        if (ratmissilecharge == 60 || ratmissilecharge == 70 || ratmissilecharge == 75)
            flash = 1
        if (ratmissilecharge == 80)
        {
            with (instance_create(x, y, obj_explosioneffect))
            {
                image_speed = 0.5
                depth = (other.depth - 1)
                sprite_index = spr_bombexplosion
            }
            scr_fmod_soundeffect(global.snd_explosion, x, y)
            ratmissilecharge = 0
            ratmissilenotif = 0
            ratmissilecool = 30
            flash = 1
            vsp = -5
            sprite_index = spr_lonegustavo_sploded
            image_index = 0
            image_speed = 0.35
        }
        if (!key_shoot)
        {
            if (ratmissilecharge < 30)
            {
                ratmissilecharge = 0
                ratmissilenotif = 0
                ratmissilecool = 15
                state = (191 << 0)
                sprite_index = spr_player_ratmountidle
            }
            else
            {
                brick = 0
                ratmissilecharge = 0
                ratmissilenotif = 0
                ratmissilecool = 30
                sprite_index = spr_player_ratmountmissilefire
                image_index = 0
                hsp = ((-xscale) * 6)
                vsp = -10
                fmod_event_one_shot_3d("event:/sfx/enemies/killingblow", x, y)
                with (instance_create((x + (xscale * 40)), (y + 8), obj_gustavo_warmissile))
                {
                    if (other.xscale == 1)
                        direction = 0
                    else
                        direction = 180
                }
            }
        }
    }
    else if (sprite_index == spr_player_ratmountmissilefire)
    {
        if (floor(image_index) == (image_number - 1))
        {
            image_speed = 0
            image_index = (image_number - 1)
        }
        if grounded
            state = (191 << 0)
    }
    else
    {
        image_speed = 0.6
        hsp = 0
        vsp = 0
        with (ratgrabbedID)
            scr_enemy_ratgrabbed()
        if (floor(image_index) == (image_number - 1))
        {
            state = (191 << 0)
            ratgrabbedID = -4
        }
    }
}

