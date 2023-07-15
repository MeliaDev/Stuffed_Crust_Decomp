if (other.state == (129 << 0) && (!collisioned))
{
    if (obj_player1.x != other.x)
        obj_player1.xscale = sign((other.x - obj_player1.x))
    else
        obj_player1.xscale = (-other.image_xscale)
    event_user(0)
}
