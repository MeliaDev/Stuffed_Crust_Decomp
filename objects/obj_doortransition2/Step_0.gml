if (!instance_exists(obj_fadeout))
{
    image_xscale -= 2
    image_yscale -= 2
}
else
{
    image_xscale = 60
    image_xscale = 60
    with (obj_fadeout)
    {
        if fadein
            fadealpha -= 0.05
    }
}
if (image_xscale <= 0)
    instance_destroy()
depth = (obj_player1.depth + 1)
