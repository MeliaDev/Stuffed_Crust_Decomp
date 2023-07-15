if (other.state == (108 << 0) || other.state == (121 << 0))
{
    if (other.state != (121 << 0))
        other.xscale = sign(image_xscale)
    other.state = (32 << 0)
    other.movespeed = abs(hsp)
    other.sprite_index = spr_player_pizzacar
    explode = 0
    instance_destroy()
}
else if other.instakillmove
{
    explode = 0
    instance_destroy()
    instance_create(x, y, obj_motocycle)
}
