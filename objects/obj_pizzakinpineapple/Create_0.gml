event_inherited()
spr_intro = spr_toppinpineapple_intro
spr_idle = spr_toppinpineapple
spr_run = spr_toppinpineapple_run
spr_panic = spr_toppinpineapple_panic
spr_taunt = spr_toppinpineapple_taunt
spr_intro_strongcold = spr_xmaspineappletoppin_intro
spr_idle_strongcold = spr_xmaspineappletoppin_idle
spr_run_strongcold = spr_xmaspineappletoppin_walk
if (obj_player.character == "N" || (obj_player.character == "P" && obj_player.ispeppino == 0))
{
    spr_intro = spr_noisebomb_intro
    spr_idle = spr_noisebomb
    spr_run = spr_noisebomb_walk
    spr_panic = spr_noisebomb_idle
    spr_taunt = spr_noisebomb_idle
}
