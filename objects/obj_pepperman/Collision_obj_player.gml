if (state == (153 << 0) && hsp != 0)
{
    if other.flash
        other.flash = 0
    var s = other.state
    scr_hurtplayer(other)
    if (other.state != s && other.state == (107 << 0))
    {
        state = (138 << 0)
        hsp = ((-image_xscale) * 5)
        vsp = -8
        stunned = 220
        sprite_index = spr_pepperman_shoulderhurtstart
        image_index = 0
        image_speed = 0.35
        with (obj_camera)
        {
            shake_mag = 3
            shake_mag_acc = (5 / room_speed)
        }
        repeat (4)
            create_debris(x, y, 1531)
    }
}
else if (wastedhits == 9 && phase == 1 && (!pizzahead) && (other.instakillmove || other.state == (42 << 0)) && state == (267 << 0))
    scr_boss_do_hurt_phase2(other)
else if (state == (268 << 0) && ministate != (8 << 0) && (other.instakillmove || other.state == (42 << 0)))
{
    with (other)
        scr_pummel()
    with (obj_camera)
    {
        shake_mag = 3
        shake_mag_acc = (5 / room_speed)
    }
    var lay1 = layer_get_id("Backgrounds_scroll")
    var lay2 = layer_get_id("Backgrounds_2")
    var lay3 = layer_get_id("Backgrounds_1")
    layer_set_visible(lay3, 1)
    var bg1 = layer_background_get_id(lay1)
    var bg2 = layer_background_get_id(lay2)
    layer_background_change(bg1, 206)
    layer_background_change(bg2, 4012)
    layer_hspeed(lay1, 1)
    obj_bosscontroller.alarm[1] = 5
    scr_sleep(25)
    instance_destroy(obj_peppermanartdude)
    instance_destroy(obj_peppermanbowlingball)
    instance_destroy(obj_peppermanbowlingballspawner)
    instance_destroy(obj_peppermanGIANTbowlingball)
    destroyable = 1
    spr_dead = spr_pepperman_minifall
    instance_destroy()
}
