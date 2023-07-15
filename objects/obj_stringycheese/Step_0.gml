targetplayer = instance_nearest(x, y, obj_player)
image_speed = 0.35
switch state
{
    case (0 << 0):
        hand_xscale = (drawhandx < x ? 1 : -1)
        idlebuffer = 0
        spr_hand = spr_mrpinch_hand1
        sprite_index = spr_mrpinch_face1
        var _dir = point_direction(x, y, targetplayer.x, targetplayer.y)
        var spd = (shootbuffer > 0 ? 3 : 10)
        var tx = targetplayer.x
        var ty = targetplayer.y
        if (point_distance(x, y, handx, handy) >= (maxhandlen - 20))
        {
            tx = (x + lengthdir_x(maxhandlen, _dir))
            ty = (y + lengthdir_y(maxhandlen, _dir))
            _dir = point_direction(x, y, tx, ty)
        }
        handx = Approach(handx, tx, spd)
        handy = Approach(handy, ty, spd)
        if (handy < y)
            handy = y
        drawhandx = lerp(drawhandx, handx, 0.2)
        drawhandy = lerp(drawhandy, handy, 0.2)
        if (shootbuffer > 0)
            shootbuffer--
        if (shootbuffer <= 0 && place_meeting(handx, handy, obj_player))
        {
            playerid = instance_place(handx, handy, obj_player)
            with (playerid)
            {
                if (state == (21 << 0))
                {
                    repeat (3)
                        create_debris((x + (xscale * 30)), (y + random_range(-8, 8)), 4085)
                }
            }
            if (playerid.state != (15 << 0))
            {
                launch_hsp = (sign(playerid.hsp) * 3)
                launch_vsp = -20
                hsp = playerid.hsp
                vsp = 10
                with (playerid)
                {
                    if (state == (210 << 0) || state == (209 << 0))
                        create_debris(x, y, 3377)
                    tauntstoredstate = state
                    tauntstoredmovespeed = movespeed
                    tauntstoredsprite = sprite_index
                    state = (214 << 0)
                    stringid = other.id
                    movespeed = hsp
                    other.previousx = x
                    other.previousy = y
                    if (abs(movespeed) >= 16)
                        movespeeddeccel = 1.8
                    else
                        movespeeddeccel = 0.5
                }
                state = (15 << 0)
            }
        }
        break
    case (15 << 0):
        sprite_index = spr_mrpinch_face2
        spr_hand = spr_mrpinch_hand2
        handx = playerid.x
        handy = playerid.y
        drawhandx = handx
        drawhandy = handy
        if (handy < (y - 200) || playerid.state == (150 << 0))
        {
            state = (0 << 0)
            with (playerid)
            {
                if (state == (214 << 0))
                {
                    if (tauntstoredstate == (26 << 0))
                        state = (26 << 0)
                    else
                    {
                        sprite_index = spr_machfreefall
                        state = (92 << 0)
                    }
                }
            }
            break
        }
        else
        {
            drawhandx = handx
            drawhandy = handy
            hand_xscale = playerid.xscale
            if (playerid.state != (150 << 0))
            {
                with (playerid)
                {
                    sprite_index = spr_mrpinch
                    stringid = other.id
                    state = (214 << 0)
                    if (grounded && vsp > 0)
                    {
                        hsp_carry = (sign((other.x - x)) * 4)
                        if (abs(hsp) > abs(hsp_carry) && sign(hsp) != sign(hsp_carry))
                            hsp_carry = (-hsp)
                    }
                    if (y > other.y)
                    {
                        if (y > (other.y + (other.maxhandlen / 2)) && vsp > 0 && y > other.y)
                        {
                            other.state = (19 << 0)
                            other.shootbuffer = 60
                            other.launch_dir = point_direction(0, 0, other.launch_hsp, other.launch_vsp)
                            stringid = other.id
                        }
                    }
                    var _solid = 0
                    if place_meeting(x, (y - 1), obj_solid)
                        _solid = 1
                    if (_solid || (vsp > 0 && y < other.y) || (x == other.previousx && y == other.previousy))
                        other.idlebuffer++
                    else
                        other.idlebuffer = 0
                    other.previousx = x
                    other.previousy = y
                    if (other.idlebuffer > 60)
                    {
                        other.state = (0 << 0)
                        other.shootbuffer = 20
                        other.idlebuffer = 0
                        state = (0 << 0)
                    }
                }
            }
            else
                state = (0 << 0)
            break
        }
    case (19 << 0):
        sprite_index = spr_mrpinch_face2
        hand_index = spr_mrpinch_hand2
        hand_xscale = playerid.xscale
        handy = playerid.y
        handx = playerid.x
        drawhandx = handx
        drawhandy = handy
        var s1 = 0.9
        hsp += lengthdir_x(s1, launch_dir)
        vsp += lengthdir_y(s1, launch_dir)
        with (playerid)
        {
            sprite_index = spr_mrpinch
            other.shootbuffer = 10
            hsp = other.hsp
            vsp = other.vsp
            if (y <= other.y)
            {
                other.shootbuffer = 0
                movespeed = abs(movespeed)
                if (movespeed != 0)
                    xscale = sign(movespeed)
                vsp = other.launch_vsp
                instance_create(x, y, obj_speedlinesup)
                dir = xscale
                jumpAnim = 1
                momemtum = 1
                jumpstop = 1
                sprite_index = spr_machfreefall
                state = (92 << 0)
                with (other)
                {
                    state = (8 << 0)
                    shootbuffer = 80
                }
                notification_push((24 << 0), [room, other.id, id])
            }
        }
        break
    case (8 << 0):
        hand_xscale = 1
        spr_hand = spr_mrpinch_hand3
        sprite_index = spr_mrpinch_face3
        handx = Approach(handx, (x - 40), 4)
        handy = Approach(handy, (y + 5), 4)
        drawhandx = handx
        drawhandy = handy
        if (shootbuffer > 0)
            shootbuffer--
        else
        {
            state = (0 << 0)
            shootbuffer = 30
        }
        break
}

hand_index += 0.35
if (hand_index > (sprite_get_number(hand_index) - 1))
    hand_index = frac(hand_index)
