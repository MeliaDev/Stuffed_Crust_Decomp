if (patroltimer > 0)
{
    patroltimer--
    alarm[5] = 60
}
else
{
    scr_fmod_soundeffect(global.snd_alarm, x, y)
    patrolfound = 0
    state = (80 << 0)
    sprite_index = spr_teeth_alert
    image_index = 0
    scr_monster_activate()
}
