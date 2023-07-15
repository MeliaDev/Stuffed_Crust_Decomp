if (sprite_index == spr_peppinobullet_collectible && global.bullet < 5)
{
    global.bullet += 1
    with (instance_create(x, y, obj_smallletters))
        letters = "BULLET"
    instance_destroy()
}
if (sprite_index == spr_fuelHUD && global.fuel < 5)
{
    global.fuel += 1
    with (instance_create(x, y, obj_smallletters))
        letters = "FUEL"
    instance_destroy()
}
fmod_event_one_shot("event:/sfx/misc/collectpizza")
