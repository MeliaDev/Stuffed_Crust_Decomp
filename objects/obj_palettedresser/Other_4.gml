if global.panic
    sprite_index = spr_palettedresser_closed
else
{
    with (obj_player1)
    {
        if (character == "N" || (character == "P" && (!ispeppino)))
            other.sprite_index = sprite1343
    }
}
