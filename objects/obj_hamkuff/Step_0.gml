/*
WARNING: Recursive script decompilation (for member variable name resolution) failed for distance_between_points

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
switch state
{
    case (126 << 0):
        scr_enemy_idle()
        break
    case (130 << 0):
        scr_enemy_turn()
        break
    case (134 << 0):
        break
    case (206 << 0):
        if (!instance_exists(playerid))
        {
            state = (134 << 0)
            break
        }
        else
        {
            if (x != playerid.x)
                image_xscale = (-(sign((x - playerid.x))))
            var _is_brick = playerid.object_index == obj_brickcomeback
            if (!_is_brick)
            {
                with (playerid)
                {
                    if (state == (152 << 0))
                        other.state = (134 << 0)
                    else if (!launched)
                    {
                        hamkuffID = other.id
                        var _xs = 0
                        if (x != other.x)
                            _xs = (-(sign((x - other.x))))
                        var dis = 180
                        var m = (abs((x - other.x)) > dis ? abs(hsp) : (abs(hsp) - max(0, (abs(hsp) - 2))))
                        if (hsp == 0)
                            m = _xs
                        if (!((state == (105 << 0) && sprite_index == spr_mach3boost)))
                            hsp_carry = (_xs * abs(m))
                        else
                            hsp_carry = (-hsp)
                        if (state != (106 << 0) && state != (121 << 0) && state != (104 << 0) && state != (105 << 0) && abs((x - other.x)) > ((dis + abs(movespeed)) + 1))
                        {
                            state = (106 << 0)
                            fmod_event_one_shot_3d("event:/sfx/pep/bumpwall", x, y)
                            sprite_index = spr_bump
                            if (x != other.x)
                            {
                                hsp = ((-(sign((x - other.x)))) * 3)
                                if ((!other.attract_player) && place_meeting((x + sign(hsp)), y, obj_solid) && (!(place_meeting((x + sign(hsp)), y, obj_slope))))
                                {
                                    other.attract_player = 1
                                    launched = 0
                                    flash = 1
                                    fmod_event_one_shot_3d("event:/sfx/pep/bumpwall", x, y)
                                }
                            }
                        }
                        if ((!other.attract_player) && y > (other.y + 100) && collision_line(other.x, other.y, x, y, obj_solid, false, true) != -4)
                        {
                            other.attract_player = 1
                            launched = 0
                            flash = 1
                            fmod_event_one_shot_3d("event:/sfx/pep/bumpwall", x, y)
                        }
                        if (state == (121 << 0) || (state == (105 << 0) && sprite_index == spr_mach3boost))
                            launch = 1
                        if (state == (105 << 0) && sprite_index == spr_mach3boost && launch)
                            movespeed -= 0.6
                        if (state == (121 << 0) && movespeed > 15)
                            movespeed = 15
                        freefallsmash = 0
                        if (state == (78 << 0) || state == (37 << 0) || state == (99 << 0) || state == (97 << 0) || state == (123 << 0) || y < (other.y - 400))
                        {
                            fmod_event_one_shot_3d("event:/sfx/pep/bumpwall", x, y)
                            vsp = -4
                            hsp = (-3 * xscale)
                            state = (106 << 0)
                            sprite_index = spr_bump
                            image_index = 0
                        }
                        if (distance_to_object(other) > 350 && (!other.attract_player))
                        {
                            other.attract_player = 1
                            launched = 0
                            flash = 1
                            fmod_event_one_shot_3d("event:/sfx/pep/bumpwall", x, y)
                        }
                        if other.attract_player
                        {
                            launched = 0
                            state = (146 << 0)
                            hsp = 0
                            vsp = 0
                            movespeed = 0
                            sprite_index = spr_machfreefall
                            var tx = other.x
                            var ty = other.y
                            var _dir = point_direction(x, y, tx, ty)
                            x += lengthdir_x(7, _dir)
                            y += lengthdir_y(7, _dir)
                            if (abs((x - tx)) < 20 && abs((y - ty)) < 32)
                            {
                                x = tx
                                y = ty
                                state = (92 << 0)
                                other.attract_player = 0
                            }
                        }
                        if launched
                        {
                            other.state = (134 << 0)
                            instance_destroy(other)
                            global.combotime = 60
                        }
                        if (other.grabsound == 0)
                        {
                            fmod_event_one_shot_3d("event:/sfx/enemies/hamkuffgrab", x, y)
                            other.grabsound = ground_boundtitrle_cardd
                        }
                        if (visible == false || state == (152 << 0))
                        {
                            with (other)
                            {
                                sprite_index = idlespr
                                state = (126 << 0)
                            }
                        }
                    }
                }
                if playerid.launch
                    sprite_index = spr_hamkuff_chain2
                else
                    sprite_index = spr_hamkuff_chain1
            }
            else
            {
                with (playerid)
                {
                    tx = (other.x + (other.image_xscale * 32))
                    ty = other.y
                    if (distance_between_points(x, y, tx, ty) > 10)
                    {
                        _dir = point_direction(x, y, tx, ty)
                        x += lengthdir_x(10, _dir)
                        y += lengthdir_y(10, _dir)
                    }
                }
            }
            break
        }
    case (136 << 0):
        scr_enemy_land()
        break
    case (137 << 0):
        scr_enemy_hit()
        break
    case (138 << 0):
        scr_enemy_stun()
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
    case (125 << 0):
        scr_enemy_rage()
        break
    case (17 << 0):
        scr_enemy_ghostpossess()
        break
}

if (state == (138 << 0) && stunned > 100 && birdcreated == 0)
{
    birdcreated = 1
    with (instance_create(x, y, obj_enemybird))
        ID = other.id
}
if (state != (134 << 0) && state != (206 << 0))
    attract_player = 0
var _dis = 300
if (state == (134 << 0) && obj_player1.isgustavo && (!obj_player1.cutscene) && obj_player1.state != (292 << 0) && obj_player1.state != (119 << 0) && ((distance_to_object(obj_player) < _dis && obj_player1.brick) || distance_to_object(obj_ratmountgroundpound) < _dis || (distance_to_object(obj_brickcomeback) < _dis && instance_exists(obj_brickcomeback) && (!obj_brickcomeback.trapped)) || distance_to_object(obj_brickball) < _dis))
{
    state = (206 << 0)
    sprite_index = spr_hamkuff_chain1
    var x1 = obj_player1.x
    var y1 = obj_player1.y
    if instance_exists(obj_ratmountgroundpound)
    {
        x1 = obj_ratmountgroundpound.x
        y1 = obj_ratmountgroundpound.y
    }
    else if instance_exists(obj_brickcomeback)
    {
        x1 = obj_brickcomeback.x
        y1 = obj_brickcomeback.y
    }
    else if instance_exists(obj_brickball)
    {
        x1 = obj_brickball.x
        y1 = obj_brickball.y
    }
    with (instance_create(x1, y1, obj_parryeffect))
        sprite_index = spr_morthookgrabeffect
    instance_destroy(obj_ratmountgroundpound, false)
    instance_destroy(obj_brickcomeback, false)
    instance_destroy(obj_brickball, false)
    with (instance_create(x1, y1, obj_brickcomeback))
    {
        trapped = 1
        baddieID = other.id
        other.playerid = id
    }
    with (obj_player1)
    {
        fmod_event_one_shot_3d("event:/sfx/enemies/hamkuffgrab", other.x, other.y)
        fmod_event_one_shot_3d("event:/sfx/rat/ratdead", x, y)
        fmod_event_one_shot_3d("event:/sfx/pep/bumpwall", x, y)
        brick = 0
        sprite_index = spr_lonegustavo_idle
        state = (191 << 0)
    }
}
if (state != (138 << 0))
    birdcreated = 0
if (flash == 1 && alarm[2] <= 0)
    alarm[2] = (0.15 * room_speed)
if (state != (4 << 0))
    depth = 0
if (state != (138 << 0))
    thrown = 0
