if instance_exists(obj_player)
    showtext = place_meeting(x, y, obj_player)
if instance_exists(obj_transfotip)
    showtext = 0
if showtext
    alpha = Approach(alpha, 1, 0.1)
else
    alpha = Approach(alpha, 0, 0.1)
if global.panic
    instance_destroy()
if global.panictilt
{
    sprite_index = spr_menutv2_confirm
    image_angle += 6
}
else if (distance_to_object(obj_player1) < 100 && obj_player1.y <= (y + sprite_height) && obj_player1.y >= y)
{
    sprite_index = spr_menutv2_selected
    image_angle = 0
}
else
{
    sprite_index = spr_menutv2_idle
    image_angle = 0
}
image_speed = 0.35
