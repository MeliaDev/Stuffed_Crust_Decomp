if ((!kick) && countdown <= 0)
{
    other.vsp = -14
    other.jumpstop = 1
    if (other.state == (92 << 0))
    {
        other.sprite_index = other.spr_stompprep
        other.image_index = 0
        other.jumpAnim = 1
    }
    countdown = 10
    fmod_event_one_shot_3d("event:/sfx/enemies/stomp", x, y)
    create_particle(x, y, (5 << 0), 0)
}
