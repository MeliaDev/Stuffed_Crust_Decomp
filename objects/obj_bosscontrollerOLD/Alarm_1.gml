if (!fakedeath)
{
    scr_playerreset()
    with (obj_player)
    {
        if (object_index == obj_player1 || global.coop)
        {
            state = (0 << 0)
            targetDoor = "A"
        }
    }
    gamesave_async_save()
    room = tower_noisemech
}
else
{
    extrarounds = 1
    round_count = 1
    round_max = extrarounds_count
    fakedeath = 0
    timer_buffer = timer_max
    state = (145 << 0)
    fade = 1
    with (par_boss)
    {
        destroyed = 0
        destroyable = 1
        max_hp /= 2
        max_hp = floor(max_hp)
        hp = max_hp
        stunned = 0
        targetstunned = 0
        phase++
        phase = clamp(phase, 0, max_phase)
        state = (145 << 0)
        vsp = -11
    }
}
