angle += (angle_dir * angle_spd)
if (angle > 360)
    angle = 0
if (angle < 0)
    angle = 360
x = (xstart + lengthdir_x(len, angle))
y = (ystart + lengthdir_y(len, angle))
if (sprite_index == spr_angelpriest)
{
    if (abs((x - obj_player1.x)) > 30)
        image_xscale = (-(sign((obj_player1.x - x))))
}
else if (abs((x - obj_player1.x)) > 30)
    image_xscale = sign((obj_player1.x - x))
