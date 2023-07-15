bossspr = spr_vspepperman
boss_hp = 20
vstitle = 2479
boss_columnmax = 5
boss_hp_x -= 50
function anon_gml_RoomCC_boss_pepperman_1_Create_130_gml_RoomCC_boss_pepperman_1_Create() //anon_gml_RoomCC_boss_pepperman_1_Create_130_gml_RoomCC_boss_pepperman_1_Create
{
    var eh = 0
    var p = 0
    with (obj_pepperman)
    {
        eh = elitehit
        p = phase
    }
    if (p == 1)
        boss_hp = eh
    else if (p == 2)
    {
        boss_hp = eh
        if (eh <= 0)
            boss_hp = 1
    }
    else if (p == 0)
        boss_hp = 0
}

