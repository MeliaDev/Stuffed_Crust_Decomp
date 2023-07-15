wastedhits = (maxhp - hp)
targetplayer = instance_nearest(x, y, obj_player)
mask_index = spr_pizzahead_giddy
with (obj_player)
{
    if (state == (121 << 0) || state == (121 << 0))
        movespeed = 16
}
switch state
{
    case (0 << 0):
        self.scr_pizzaface_p3_normal()
        break
    case (42 << 0):
        scr_pizzaface_p3_handstandjump()
        break
    case (262 << 0):
        scr_pizzaface_p3_supergrab()
        break
    case (92 << 0):
        scr_pizzaface_p3_jump()
        break
}

if (hp <= 0)
    instance_destroy()
if (state == (92 << 0))
    use_collision = 0
else
    use_collision = 1
if use_collision
    scr_collide()
else
{
    x += hsp
    y += vsp
    if (vsp < 20)
        vsp += grav
}
