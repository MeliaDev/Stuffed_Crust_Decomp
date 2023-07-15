if (timer > 0)
    timer--
else
{
    timer = timer_max
    if (comboscore > 0)
    {
        if (!global.heatmeter)
        {
            with (obj_baddie)
                elite = 0
        }
        else if (global.heatmeter == 1)
        {
            if (global.style > 0)
                global.style -= 1
            else
            {
                global.style = 0
                with (obj_baddie)
                    elite = 0
            }
        }
        if (combominus <= 1)
            combominus = 1
        comboscore -= round(combominus)
        if (comboscore < 0)
            comboscore = 0
        if (!global.panic)
        {
            if (current_month == 10)
                create_collect((camera_get_view_x(view_camera[0]) + x), (camera_get_view_y(view_camera[0]) + y), choose(2750, 2752, 2756, 2757, 2758), round(combominus))
            else if (current_month == 12)
                create_collect((camera_get_view_x(view_camera[0]) + x), (camera_get_view_y(view_camera[0]) + y), choose(2864, 2866, 2868, 2870, 2872), round(combominus))
            else if obj_player1.isgustavo
                create_collect((camera_get_view_x(view_camera[0]) + x), (camera_get_view_y(view_camera[0]) + y), choose(2092, 3232, 3887, 3854, 2567, 4429), round(combominus))
            else if (obj_player1.character == "S")
                create_collect((camera_get_view_x(view_camera[0]) + x), (camera_get_view_y(view_camera[0]) + y), 62, round(combominus))
            else if (obj_player1.character == "P" && obj_player1.ispeppino)
                create_collect((camera_get_view_x(view_camera[0]) + x), (camera_get_view_y(view_camera[0]) + y), choose(2089, 2091, 2092, 2094, 2090), round(combominus))
            else if (obj_player1.character == "N" || (obj_player1.character == "P" && obj_player1.ispeppino == 0))
                create_collect((camera_get_view_x(view_camera[0]) + x), (camera_get_view_y(view_camera[0]) + y), choose(2750, 2752, 2756, 2757, 2758, 2864, 2866, 2868, 2870, 2872), round(combominus))
            else
                create_collect((camera_get_view_x(view_camera[0]) + x), (camera_get_view_y(view_camera[0]) + y), choose(2089, 2091, 2092, 2094, 2090), round(combominus))
        }
        else if global.panic
            create_collect((camera_get_view_x(view_camera[0]) + x), (camera_get_view_y(view_camera[0]) + y), choose(2073, 2074), round(combominus))
        else
            create_collect((camera_get_view_x(view_camera[0]) + x), (camera_get_view_y(view_camera[0]) + y), choose(2089, 2091, 2092, 2094, 2090), round(combominus))
    }
    else if (alarm[1] == -1)
        alarm[1] = 50
}
if (global.combotime > 0 && global.combo > 0)
    y = Approach(y, (ystart + 100), 10)
title_index += 0.35
if (title_index >= 2)
    title_index = frac(title_index)
if (room == rank_room || room == timesuproom)
    instance_destroy()
