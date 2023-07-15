if (other.vsp > 0 && instance_exists(baddieID) && baddieID.destroyable)
{
    if baddieID.destroyable
    {
        with (baddieID)
        {
            elitehit = 0
            instance_destroy()
        }
    }
    fmod_event_one_shot_3d("event:/sfx/pep/punch", x, y)
    if (!baddieID.important)
    {
        global.style += (5 + (global.combo / 10))
        global.combotime = 60
        global.heattime = 60
    }
    instance_create(x, y, obj_slapstar)
    instance_create(x, y, obj_slapstar)
    instance_create(x, y, obj_slapstar)
    instance_create(x, y, obj_baddiegibs)
    instance_create(x, y, obj_baddiegibs)
    instance_create(x, y, obj_baddiegibs)
}
