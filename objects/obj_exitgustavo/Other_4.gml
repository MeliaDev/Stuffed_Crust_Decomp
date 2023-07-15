if obj_player1.isgustavo
{
    stick = 1
    if (irandom(100) <= 25)
        noisette = 1
}
else if (irandom(100) <= 50)
{
    if (irandom(100) <= 15)
    {
        stick = 1
        if ((!obj_player1.ispeppino) || obj_player1.character == "N" || obj_player.character == "V")
            noisette = 1
    }
}
else if (irandom(100) <= 15)
    noisette = 1
var r = string_letters(room_get_name(room))
if (sprite_index != spr_gustavo_exitsign || r == "saloon" || room == space_11b || r == "freezer" || r == "chateau" || noisette)
    stick = 0
if stick
    ystart -= 6
