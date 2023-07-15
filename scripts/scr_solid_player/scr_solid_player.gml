function scr_solid_player(_x, _y) //scr_solid_player
{
    var old_x = x
    var old_y = y
    x = _x
    y = _y
    ds_list_clear(global.instancelist)
    var num = instance_place_list(x, y, 517, global.instancelist, 0)
    var _collided = 0
    var i = 0
    while (i < num)
    {
        var b = ds_list_find_value(global.instancelist, i)
        if instance_exists(b)
        {
            switch b.object_index
            {
                case obj_ghostwall:
                    if (state != (16 << 0))
                        _collided = 1
                    break
                case obj_mach3solid:
                    if (state != (121 << 0) && (state != (105 << 0) || sprite_index != spr_mach3boost) && (state != (61 << 0) || tauntstoredstate != (121 << 0)))
                        _collided = 1
                    break
                default:
                    _collided = 1
            }

        }
        if _collided
            break
        else
        {
            i++
            continue
        }
    }
    ds_list_clear(global.instancelist)
    if _collided
    {
        x = old_x
        y = old_y
        return 1;
    }
    if (y > old_y && state != (93 << 0) && place_meeting(x, y, obj_platform))
    {
        num = instance_place_list(x, y, 722, global.instancelist, 0)
        _collided = 0
        for (i = 0; i < num; i++)
        {
            b = ds_list_find_value(global.instancelist, i)
            if ((!(place_meeting(x, old_y, b))) && place_meeting(x, y, b))
                _collided = 1
        }
        ds_list_clear(global.instancelist)
        if _collided
        {
            x = old_x
            y = old_y
            return 1;
        }
    }
    if (y > old_y && state == (78 << 0) && (!(place_meeting(x, old_y, obj_grindrail))) && place_meeting(x, y, obj_grindrail))
    {
        x = old_x
        y = old_y
        return 1;
    }
    if check_slope_player(516)
    {
        x = old_x
        y = old_y
        return 1;
    }
    if (state == (78 << 0) && check_slope_player(3))
    {
        x = old_x
        y = old_y
        return 1;
    }
    x = old_x
    y = old_y
    return 0;
}

function check_slope_player(argument0) //check_slope_player
{
    var slope = instance_place(x, y, argument0)
    if slope
    {
        with (slope)
        {
            var object_side = 0
            var slope_start = 0
            var slope_end = 0
            if (image_xscale > 0)
            {
                object_side = other.bbox_right
                slope_start = bbox_bottom
                slope_end = bbox_top
            }
            else
            {
                object_side = other.bbox_left
                slope_start = bbox_top
                slope_end = bbox_bottom
            }
            var m = ((sign(image_xscale) * (bbox_bottom - bbox_top)) / (bbox_right - bbox_left))
            slope = (slope_start - round((m * (object_side - bbox_left))))
            if (other.bbox_bottom >= slope)
                return 1;
        }
    }
    return 0;
}

