if (elitehit <= 0)
{
    with (instance_create((room_width / 2), (room_height + 100), obj_pizzafaceboss_p3))
    {
        state = (294 << 0)
        vsp = -26
        hsp = 0
        sprite_index = spr_pizzahead_intro3
        with (obj_bosscontroller)
        {
            boss_hpsprite = spr_bossfight_pizzaheadHP
            boss_palette = 394
        }
    }
}
event_inherited()
