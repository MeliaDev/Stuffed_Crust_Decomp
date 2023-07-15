gus = 0
resetmode = 0
sprite_index = choose(spr_pizzacollect1, spr_pizzacollect2, spr_pizzacollect3, spr_pizzacollect4, spr_pizzacollect5)
with (obj_player1)
{
    if isgustavo
        other.sprite_index = choose(spr_pizzacollect4, spr_pizzacollect2)
    else if (character == "S")
        other.sprite_index = spr_snickcollectible2
    else if (character == "P" && ispeppino)
        other.sprite_index = choose(spr_pizzacollect1, spr_pizzacollect2, spr_pizzacollect3, spr_pizzacollect4, spr_pizzacollect5)
    else if (character == "N" || (character == "P" && (!ispeppino)))
        other.sprite_index = choose(spr_pizzacollect1halloween, spr_pizzacollect2halloween, spr_pizzacollect3halloween)
}
if (current_month == 12)
    sprite_index = choose(spr_xmasbigpizza1, spr_xmasbigpizza2)
if (current_month == 10)
    sprite_index = choose(spr_pizzacollect1halloween, spr_pizzacollect2halloween, spr_pizzacollect3halloween)
image_speed = 0.35
depth = 11
value = 100
