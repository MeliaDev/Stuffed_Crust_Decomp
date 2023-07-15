image_speed = 0.35
switch state
{
    case (0 << 0):
        if (cooldown > 0)
        {
            sprite_index = spr_sirnose_cooldown
            cooldown--
        }
        else
        {
            sprite_index = spr_sirnose_idle
            with (obj_pizzaball)
            {
                if (state != (148 << 0) && distance_to_pos(x, y, other.x, other.y, 200, 150))
                {
                    state = (264 << 0)
                    other.state = (264 << 0)
                    other.hsp = hsp
                    other.vsp = vsp
                    other.ballID = id
                }
            }
        }
        break
    case (264 << 0):
        with (ballID)
        {
            depth = 0
            sprite_index = spr_pizzaball_roll
            sit = 0
            x = Approach(x, other.x, 8)
            y = Approach(y, other.y, 8)
            if (state != (148 << 0))
            {
                other.hsp = Approach(hsp, 0, 1)
                other.vsp = Approach(vsp, 0, 1)
            }
            else
                sprite_index = spr_pizzaball_stun
            hsp = other.hsp
            vsp = other.vsp
            if (state != (264 << 0) && state != (148 << 0))
            {
                other.state = (0 << 0)
                other.cooldown = 200
            }
            if (x != other.x || y != other.y)
            {
                if (x != other.x)
                    other.image_xscale = sign((other.x - x))
                other.sprite_index = spr_sirnose_suck
            }
            else
            {
                if (other.sprite_index == spr_sirnose_suck)
                    fmod_event_one_shot_3d("event:/sfx/misc/sniffbump", other.x, other.y)
                other.sprite_index = spr_sirnose_idle
            }
        }
        with (obj_player1)
        {
            if ((sprite_index == spr_supertaunt1 || sprite_index == spr_supertaunt2 || sprite_index == spr_supertaunt3 || sprite_index == spr_supertaunt4 || sprite_index == spr_supertaunt5 || sprite_index == spr_player_taunt || sprite_index == spr_playerN_taunt || sprite_index == spr_playerV_taunt || sprite_index == spr_snick_taunt) && distance_to_pos(x, y, other.x, other.y, 200, 200))
            {
                other.state = (0 << 0)
                other.cooldown = 200
            }
        }
        break
}

if (sprite_index == spr_sirnose_suck)
{
    if (!fmod_event_instance_is_playing(snd))
    {
        fmod_event_instance_play(snd)
        fmod_event_instance_set_3d_attributes(snd, x, y)
    }
}
else
    fmod_event_instance_stop(snd, 1)
