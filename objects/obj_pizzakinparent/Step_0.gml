visible = ((room == rank_room || room == timesuproom) ? false : playerid.visible)
if (obj_player.state == (87 << 0))
    visible = false
playerid = (obj_player1.spotlight ? obj_player1 : obj_player2)
if (showtext == 1)
{
    alarm[0] = 50
    showtext = 2
}
if (state != (84 << 0))
{
    if (object_index != obj_pizzakinpineapple || (sprite_index != spr_monsterpineapple_smile && sprite_index != spr_monsterpineapple_pose1 && sprite_index != spr_monsterpineapple_pose2 && sprite_index != spr_monsterpineapple_pose3))
    {
        if (sprite_index == spr_intro && floor(image_index) == (image_number - 1))
            sprite_index = spr_idle
        if (sprite_index != spr_intro)
        {
            image_alpha = playerid.image_alpha
            sprite_index = (xprev != x ? spr_run : spr_idle)
            depth = -6
        }
        if (global.panic && sprite_index == spr_idle && (!instance_exists(obj_ghostcollectibles)))
            sprite_index = spr_panic
    }
    else if (object_index == obj_pizzakinpineapple)
    {
        if (image_index > (image_number - 1))
        {
            image_index = 0
            sprite_index = spr_toppinpineapple
        }
    }
    if (obj_player1.state == (84 << 0))
    {
        instance_create(x, y, obj_tinytaunt)
        sprite_index = spr_taunt
        image_index = irandom((sprite_get_number(spr_taunt) - 1))
        state = (84 << 0)
        lock = 1
    }
}
else
{
    hsp = 0
    vsp = 0
    if (sprite_index != spr_intro)
    {
        var s = obj_player1.sprite_index
        if (s == obj_player1.spr_supertaunt1 || s == obj_player1.spr_supertaunt2 || s == obj_player1.spr_supertaunt3 || s == obj_player1.spr_supertaunt4 || s == obj_player1.spr_supertaunt5 || s == 2475)
        {
            sprite_index = spr_intro
            image_index = 0
        }
    }
    if (obj_player1.state != (84 << 0) || (sprite_index == spr_intro && floor(image_index) == (image_number - 1)))
    {
        instance_destroy(obj_tinytaunt)
        interp = 0
        sprite_index = spr_idle
        lock = 0
        state = (0 << 0)
    }
}
