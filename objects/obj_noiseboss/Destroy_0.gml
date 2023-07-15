if (elitehit <= 0 && destroyable)
    scr_noise_destroy_sounds()
if (pizzahead && elitehit <= 0 && destroyable)
{
    with (instance_create((room_width / 4), (room_height + 100), obj_fakepepboss))
    {
        instance_destroy(spotlightID)
        phase = 2
        pizzahead = 1
        flickertime = 0
        state = (294 << 0)
        sprite_index = spr_fakepeppino_jump
        image_index = 0
        image_speed = 0.35
        hsp = 0
        vsp = -18
        elitehit = 4
        prevhp = elitehit
        fakepep_set_attack(1, 0, (0 << 0), 80, 0)
        fakepep_set_attack(1, 1, (1 << 0), 80, 0)
        fakepep_set_attack(1, 2, (4 << 0), 120, 0)
        fakepep_set_attack(1, 3, (5 << 0), 120, 0)
        fakepep_set_attack(1, 4, (5 << 0), 120, 0)
        fakepep_start_projectiles(1, 0)
        fakepep_add_grabclone(1, 0, 1, 180)
        fakepep_add_grabclone(1, 0, -1, 180)
        fakepep_start_projectiles(1, 1)
        fakepep_add_bodyslamclone(1, 1, 1, 180)
        fakepep_add_bodyslamclone(1, 1, -1, 180)
        fakepep_start_projectiles(1, 2)
        fakepep_add_flailingclone(1, 2, 1, 100)
        fakepep_add_flailingclone(1, 2, -1, 100)
        fakepep_start_projectiles(1, 3)
        fakepep_add_tauntclones(1, 3, -12, -15, 120)
        fakepep_add_tauntclones(1, 3, -15, -12, 120)
        fakepep_add_tauntclones(1, 3, -11, -11, 120)
        fakepep_add_tauntclones(1, 3, -13, -8, 120)
        fakepep_add_tauntclones(1, 3, -8, -13, 120)
    }
    with (obj_bosscontroller)
    {
        boss_hpsprite = spr_bossfight_fakepephp
        boss_palette = 4056
    }
}
if (elitehit <= 0 && destroyable)
    instance_destroy(obj_noisey)
event_inherited()
