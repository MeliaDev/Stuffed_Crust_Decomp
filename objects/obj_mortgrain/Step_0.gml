with (instance_place((x - 1), y, obj_player))
{
    if (state == (11 << 0) && other.eaten == 0)
    {
        movespeed = abs(movespeed)
        other.eaten = 1
        grav = 0.5
        state = (0 << 0)
    }
}
with (instance_place((x + 1), y, obj_player))
{
    if (state == (11 << 0) && other.eaten == 0)
    {
        movespeed = abs(movespeed)
        other.eaten = 1
        grav = 0.5
        state = (0 << 0)
    }
}
with (instance_place((x - 32), y, obj_shotgunbullet))
{
    if (sprite_index == spr_mortprojectile && other.eaten == 0)
    {
        other.eaten = 1
        instakill = 1
        instance_destroy()
    }
}
with (instance_place((x + 32), y, obj_shotgunbullet))
{
    if (sprite_index == spr_mortprojectile && other.eaten == 0)
    {
        other.eaten = 1
        instakill = 1
        instance_destroy()
    }
}
if (eaten && sprite_index != spr_corneaten)
{
    if instance_exists(obj_well)
    {
        with (obj_well)
            eaten = 1
    }
    x = -100
    y = -100
    sprite_index = spr_corneaten
    var val = 500
    global.collect += val
    global.combotime = 60
    with (instance_create((x + 16), y, obj_smallnumber))
        number = string(val)
    scr_sound_multiple("event:/sfx/misc/collect", x, y)
    var d = round((val / 16))
    for (var i = 0; i < val; i += d)
        create_collect((other.x + irandom_range(-60, 60)), (other.y + irandom_range(-60, 60)), choose(2089, 2091, 2092, 2094, 2090), d)
    if (global.panic == 0)
    {
        if (ds_list_find_index(global.saveroom, id) == -1)
            ds_list_add(global.saveroom, id)
    }
}
