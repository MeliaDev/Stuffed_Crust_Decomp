if (defused == 1)
    countdown -= 0.5
if (countdown < 50)
    sprite_index = bomblit_spr
var _destroyed = 0
if (countdown <= 0)
{
    _destroyed = 1
    instance_destroy()
}
if (kickbuffer > 0)
{
    if (!(place_meeting(x, y, obj_player)))
        kickbuffer = 0
}
switch state
{
    case (0 << 0):
        hsp = (movespeed * image_xscale)
        if (place_meeting((x + hsp), y, obj_solid) && (!(place_meeting((x + hsp), y, obj_ratblock))))
            image_xscale *= -1
        if (place_meeting((x + hsp), y, obj_ratblock) || place_meeting(x, (y + vsp), obj_ratblock))
            instance_destroy()
        if (scr_solid((x + 1), y) || scr_solid((x - 1), y))
            drop = 1
        if grounded
        {
            if (movespeed > 0)
                movespeed -= 0.5
            if insta
                instance_destroy()
        }
        if place_meeting(x, (y + 1), obj_railparent)
        {
            var _railinst = instance_place(x, (y + 1), obj_railparent)
            hsp = (_railinst.movespeed * _railinst.dir)
        }
        if (vsp < 12)
            vsp += grav
        scr_collide()
        break
    case (4 << 0):
        grounded = 0
        x = (playerid.x + ((-playerid.xscale) * 6))
        y = (playerid.y - 55)
        image_xscale = playerid.xscale
        if (playerid.state != (52 << 0) && playerid.state != (76 << 0))
            state = (0 << 0)
        if (state == (4 << 0) && _destroyed)
            scr_hurtplayer(playerid)
        if (playerid.state == (76 << 0))
        {
            if playerid.grounded
                instance_destroy()
        }
        break
    default:
        state = (0 << 0)
        break
}

if (sprite_index == bomblit_spr)
{
    if (!fmod_event_instance_is_playing(snd))
        fmod_event_instance_play(snd)
    fmod_event_instance_set_3d_attributes(snd, x, y)
}
if (sprite_index == spr_bomb)
{
    if (floor(image_index) == 5 && (!bouncesound))
    {
        bouncesound = ground_boundtitrle_cardd
        fmod_event_one_shot_3d("event:/sfx/pep/bombbounce", x, y)
    }
    else if (floor(image_index) != 5)
        bouncesound = 0
}
