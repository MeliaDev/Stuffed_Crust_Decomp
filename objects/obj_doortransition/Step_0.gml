if (image_xscale < 60)
{
    image_xscale += 1
    image_yscale += 1
}
if (image_xscale > 40)
{
    with (obj_fadeout)
        door_override = 0
}
depth = (obj_player1.depth + 1)
