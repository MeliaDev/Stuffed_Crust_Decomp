shader_set(shd_SSSDafterimage)
var colorblend1 = shader_get_uniform(shd_SSSDafterimage, "blendcolor1")
var colorblend2 = shader_get_uniform(shd_SSSDafterimage, "blendcolor2")
shader_set_uniform_f(colorblend1, (color_get_red(color1[colorchoice]) / 255), (color_get_green(color1[colorchoice]) / 255), (color_get_blue(color1[colorchoice]) / 255))
shader_set_uniform_f(colorblend2, (color_get_red(color2) / 255), (color_get_green(color2) / 255), (color_get_blue(color2) / 255))
image_blend = c_white
draw_sprite_ext(sprite_index, image_index, x, y, image_xscale, image_yscale, image_angle, image_blend, image_alpha)
pattern_reset()
shader_reset()
