if (place_meeting(x, y, obj_shotgunblock) || place_meeting(x, y, obj_ratblock) || place_meeting(x, y, obj_destructibles) || place_meeting(x, y, obj_secretmetalblock))
    depth = 102
else
    depth = 2
if resetmode
{
    with (instance_create(x, y, obj_genericpoofeffect))
        depth = (other.depth - 10)
    sprite_index = choose(spr_pizzacollect1, spr_pizzacollect2, spr_pizzacollect3, spr_pizzacollect4, spr_pizzacollect5)
    with (obj_player1)
    {
        if (isgustavo || other.gus)
            other.sprite_index = choose(spr_pizzacollect4, spr_pizzacollect2)
        else if (character == "P" && ispeppino)
            other.sprite_index = choose(spr_pizzacollect1, spr_pizzacollect2, spr_pizzacollect3, spr_pizzacollect4, spr_pizzacollect5)
        else if (character == "N" || (character == "P" && (!ispeppino)))
            other.sprite_index = choose(spr_pizzacollect1halloween, spr_pizzacollect2halloween, spr_pizzacollect3halloween)
    }
    if (current_month == 12)
        sprite_index = choose(spr_xmasbigpizza1, spr_xmasbigpizza2)
    if (current_month == 10)
        sprite_index = choose(spr_pizzacollect1halloween, spr_pizzacollect2halloween, spr_pizzacollect3halloween)
    resetmode = 0
}
