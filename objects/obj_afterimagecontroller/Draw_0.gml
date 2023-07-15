for (var i = 0; i < ds_list_size(global.afterimage_list); i++)
{
    var b = ds_list_find_value(global.afterimage_list, i)
    with (b)
    {
        if visible
        {
            b = image_blend
            var a = other.alpha[identifier]
            var shd = 0
            if (identifier == (0 << 0))
            {
                shd = 1
                shader_set(other.aftimg_shader)
                var colorblend1 = shader_get_uniform(other.aftimg_shader, "blendcolor1")
                var colorblend2 = shader_get_uniform(other.aftimg_shader, "blendcolor2")
                with (other)
                {
                    colorchoice = irandom(global.mach_color_number)
                    if (colorchoice > (array_length(color1) - 1))
                        colorchoice = (array_length(color1) - 1)
                    if global.custom_mach_colors
                        color2 = global.custom_mach_outline
                    else
                        color2 = merge_color(c_black, color1[colorchoice], 0.05)
                }
                a = alpha
                b = c_white
                shader_set_uniform_f(colorblend1, (color_get_red(other.color1[other.colorchoice]) / 255), (color_get_green(other.color1[other.colorchoice]) / 255), (color_get_blue(other.color1[other.colorchoice]) / 255))
                shader_set_uniform_f(colorblend2, (color_get_red(other.color2) / 255), (color_get_green(other.color2) / 255), (color_get_blue(other.color2) / 255))
                image_blend = c_white
            }
            else if (identifier == (3 << 0))
            {
                a = alpha
                shd = 1
                shader_set(shd_color_afterimage)
                shader_set_uniform_f(other.shd_color_red, 0.97)
                shader_set_uniform_f(other.shd_color_green, 0.43)
                shader_set_uniform_f(other.shd_color_blue, 0.09)
            }
            else if (identifier == (4 << 0))
            {
                a = alpha
                shd = 1
                shader_set(shd_color_afterimage)
                shader_set_uniform_f(other.shd_color_red, 0.17)
                shader_set_uniform_f(other.shd_color_green, 0.49)
                shader_set_uniform_f(other.shd_color_blue, 0.9)
            }
            else if (identifier == (6 << 0))
            {
                a = alpha
                shd = 1
                shader_set(shd_color_afterimage)
                shader_set_uniform_f(other.shd_color_red, 0.8745098039215686)
                shader_set_uniform_f(other.shd_color_green, 0.1843137254901961)
                shader_set_uniform_f(other.shd_color_blue, 0)
            }
            else if (identifier == (7 << 0))
            {
                a = alpha
                shd = 1
                shader_set(shd_color_afterimage)
                shader_set_uniform_f(other.shd_color_red, 1)
                shader_set_uniform_f(other.shd_color_green, 0)
                shader_set_uniform_f(other.shd_color_blue, 0)
            }
            else if (identifier == (5 << 0))
            {
                a = alpha
                b = get_dark(other.image_blend, obj_drawcontroller.use_dark, 1, x, y)
                if (instance_exists(playerid) && playerid.usepalette)
                {
                    shd = 1
                    shader_set(global.Pal_Shader)
                    if (playerid.object_index == obj_player1)
                        pattern_set(global.Base_Pattern_Color, sprite_index, image_index, image_xscale, image_yscale, global.palettetexture)
                    pal_swap_set(playerid.spr_palette, playerid.paletteselect, 0)
                }
            }
            draw_sprite_ext(sprite_index, image_index, x, y, image_xscale, image_yscale, image_angle, b, a)
            if shd
            {
                pattern_reset()
                shader_reset()
            }
        }
    }
}
