var _magnet = 0
with (obj_magnet)
{
    if (ballID == other.id)
        _magnet = 1
}
if ((!_magnet) && state != (148 << 0) && state != (137 << 0) && state != (4 << 0) && bigcheeseID == -4)
{
    x = obj_player1.x
    y = obj_player1.y
}
