var p = obj_player1
with (other)
{
    if (team != 1)
    {
        switch object_index
        {
            case obj_spitcheesespike:
                vsp = -6
            case 630:
            case 323:
            case 65:
            case 328:
                var current_hspd = abs(hsp)
                var _dir = sign(hsp)
                _dir = (image_xscale * -1)
                if (!other.collisioned)
                    p.xscale = _dir
                hsp = (_dir * current_hspd)
                image_xscale = _dir
                break
            case 615:
                _dir = sign(image_xscale)
                _dir = (image_xscale * -1)
                if (!other.collisioned)
                    p.xscale = _dir
                image_xscale = _dir
                break
            case 434:
                current_hspd = abs(hsp)
                _dir = sign(hsp)
                _dir = (_dir * -1)
                if (!other.collisioned)
                    p.xscale = _dir
                image_xscale = _dir
                hsp = (_dir * current_hspd)
                vsp = -7
                break
            case 639:
            case 204:
                current_hspd = abs(speed)
                _dir = sign(speed)
                if (!other.collisioned)
                {
                    if (direction < 90 || direction > 270)
                        obj_player1.xscale = -1
                    else
                        obj_player1.xscale = 1
                }
                if (((direction < 90 || direction > 270) && x < other.x) || ((direction > 90 || direction < 270) && x > other.x))
                    _dir = -1
                speed = (_dir * speed)
                image_angle = point_direction(x, y, xstart, ystart)
                if (object_index == obj_whoophand)
                {
                    dir = _dir
                    stop = 0
                    image_alpha = 1
                    alarm[0] = 80
                }
                break
            case 613:
                _dir = sign(image_xscale)
                _dir = (-_dir)
                if (!other.collisioned)
                    p.xscale = _dir
                image_xscale = _dir
                break
            case 318:
                if (team != 1)
                {
                    image_xscale *= -1
                    image_yscale *= -1
                    if (!other.collisioned)
                        p.xscale = image_xscale
                }
                break
        }

    }
    team = 1
}
if (!collisioned)
    event_user(0)
