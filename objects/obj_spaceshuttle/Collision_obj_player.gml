with (other)
{
    if (other.state == (0 << 0) && state != (292 << 0) && key_up && grounded && ((state == (191 << 0) && brick) || state == (0 << 0) || state == (103 << 0) || state == (121 << 0) || state == (58 << 0) || state == (121 << 0) || state == (99 << 0)))
    {
        instance_create(x, y, obj_genericpoofeffect)
        other.state = (137 << 0)
        other.hitLag = 80
        other.hitX = other.x
        other.hitY = other.y
        instance_destroy(other.arrowID)
        fmod_event_instance_play(global.snd_spaceship)
        with (obj_player)
        {
            if check_player_coop()
            {
                hsp = 0
                movespeed = 0
                vsp = 0
                state = (292 << 0)
                visible = false
                sprite_index = spr_idle
            }
        }
    }
}
