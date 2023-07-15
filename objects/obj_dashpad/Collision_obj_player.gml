var t = id
with (other)
{
    var _req = (key_attack || state == (108 << 0) || vsp > 12 || vsp < -12 || movespeed >= 10 || movespeed <= -10)
    if (state != (186 << 0) && state != (16 << 0) && state != (146 << 0))
    {
        if (boxxed == 0 && isgustavo == 0 && other.buffer == 0 && _req && other.sprite_index == spr_dashpad)
        {
            if (state == (210 << 0) || state == (209 << 0))
                create_debris(x, y, 3377)
            if (state == (225 << 0))
            {
                var i = 0
                repeat (3)
                {
                    with (create_debris(x, y, 3494))
                        image_index = i
                    i++
                }
            }
            var changecoord = 1
            if place_meeting(x, y, obj_superspring)
                changecoord = 0
            if changecoord
                y = (other.y - 14)
            vsp = 0
            create_particle(x, y, (5 << 0), 0)
            if (character == "P")
            {
                if (sprite_index != spr_dashpadmach)
                {
                    sprite_index = spr_dashpadmach
                    image_index = 0
                }
            }
            else if (character == "N")
            {
                if (sprite_index != spr_crazyrun)
                {
                    sprite_index = spr_crazyrun
                    image_index = 0
                }
            }
            scr_fmod_soundeffect(snd_dashpad, x, y)
            machhitAnim = 0
            state = (121 << 0)
            xscale = sign(other.image_xscale)
            dir = xscale
            if (movespeed < 14)
            {
                movespeed = 14
                hsp = (xscale * movespeed)
            }
            else
            {
                movespeed += 0.5
                hsp = (xscale * movespeed)
            }
            other.buffer = 30
        }
        else
        {
            if (boxxed && other.buffer == 0 && other.sprite_index != spr_dashpad)
            {
                changecoord = 1
                if place_meeting(x, y, obj_superspring)
                    changecoord = 0
                if changecoord
                    y = (other.y - 14)
                vsp = 0
                create_particle(x, y, (5 << 0), 0)
                scr_fmod_soundeffect(global.snd_ventilator, x, y)
                xscale = sign(other.image_xscale)
                dir = xscale
                boxxeddash = 1
                if (abs(movespeed) < 14)
                    movespeed = (xscale * 14)
                else
                    movespeed += (xscale * 0.5)
                sprite_index = spr_boxxedpepwalk
                boxxeddashbuffer = 40
                state = (33 << 0)
                other.buffer = 30
            }
            if (isgustavo && other.buffer == 0 && gusdashpadbuffer == 0 && _req)
            {
                fmod_event_one_shot_3d("event:/sfx/misc/dashpad", x, y)
                changecoord = 1
                if place_meeting(x, y, obj_superspring)
                    changecoord = 0
                if changecoord
                    y = (other.y - 14)
                vsp = 0
                create_particle(x, y, (5 << 0), 0)
                xscale = sign(other.image_xscale)
                dir = xscale
                scr_fmod_soundeffect(global.snd_ventilator, x, y)
                with (instance_create(x, y, obj_crazyrunothereffect))
                    image_xscale = t.image_xscale
                with (instance_create(x, y, obj_superdashcloud))
                    image_xscale = t.image_xscale
                other.buffer = 30
                ratmount_movespeed = 14
                gustavodash = 51
                state = (191 << 0)
                if (abs(movespeed) < 14)
                    movespeed = (xscale * 14)
                else
                    movespeed += (xscale * 0.5)
                gusdashpadbuffer = 25
            }
        }
    }
}
