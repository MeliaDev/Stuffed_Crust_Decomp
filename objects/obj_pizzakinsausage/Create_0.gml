event_inherited()
spr_intro = spr_toppinsausage_intro
spr_idle = spr_toppinsausage
spr_run = spr_toppinsausage_run
spr_panic = spr_toppinsausage_panic
spr_taunt = spr_toppinsausage_taunt
spr_intro_strongcold = spr_xmassausagetoppin_intro
spr_idle_strongcold = spr_xmassausagetoppin_idle
spr_run_strongcold = spr_xmassausagetoppin_walk
if (obj_player.character == "N" || (obj_player.character == "P" && obj_player.ispeppino == 0))
{
    spr_intro = spr_noisebomb_intro
    spr_idle = spr_noisebomb
    spr_run = spr_noisebomb_walk
    spr_panic = spr_noisebomb_idle
    spr_taunt = spr_noisebomb_idle
}
