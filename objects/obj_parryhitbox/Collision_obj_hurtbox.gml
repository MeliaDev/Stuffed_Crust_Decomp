if (other.object_index == obj_spitcheesespike || other.object_index == obj_banditochicken_projectile || other.object_index == obj_robotknife)
{
    with (other)
    {
        var current_hspd = abs(hsp)
        var _dir = sign(hsp)
        if (x != other.x)
            _dir = sign((x - other.x))
        hsp = (_dir * current_hspd)
        image_xscale = _dir
    }
}
if (other.object_index == obj_forkhitbox)
    obj_player.parryID = other.ID
if (other.object_index == obj_pizzacutter2)
{
    if (other.myhandle.object_index == obj_pizzacutterthwomp1)
        instance_destroy(other)
    else
    {
        with (other.myhandle)
        {
            spinspeed *= -1.1
            if (spinspeed > 9)
                spinspeed = 9
            if (spinspeed < -9)
                spinspeed = -9
        }
    }
}
if (!collisioned)
{
    if (obj_player1.x != other.x)
        obj_player1.xscale = sign((other.x - obj_player1.x))
    else
        obj_player1.xscale = (-other.image_xscale)
    event_user(0)
}
