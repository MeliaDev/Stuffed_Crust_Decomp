hp = 2
depth = 1
content = obj_null
if (obj_player.character == "N" || (obj_player.character == "P" && obj_player.ispeppino == 0))
{
    if global.panic
        sprite_index = choose(spr_xmasbigblockescape, spr_halloweenbigblockescape)
    else
        sprite_index = choose(spr_xmasbigblock, spr_halloweenbigblock)
}
if (current_month == 10)
{
    sprite_index = spr_halloweenbigblock
    if global.panic
        sprite_index = spr_halloweenbigblockescape
}
if (current_month == 12)
{
    sprite_index = spr_xmasbigblock
    if global.panic
        sprite_index = spr_xmasbigblockescape
}
stickygib = 0
