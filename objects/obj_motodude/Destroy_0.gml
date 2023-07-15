if instance_exists(obj_smokingprojectile)
{
    with (obj_smokingprojectile)
        instance_destroy();
}
with (create_debris(x, y, 4443))
    vsp = irandom_range(-7, -11)
if explode
{
    var i = 0
    repeat sprite_get_number(spr_pizzacar_debris)
    {
        with (create_debris(x, y, 4058))
        {
            image_index = i
            vsp = irandom_range(-7, -11)
        }
        i++
    }
}
