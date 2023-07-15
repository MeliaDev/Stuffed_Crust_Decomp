if (!obj_player.ispeppino)
{
    sprite_index = spr_noisetoggle_pedestal
    if (obj_player.character == "N")
        image_index = 0
    if (obj_player.character == "P")
        image_index = 1
    instance_create(x, (y - 18), obj_genericpoofeffect)
}
else
    sprite_index = spr_noisetoggle_pedestal_empty
