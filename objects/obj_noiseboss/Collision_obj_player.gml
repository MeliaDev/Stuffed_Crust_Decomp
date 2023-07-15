if ((state == (104 << 0) && hsp != 0) || (state == (244 << 0) && image_index > 3) || (state == (108 << 0) && (!grounded)) || state == (105 << 0) || state == (58 << 0) || state == (171 << 0) || state == (127 << 0))
{
    if other.flash
        other.flash = 0
    scr_hurtplayer(other)
}
else if ((state == (134 << 0) || (state == (138 << 0) && (!savedthrown))) && flickertime <= 0 && wastedhits == 7 && (other.instakillmove || other.state == (42 << 0)) && (!pizzahead))
{
    if (phase == 1)
        scr_boss_do_hurt_phase2(other)
    else
    {
        instance_destroy(obj_noisey)
        instance_destroy(obj_noiseyspawner)
        instance_destroy(obj_noiseyspawner2)
        fightballcount = 0
        substate = (295 << 0)
        state = (289 << 0)
        sprite_index = spr_playerN_fightball
        image_index = 0
        image_speed = 0.35
        other.state = (146 << 0)
        other.image_speed = 0.35
        other.sprite_index = spr_player_fightball
        other.image_index = 0
    }
}
