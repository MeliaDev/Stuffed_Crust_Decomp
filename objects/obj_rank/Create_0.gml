image_speed = 0.5
toppinvisible = 1
toppin[0] = 0
toppin[1] = 0
toppin[2] = 0
toppin[3] = 0
toppin[4] = 0
createmoney[0] = 0
createmoney[1] = 0
createmoney[2] = 0
createmoney[3] = 0
createmoney[4] = 0
var yy = (obj_screensizer.actual_height + 121)
x = (camera_get_view_x(view_camera[0]) + (camera_get_view_width(view_camera[0]) / 2))
y = ((camera_get_view_y(view_camera[0]) + camera_get_view_height(view_camera[0])) - sprite_yoffset)
toppin_y[0] = (yy + 150)
toppin_y[1] = yy
toppin_y[2] = yy
toppin_y[3] = yy
toppin_y[4] = yy
toppin_yscale[0] = 1
toppin_yscale[1] = 1
toppin_yscale[2] = 1
toppin_yscale[3] = 1
toppin_yscale[4] = 1
var mins = global.level_realminutes
if (mins < 10)
    mins = concat("0", mins)
else
    mins = concat(mins)
var secs = floor(global.level_realseconds)
if (secs < 10)
    secs = concat("0", secs)
else
    secs = concat(secs)
text = [[0, concat(lang_get_value("rank_highscore"), global.collect)], [0, concat(lang_get_value("rank_time"), mins, ":", secs, ".", floor((frac(global.level_realseconds) * 100)))], [0, concat(lang_get_value("rank_damage"), global.player_damage)], [0, concat(lang_get_value("rank_combo"), global.highest_combo)]]
text_pos = 0
toppin_index = 0
toppin_state = (92 << 0)
toppin_buffer = 0
brown = 0
brownfade = 0
alarm[2] = 400
depth = -8
