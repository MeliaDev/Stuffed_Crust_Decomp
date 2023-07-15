if (room == Realtitlescreen)
    ini_str = ""
fadeoutcreate = 0
if instance_exists(obj_player)
{
    if (obj_player.character == "N" || (obj_player.character == "P" && obj_player.ispeppino == 0))
        sliceicon = choose(2761, 2831)
}
if (current_month == 12)
    sliceicon = 2831
if (current_month == 10)
    sliceicon = 2761
