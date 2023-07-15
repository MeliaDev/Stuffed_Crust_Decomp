bossspr = spr_vspizzaface
boss_hp = 16
vstitle = 1886
boss_hpsprite = spr_bossfight_pizzafaceHP
boss_palette = 3876
function anon_gml_RoomCC_boss_pizzaface_0_Create_185_gml_RoomCC_boss_pizzaface_0_Create() //anon_gml_RoomCC_boss_pizzaface_0_Create_185_gml_RoomCC_boss_pizzaface_0_Create
{
    var eh = 0
    if instance_exists(obj_pizzafaceboss)
    {
        with (obj_pizzafaceboss)
            eh = elitehit
        boss_hp = eh
    }
    else if instance_exists(obj_pizzafaceboss_p2)
    {
        with (obj_pizzafaceboss_p2)
        {
            if (state != (135 << 0) || substate == (8 << 0))
                eh = elitehit
        }
        boss_hp = eh
    }
    else if instance_exists(obj_pizzafaceboss_p3)
    {
        with (obj_pizzafaceboss_p3)
            eh = scr_bosscontroller_pizzaface_p3_health()
        if (eh > boss_maxhp)
            eh -= boss_maxhp
        boss_hp = eh
    }
    else
    {
        with (obj_pepperman)
            eh = scr_bosscontroller_pizzaface_p3_health()
        with (obj_vigilanteboss)
        {
            if (!pizzaheadKO)
                eh = scr_bosscontroller_pizzaface_p3_health()
        }
        with (obj_noiseboss)
        {
            if (!pizzaheadKO)
                eh = scr_bosscontroller_pizzaface_p3_health()
        }
        with (obj_fakepepboss)
        {
            if (!pizzaheadKO)
                eh = scr_bosscontroller_pizzaface_p3_health()
        }
        if (eh > boss_maxhp)
            eh -= boss_maxhp
        boss_hp = eh
    }
}

