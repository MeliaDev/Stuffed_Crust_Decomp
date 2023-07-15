if (room == rm_editor)
    mask_index = spr_minipillarwoke
if (player < 2)
{
    if (place_meeting(xstart, ystart, obj_player1) && obj_player1.state != (61 << 0))
        player = 1
    else if (global.panic && (!(place_meeting(xstart, ystart, obj_player1))))
        player = 2
}
if (global.panic == 0 || player <= 1)
{
    x = -100
    y = -100
    mask_index = spr_minipillarsleep
    sprite_index = sleepsprite
}
else
{
    mask_index = spr_minipillarwoke
    sprite_index = wokesprite
    x = xstart
    y = ystart
}
if (place_meeting(x, y, obj_destructibles) || place_meeting(x, y, obj_iceblock_breakable))
    depth = 102
else
    depth = 2
