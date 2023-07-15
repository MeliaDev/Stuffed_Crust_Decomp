hsp = (image_xscale * movespeed)
mask_index = spr_player_mask
if (scr_solid(x, (y + 1)) && vsp > 0)
{
    vsp = -5
    if (movespeed > 0)
        movespeed -= 1
}
if ((obj_explosion != obj_dynamiteexplosion_boss && obj_explosion != obj_canonexplosion && (playerid.key_shoot2 || playerid.key_taunt2 || playerid.key_slap2) && playerid.state != (2 << 0)) || countdown <= 0)
{
    instance_destroy()
    with (instance_create(x, y, obj_explosion))
    {
        with (obj_player1)
            dynamitebuff = 6
        if (other.playerid.object_index == obj_player)
            obj_player1.dynamite_inst = id
    }
}
if (place_meeting((x + hsp), y, obj_solid) || place_meeting((x + hsp), (y + vsp), obj_destructibles) || (obj_explosion != obj_canonexplosion && place_meeting(x, y, obj_baddie)))
    image_xscale *= -1
if (place_meeting((x + hsp), (y + vsp), obj_destructibles) || place_meeting((x + hsp), ((y + vsp) + 4), obj_ratblock) || place_meeting((x + hsp), (y + vsp), obj_hotmetalblock) || place_meeting((x + hsp), (y + vsp), obj_metalblock) || place_meeting(((x + hsp) + (16 * sign(hsp))), ((y + vsp) + (16 * sign(vsp))), obj_tntblock) || (obj_explosion != obj_canonexplosion && place_meeting(x, y, obj_baddie)))
{
    instance_destroy()
    with (instance_create(x, y, obj_explosion))
    {
        if (other.playerid.object_index == obj_player)
            obj_player1.dynamite_inst = id
    }
}
if (sprite_index == spr_dynamite && alarm[0] < 60)
    sprite_index = spr_dynamiteabouttoexplode
if (sprite_index == spr_dynamite || sprite_index == spr_dynamiteabouttoexplode)
    countdown--
scr_collide()
