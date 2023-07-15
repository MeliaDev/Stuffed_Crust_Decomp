/*
WARNING: Recursive script decompilation (for member variable name resolution) failed for distance_to_pos

System.InvalidOperationException: Stack empty.
   at System.Collections.Generic.Stack`1.ThrowForEmptyStack()
   at System.Collections.Generic.Stack`1.Pop()
   at UndertaleModLib.Decompiler.DecompileFromBlock(DecompileContext context, Dictionary`2 blocks, Block block, List`1 tempvars, Stack`1 workQueue) in D:\a\UndertaleModTool\UndertaleModTool\UndertaleModLib\Decompiler\Decompiler.cs:line 2152
   at UndertaleModLib.Decompiler.DecompileFromBlock(DecompileContext context, Dictionary`2 blocks, Block block) in D:\a\UndertaleModTool\UndertaleModTool\UndertaleModLib\Decompiler\Decompiler.cs:line 2652
   at UndertaleModLib.Decompiler.<DecompileFromBlock>g__FindActualNameForAnonymousCodeObject|30_2(DecompileContext context, UndertaleCode anonymousCodeObject) in D:\a\UndertaleModTool\UndertaleModTool\UndertaleModLib\Decompiler\Decompiler.cs:line 2428
*/
if (room == rm_editor)
{
}
if elite
    paletteselect = 0
else
    paletteselect = 1
var targetplayer = instance_nearest(x, y, obj_player)
switch state
{
    case (126 << 0):
        if (sprite_index != scaredspr)
        {
            sprite_index = spr_pepbat_idle
            if (targetplayer.x > (x - 150) && targetplayer.x < (x + 150) && targetplayer.y > y && targetplayer.y < (y + 200))
            {
                state = (134 << 0)
                hit = 0
            }
        }
        else
        {
            hsp = 0
            vsp = 0
            if (scaredbuffer > 0)
                scaredbuffer--
            else
            {
                sprite_index = spr_pepbat_idle
                if (!(distance_to_pos(x, y, xstart, ystart, 32, 32)))
                {
                    sprite_index = spr_pepbat_move
                    state = (130 << 0)
                    hit = 0
                }
                else
                {
                    x = xstart
                    y = ystart
                }
            }
        }
        break
    case (128 << 0):
        scr_enemy_charge()
        break
    case (130 << 0):
        sprite_index = spr_pepbat_move
        var dir = point_direction(x, y, xstart, ystart)
        x = Approach(x, xstart, abs(lengthdir_x(5, dir)))
        y = Approach(y, ystart, abs(lengthdir_y(5, dir)))
        if (xstart != x)
            image_xscale = sign((xstart - x))
        if (x > (xstart - 10) && x < (xstart + 10) && y > (ystart - 10) && y < (ystart + 10))
        {
            x = xstart
            y = ystart
            state = (126 << 0)
        }
        break
    case (134 << 0):
        vsp = 0
        hsp = 0
        sprite_index = spr_pepbat_move
        if (targetplayer.x != x)
            image_xscale = sign((targetplayer.x - x))
        if (!((targetplayer.x > (x - 70) && targetplayer.x < (x + 70) && y <= (targetplayer.y + 29) && y >= (targetplayer.y - 29))))
        {
            dir = point_direction(x, y, targetplayer.x, targetplayer.y)
            x += lengthdir_x(3, dir)
            y += lengthdir_y(3, dir)
        }
        if (hit || distance_to_point(xstart, ystart) > 800)
        {
            hit = 0
            state = (130 << 0)
        }
        break
    case (136 << 0):
        scr_enemy_land()
        break
    case (137 << 0):
        scr_enemy_hit()
        break
    case (138 << 0):
        scr_enemy_stun()
        hit = 1
        break
    case (129 << 0):
        scr_pizzagoblin_throw()
        break
    case (4 << 0):
        scr_enemy_grabbed()
        break
    case (154 << 0):
        scr_enemy_pummel()
        break
    case (155 << 0):
        scr_enemy_staggered()
        break
}

if (state == (138 << 0) && stunned > 100 && birdcreated == 0)
{
    birdcreated = 1
    with (instance_create(x, y, obj_enemybird))
        ID = other.id
}
if (state != (138 << 0))
    birdcreated = 0
if (flash == 1 && alarm[2] <= 0)
{
    if elite
        alarm[2] = (0.07 * room_speed)
    else
        alarm[2] = (0.15 * room_speed)
}
if (state != (4 << 0))
    depth = 0
if (state != (138 << 0))
    thrown = 0
if (sprite_index == spr_pepbat_move && floor(image_index) == 3 && sfxcooldown == 0)
{
    fmod_event_one_shot_3d("event:/sfx/enemies/batwing", x, y)
    sfxcooldown = 10
}
else if (sfxcooldown > 0)
    sfxcooldown--
scr_scareenemy()
if (bombreset > 0)
{
    if elite
        bombreset--
    bombreset--
}
targetplayer = (global.coop ? instance_nearest(x, y, obj_player) : obj_player1)
if (x != targetplayer.x && state == (134 << 0) && state != (129 << 0) && obj_player.state != (5 << 0) && bombreset <= 0 && grounded)
{
    if (targetplayer.x > (x - 80) && targetplayer.x < (x + 80) && y <= (targetplayer.y + 30) && y >= (targetplayer.y - 30))
    {
        if (state == (134 << 0))
        {
            image_index = 0
            sprite_index = spr_pepbat_kick
            image_xscale = (-(sign((x - targetplayer.x))))
            state = (129 << 0)
        }
    }
}
if (grounded && state == (129 << 0) && floor(image_index) == 3)
    vsp = -5
if (boundbox == 0)
{
    with (instance_create(x, y, obj_baddiecollisionbox))
    {
        sprite_index = other.sprite_index
        mask_index = other.sprite_index
        baddieID = other.id
        other.boundbox = 1
    }
}
