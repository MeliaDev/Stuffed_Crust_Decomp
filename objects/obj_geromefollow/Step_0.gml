if (sprite_index == spr_gerome_collected && floor(image_index) == (image_number - 1))
    sprite_index = idlespr
if (sprite_index == spr_gerome_idle1 && floor(image_index) == (image_number - 1))
    sprite_index = idlespr
if (room == rank_room || room == timesuproom)
    visible = false
if (obj_player1.spotlight == 1)
    playerid = 530
else
    playerid = 529
if (!animate)
    image_speed = 0.35
depth = -6
if (global.gerome == 2)
{
    movespr = spr_geromewalk
    idlespr = spr_geromeexit_idle
}
else
{
    movespr = spr_gerome_keymove
    idlespr = spr_gerome_keyidle
}
