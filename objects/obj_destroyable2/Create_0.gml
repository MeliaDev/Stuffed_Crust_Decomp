global.breaksound = 0
image_index = random_range(0, (image_number - 1))
depth = 1
if (obj_player.character == "N" || (obj_player.character == "P" && obj_player.ispeppino == 0))
{
    if global.panic
        sprite_index = choose(spr_halloweensmallblockescape, spr_xmasblockescape)
    else
        sprite_index = choose(spr_halloweensmallblock, spr_xmasblock)
}
if (current_month == 10)
{
    sprite_index = spr_halloweensmallblock
    if global.panic
        sprite_index = spr_halloweensmallblockescape
}
if (current_month == 12)
{
    sprite_index = spr_xmasblock
    if global.panic
        sprite_index = spr_xmasblockescape
}
var theroomname = room_get_name(room)
if (string_pos("secret", theroomname) != 0)
    sprite_index = spr_secretblock_smallpoints
stickygib = 0
