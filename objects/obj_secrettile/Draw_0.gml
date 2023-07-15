if (!(bbox_in_camera(view_camera[0], 32)))
{
}
if (array_length(tiles) > 0)
{
    var w = sprite_width
    var h = sprite_height
    if (!surface_exists(surf))
    {
        surf = surface_create(w, h)
        surface_set_target(surf)
        draw_clear_alpha(c_black, 0)
        for (var k = 0; k < array_length(tilemap_sprite); k++)
        {
            if (tilemap_sprite[k] != -4)
            {
                for (var i = 0; i < array_length(tiles[k]); i++)
                {
                    var b = tiles[k][i]
                    var _l = b[2]
                    var _t = b[3]
                    draw_sprite_part_ext(tilemap_sprite[k], 0, _l, _t, 32, 32, (b[0] - x), (b[1] - y), 1, 1, c_white, 1)
                }
            }
        }
        surface_reset_target()
    }
    if ((!global.panic) || layersprite == -4)
    {
        draw_surface_ext(surf, x, y, 1, 1, 0, c_white, alpha)
        if (layersprite == -4)
            layersprite = sprite_create_from_surface(surf, 0, 0, surface_get_width(surf), surface_get_height(surf), false, false, 0, 0)
    }
    else if (global.panic && layersprite != -4)
    {
        surface_set_target(surf)
        draw_clear_alpha(c_black, 0)
        if (global.laps < 0 && (!active))
        {
            shader_set(shd_panicbg)
            var panic_id = shader_get_uniform(shd_panicbg, "panic")
            shader_set_uniform_f(panic_id, (global.wave / global.maxwave))
            var time_id = shader_get_uniform(shd_panicbg, "time")
            shader_set_uniform_f(time_id, (current_time / 1000))
        }
        draw_sprite_ext(layersprite, 0, 0, 0, 1, 1, 0, c_white, alpha)
        surface_reset_target()
        draw_surface_ext(surf, x, y, 1, 1, 0, c_white, alpha)
    }
    shader_reset()
}
