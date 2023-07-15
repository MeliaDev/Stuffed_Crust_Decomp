if (global.collectsound < 10)
    global.collectsound += 1
if (place_meeting(x, y, obj_secretbigblock) || place_meeting(x, y, obj_shotgunblock))
    visible = false
else
    visible = true
if (global.timeattack == 1)
    instance_destroy()
if (place_meeting(x, y, obj_destructibles) || place_meeting(x, y, obj_iceblock_breakable))
    depth = 102
else
    depth = 2
if (abs(distance_to_object(obj_player1)) < 25 && (!(place_meeting(x, y, obj_destructibles))) && (!(place_meeting(x, y, obj_iceblock_breakable))) && (!(place_meeting(x, y, obj_iceblock))) && (!(place_meeting(x, y, obj_ghostblock))))
{
    if (!gotowardsplayer)
        scr_ghostcollectible()
    gotowardsplayer = 1
}
if (gotowardsplayer == 1)
{
    move_towards_point(obj_player.x, obj_player.y, movespeed)
    movespeed++
}
if resetmode
{
    with (instance_create(x, y, obj_genericpoofeffect))
        depth = (other.depth - 10)
    sprite_index = choose(spr_shroomcollect, spr_tomatocollect, spr_cheesecollect, spr_sausagecollect, spr_pineapplecollect)
    with (obj_player1)
    {
        if (isgustavo || other.gus)
            other.sprite_index = choose(spr_cheesecollect, spr_eggcollect, spr_baconcollect, spr_shrimpcollect, spr_fishcollect, spr_paccheesecollect)
        else if (character == "P" && ispeppino)
            other.sprite_index = choose(spr_shroomcollect, spr_tomatocollect, spr_cheesecollect, spr_sausagecollect, spr_pineapplecollect)
        else if (character == "N" || (character == "P" && (!ispeppino)))
            other.sprite_index = choose(spr_halloweencollectibles1, spr_halloweencollectibles2, spr_halloweencollectibles3, spr_halloweencollectibles4, spr_halloweencollectibles5, spr_xmastopping1, spr_xmastopping2, spr_xmastopping3, spr_xmastopping4, spr_xmastopping5)
    }
    if (current_month == 12)
        sprite_index = choose(spr_xmastopping1, spr_xmastopping2, spr_xmastopping3, spr_xmastopping4, spr_xmastopping5)
    if (current_month == 10)
        sprite_index = choose(spr_halloweencollectibles1, spr_halloweencollectibles2, spr_halloweencollectibles3, spr_halloweencollectibles4, spr_halloweencollectibles5)
    altchance = irandom(100)
    var theroomname = room_get_name(room)
    if (string_pos("entrance", theroomname) != 0)
    {
        switch altchance
        {
            case 7:
            case 77:
                sprite_index = spr_bananacollect
                break
        }

    }
    if (string_pos("farm", theroomname) != 0)
    {
        switch altchance
        {
            case 7:
            case 77:
                sprite_index = spr_eggcollect
                break
        }

    }
    if (string_pos("beach", theroomname) != 0 || string_pos("plage", theroomname) != 0)
    {
        switch altchance
        {
            case 7:
            case 77:
                if (irandom(10) != 7)
                    sprite_index = spr_fishcollect
                else
                    sprite_index = spr_shrimpcollect
                break
        }

    }
    if (string_pos("street", theroomname) != 0 && (!obj_player1.isgustavo))
    {
        switch altchance
        {
            case 7:
            case 77:
                if (room > street_jail && room != street_bacon)
                {
                    if (irandom(10) != 7)
                        sprite_index = spr_baconcollect
                    else
                        sprite_index = spr_shrimpcollect
                }
                else if (irandom(10) != 7)
                    sprite_index = spr_shrimpcollect
                else
                    sprite_index = spr_baconcollect
                break
        }

    }
    if global.panic
        sprite_index = choose(spr_fishcollect, spr_bananacollect, spr_shrimpcollect, spr_baconcollect, spr_eggcollect)
    resetmode = 0
}
