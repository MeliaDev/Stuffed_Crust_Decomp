if (room == rm_editor)
    mask_index = spr_minipillarwoke
if (player < 2)
{
    if (place_meeting(xstart, ystart, obj_player1) && obj_player1.state != (61 << 0))
        player = 1
    else if ((!global.panic) && (!(place_meeting(xstart, ystart, obj_player1))))
        player = 2
}
if (global.panic == 0 && player != 1)
{
    x = xstart
    y = ystart
    sprite_index = wokesprite
    mask_index = spr_minipillarwoke
}
else
{
    x = -100
    y = -100
    sprite_index = sleepsprite
    mask_index = spr_minipillarsleep
}
if (place_meeting(x, y, obj_destructibles) || place_meeting(x, y, obj_iceblock_breakable))
    depth = 102
else
    depth = 2
