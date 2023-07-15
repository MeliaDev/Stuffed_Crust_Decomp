if (buffer > 0)
    buffer--
scr_collide()
if (!instance_exists(obj_chainsawpuff))
{
    with (instance_create((x - (12 * image_xscale)), y, obj_chainsawpuff))
        sprite_index = spr_pizzaslug_smoke
}
