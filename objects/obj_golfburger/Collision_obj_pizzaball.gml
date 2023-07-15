if (golfcooldown <= 0 && state != (74 << 0) && state != (138 << 0) && state != (4 << 0) && other.state != (148 << 0) && other.state != (4 << 0) && other.bigcheeseID == -4)
{
    golfid = other.id
    shot = 0
    state = (74 << 0)
    sprite_index = spr_golfburger_golf
    image_index = 0
    other.bigcheeseID = id
    if (shootdir == 0)
        image_xscale *= -1
    else
        image_xscale = shootdir
}
