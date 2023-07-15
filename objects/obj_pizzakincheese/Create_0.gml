event_inherited()
spr_intro = spr_toppincheese_intro
spr_idle = spr_toppincheese
spr_run = spr_toppincheese_run
spr_panic = spr_toppincheese_panic
spr_taunt = spr_toppincheese_taunt
spr_intro_strongcold = spr_xmascheesetoppin_intro
spr_idle_strongcold = spr_xmascheesetoppin_idle
spr_run_strongcold = spr_xmascheesetoppin_walk
if (obj_player.character == "N" || (obj_player.character == "P" && obj_player.ispeppino == 0))
{
    spr_intro = spr_noisebomb_intro
    spr_idle = spr_noisebomb
    spr_run = spr_noisebomb_walk
    spr_panic = spr_noisebomb_idle
    spr_taunt = spr_noisebomb_idle
}
