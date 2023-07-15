event_inherited()
content = obj_pizzakincheese
gnome_id = 1
customer_x = 27
customer_y = 144
spr_idle = spr_gnome1_idle
spr_happy = spr_gnome1_happy
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
