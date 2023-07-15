image_speed = 0
image_index = obj_player.image_index
image_xscale = obj_player.xscale
sprite_index = obj_player.sprite_index
depth = (obj_player.depth + 1)
global.afterimage_list = ds_list_create()
alpha = array_create((8 << 0), 1)
alpha[(2 << 0)] = 0.5
shd_alpha = shader_get_uniform(shd_firemouth_afterimage, "newAlpha")
shd_color_red = shader_get_uniform(shd_color_afterimage, "red")
shd_color_green = shader_get_uniform(shd_color_afterimage, "green")
shd_color_blue = shader_get_uniform(shd_color_afterimage, "blue")
aftimg_shader = 16
color1 = [global.mach_color1, global.mach_color2, global.mach_color3, global.mach_color4, global.mach_color5, global.mach_color6]
color2 = global.mach_outlinecolor
colortimer = 0
alarm[1] = 3
colorchoice = irandom(global.mach_color_number)
if (colorchoice > (array_length(color1) - 1))
    colorchoice = (array_length(color1) - 1)
if global.custom_mach_colors
    color2 = global.custom_mach_outline
else
    color2 = merge_color(c_black, color1[colorchoice], 0.05)
