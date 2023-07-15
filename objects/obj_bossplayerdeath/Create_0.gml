with (obj_player1)
{
    state = (146 << 0)
    if (character == "P" && ispeppino)
        sprite_index = spr_player_outofpizza1
    else
        sprite_index = spr_slipbanan1
    image_index = 0
    deathspeed = 10
    vsp = -12
}
depth = -600
fade = 0
fade2 = 0
fade2start = 0
state = (92 << 0)
with (obj_music)
{
    if (music != noone)
        fmod_event_instance_stop(music.event, 0)
}
