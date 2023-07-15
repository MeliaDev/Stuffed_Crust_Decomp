var _dir = point_direction(x, y, x_to, y_to)
hsp = lengthdir_x(spd, _dir)
vsp = lengthdir_y(spd, _dir)
x = Approach(x, x_to, abs(hsp))
y = Approach(y, y_to, abs(vsp))
if (!finish)
{
    if (abs((x - x_to)) <= 18 && abs((y - y_to)) <= 18)
    {
        instance_destroy()
        scr_bosscontroller_particle_anim(1624, 0, x, y, 0.5)
        with (obj_bosscontroller)
            player_hp++
    }
}
