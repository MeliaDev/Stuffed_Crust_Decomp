bossspr = spr_vsvigilante
boss_hp = 20
vstitle = 3203
boss_columnmax = 3
boss_rowmax = 3
boss_hp_x += 25
boss_hpsprite = spr_bossfight_vigiHP
boss_palette = 1714
function anon_gml_RoomCC_boss_vigilante_1_Create_232_gml_RoomCC_boss_vigilante_1_Create() //anon_gml_RoomCC_boss_vigilante_1_Create_232_gml_RoomCC_boss_vigilante_1_Create
{
    var eh = 0
    var p = -1
    with (obj_vigilanteboss)
    {
        eh = elitehit
        p = phase
    }
    if (p == 1)
        boss_hp = eh
    else if (p == 2)
        boss_hp = eh
    else if (p == -1)
        boss_hp = 0
}

