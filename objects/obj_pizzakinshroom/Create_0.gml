event_inherited()
spr_intro = spr_toppinshroom_intro
spr_idle = spr_toppinshroom
spr_run = spr_toppinshroom_run
spr_panic = spr_toppinshroom_panic
spr_taunt = spr_toppinshroom_taunt
spr_intro_strongcold = spr_xmasshroomtoppin_intro
spr_idle_strongcold = spr_xmasshroomtoppin_idle
spr_run_strongcold = spr_xmasshroomtoppin_walk
if (obj_player.character == "N" || (obj_player.character == "P" && obj_player.ispeppino == 0))
{
    spr_intro = spr_noisebomb_intro
    spr_idle = spr_noisebomb
    spr_run = spr_noisebomb_walk
    spr_panic = spr_noisebomb_idle
    spr_taunt = spr_noisebomb_idle
}
