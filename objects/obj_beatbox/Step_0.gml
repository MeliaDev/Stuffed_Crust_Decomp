if (obj_player.sprite_index != spr_player_breakdance && obj_player.sprite_index != spr_noise_vulnerable2 && obj_player.state != (80 << 0))
{
    instance_create(x, y, obj_genericpoofeffect)
    instance_destroy()
}
scr_collide()
fmod_event_instance_set_3d_attributes(snd, x, y)
