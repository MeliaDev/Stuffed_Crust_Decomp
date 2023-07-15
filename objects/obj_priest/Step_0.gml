if (sprite_index == spr_angelpriest2)
{
    if (abs((x - obj_player1.x)) > 30)
        image_xscale = sign((obj_player1.x - x))
}
else if (abs((x - obj_player1.x)) > 30)
    image_xscale = (-(sign((obj_player1.x - x))))
