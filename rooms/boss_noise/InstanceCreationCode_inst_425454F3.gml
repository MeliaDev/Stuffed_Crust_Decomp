bossspr = spr_vsnoise
if ((obj_player.ispeppino == 0 && obj_player.character == "P") || obj_player.character == "N")
    bossspr = spr_vsdoise
boss_hp = 16
vstitle = 1880
boss_hpsprite = spr_bossfight_noiseHP
boss_palette = 1428
function boss_func() //boss_func
{
    var eh = 0
    var p = 0
    with (obj_noiseboss)
    {
        eh = elitehit
        p = phase
        if (((p == 1 && state == (295 << 0)) || instance_exists(obj_noiseballooncrash)) && phase == 1)
            eh = 0
    }
    if (p == 1)
        boss_hp = eh
    else if (p == 2)
        boss_hp = eh
    else if (p == 0)
        boss_hp = 0
}

