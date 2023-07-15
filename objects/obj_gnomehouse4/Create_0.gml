event_inherited()
content = obj_pizzakinsausage
gnome_id = 3
customer_x = 27
customer_y = 144
spr_idle = spr_gnome2_idle
spr_happy = spr_gnome2_happy
image_index = 1
customer = instance_create((x + (customer_x * image_xscale)), (y + (customer_y * image_yscale)), obj_customeractor)
with (customer)
{
    image_xscale = other.image_xscale
    depth = (other.depth - 1)
    spr_idle = other.spr_idle
    spr_happy = other.spr_happy
    sprite_index = spr_idle
}
