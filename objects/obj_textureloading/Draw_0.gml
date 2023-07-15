var p = (tex_max - array_length(tex_list))
var t = ((p / tex_max) * 100)
draw_healthbar(0, (obj_screensizer.actual_height - 4), obj_screensizer.actual_width, obj_screensizer.actual_height, t, c_black, c_white, c_white, 0, 0, 0)
