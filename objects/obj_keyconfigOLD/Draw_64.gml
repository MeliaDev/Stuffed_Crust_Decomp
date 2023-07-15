draw_set_font(lang_get_font("bigfont"))
draw_set_halign(fa_left)
draw_set_valign(fa_top)
draw_set_color(c_white)
draw_rectangle_color(0, 0, obj_screensizer.actual_width, obj_screensizer.actual_height, c_black, c_black, c_black, c_black, 0)
if (player == 0)
{
    if (key_select == -1)
        draw_text_colour(((obj_screensizer.actual_width / 2) - 200), 50, "BACK", c_white, c_white, c_white, c_white, 1)
    else
        draw_text_colour(((obj_screensizer.actual_width / 2) - 200), 50, "BACK", c_white, c_white, c_white, c_white, 0.5)
    if (key_select == 0)
        draw_sprite_ext(spr_controlicons, 0, ((obj_screensizer.actual_width / 2) - 60), 50, 1, 1, 0, c_white, 1)
    else
        draw_sprite_ext(spr_controlicons, 0, ((obj_screensizer.actual_width / 2) - 60), 50, 1, 1, 0, c_white, 0.5)
    draw_text(((obj_screensizer.actual_width / 2) + 100), 50, scr_keyname(global.key_up))
    if (key_select == 1)
        draw_text_colour(((obj_screensizer.actual_width / 2) - 60), 100, "DOWN", c_white, c_white, c_white, c_white, 1)
    else
        draw_text_colour(((obj_screensizer.actual_width / 2) - 60), 100, "DOWN", c_white, c_white, c_white, c_white, 0.5)
    draw_text(((obj_screensizer.actual_width / 2) + 100), 100, scr_keyname(global.key_down))
    if (key_select == 2)
        draw_text_colour(((obj_screensizer.actual_width / 2) - 60), 150, "RIGHT", c_white, c_white, c_white, c_white, 1)
    else
        draw_text_colour(((obj_screensizer.actual_width / 2) - 60), 150, "RIGHT", c_white, c_white, c_white, c_white, 0.5)
    draw_text(((obj_screensizer.actual_width / 2) + 100), 150, scr_keyname(global.key_right))
    if (key_select == 3)
        draw_text_colour(((obj_screensizer.actual_width / 2) - 60), 200, "LEFT", c_white, c_white, c_white, c_white, 1)
    else
        draw_text_colour(((obj_screensizer.actual_width / 2) - 60), 200, "LEFT", c_white, c_white, c_white, c_white, 0.5)
    draw_text(((obj_screensizer.actual_width / 2) + 100), 200, scr_keyname(global.key_left))
    if (key_select == 4)
        draw_text_colour(((obj_screensizer.actual_width / 2) - 60), 250, "JUMP", c_white, c_white, c_white, c_white, 1)
    else
        draw_text_colour(((obj_screensizer.actual_width / 2) - 60), 250, "JUMP", c_white, c_white, c_white, c_white, 0.5)
    draw_text(((obj_screensizer.actual_width / 2) + 100), 250, scr_keyname(global.key_jump))
    if (key_select == 5)
        draw_text_colour(((obj_screensizer.actual_width / 2) - 60), 300, "GRAB", c_white, c_white, c_white, c_white, 1)
    else
        draw_text_colour(((obj_screensizer.actual_width / 2) - 60), 300, "GRAB", c_white, c_white, c_white, c_white, 0.5)
    draw_text(((obj_screensizer.actual_width / 2) + 100), 300, scr_keyname(global.key_slap))
    if (key_select == 6)
        draw_text_colour(((obj_screensizer.actual_width / 2) - 60), 350, "DASH", c_white, c_white, c_white, c_white, 1)
    else
        draw_text_colour(((obj_screensizer.actual_width / 2) - 60), 350, "DASH", c_white, c_white, c_white, c_white, 0.5)
    draw_text(((obj_screensizer.actual_width / 2) + 100), 350, scr_keyname(global.key_attack))
    if (key_select == 7)
        draw_text_colour(((obj_screensizer.actual_width / 2) - 60), 400, "SHOOT", c_white, c_white, c_white, c_white, 1)
    else
        draw_text_colour(((obj_screensizer.actual_width / 2) - 60), 400, "SHOOT", c_white, c_white, c_white, c_white, 0.5)
    draw_text(((obj_screensizer.actual_width / 2) + 100), 400, scr_keyname(global.key_shoot))
    if (key_select == 8)
        draw_text_colour(((obj_screensizer.actual_width / 2) - 60), 450, "TAUNT", c_white, c_white, c_white, c_white, 1)
    else
        draw_text_colour(((obj_screensizer.actual_width / 2) - 60), 450, "TAUNT", c_white, c_white, c_white, c_white, 0.5)
    draw_text(((obj_screensizer.actual_width / 2) + 100), 450, scr_keyname(global.key_taunt))
    if (key_select == 9)
        draw_text_colour(((obj_screensizer.actual_width / 2) - 60), 500, "PAUSE", c_white, c_white, c_white, c_white, 1)
    else
        draw_text_colour(((obj_screensizer.actual_width / 2) - 60), 500, "PAUSE", c_white, c_white, c_white, c_white, 0.5)
    draw_text(((obj_screensizer.actual_width / 2) + 100), 500, scr_keyname(global.key_start))
}
if (player == 1)
{
    draw_text_colour(((obj_screensizer.actual_width / 2) - 200), 25, "PLAYER 2", c_white, c_white, c_white, c_white, 1)
    if (key_select == -1)
        draw_text_colour(((obj_screensizer.actual_width / 2) - 200), 50, "BACK", c_white, c_white, c_white, c_white, 1)
    else
        draw_text_colour(((obj_screensizer.actual_width / 2) - 200), 50, "BACK", c_white, c_white, c_white, c_white, 0.5)
    if (key_select == 0)
        draw_text_colour(((obj_screensizer.actual_width / 2) - 60), 50, "UP", c_white, c_white, c_white, c_white, 1)
    else
        draw_text_colour(((obj_screensizer.actual_width / 2) - 60), 50, "UP", c_white, c_white, c_white, c_white, 0.5)
    draw_text(((obj_screensizer.actual_width / 2) + 100), 50, scr_keyname(global.key_upN))
    if (key_select == 1)
        draw_text_colour(((obj_screensizer.actual_width / 2) - 60), 100, "DOWN", c_white, c_white, c_white, c_white, 1)
    else
        draw_text_colour(((obj_screensizer.actual_width / 2) - 60), 100, "DOWN", c_white, c_white, c_white, c_white, 0.5)
    draw_text(((obj_screensizer.actual_width / 2) + 100), 100, scr_keyname(global.key_downN))
    if (key_select == 2)
        draw_text_colour(((obj_screensizer.actual_width / 2) - 60), 150, "RIGHT", c_white, c_white, c_white, c_white, 1)
    else
        draw_text_colour(((obj_screensizer.actual_width / 2) - 60), 150, "RIGHT", c_white, c_white, c_white, c_white, 0.5)
    draw_text(((obj_screensizer.actual_width / 2) + 100), 150, scr_keyname(global.key_rightN))
    if (key_select == 3)
        draw_text_colour(((obj_screensizer.actual_width / 2) - 60), 200, "LEFT", c_white, c_white, c_white, c_white, 1)
    else
        draw_text_colour(((obj_screensizer.actual_width / 2) - 60), 200, "LEFT", c_white, c_white, c_white, c_white, 0.5)
    draw_text(((obj_screensizer.actual_width / 2) + 100), 200, scr_keyname(global.key_leftN))
    if (key_select == 4)
        draw_text_colour(((obj_screensizer.actual_width / 2) - 60), 250, "JUMP", c_white, c_white, c_white, c_white, 1)
    else
        draw_text_colour(((obj_screensizer.actual_width / 2) - 60), 250, "JUMP", c_white, c_white, c_white, c_white, 0.5)
    draw_text(((obj_screensizer.actual_width / 2) + 100), 250, scr_keyname(global.key_jumpN))
    if (key_select == 5)
        draw_text_colour(((obj_screensizer.actual_width / 2) - 60), 300, "GRAB", c_white, c_white, c_white, c_white, 1)
    else
        draw_text_colour(((obj_screensizer.actual_width / 2) - 60), 300, "GRAB", c_white, c_white, c_white, c_white, 0.5)
    draw_text(((obj_screensizer.actual_width / 2) + 100), 300, scr_keyname(global.key_slapN))
    if (key_select == 6)
        draw_text_colour(((obj_screensizer.actual_width / 2) - 60), 350, "DASH", c_white, c_white, c_white, c_white, 1)
    else
        draw_text_colour(((obj_screensizer.actual_width / 2) - 60), 350, "DASH", c_white, c_white, c_white, c_white, 0.5)
    draw_text(((obj_screensizer.actual_width / 2) + 100), 350, scr_keyname(global.key_attackN))
    if (key_select == 7)
        draw_text_colour(((obj_screensizer.actual_width / 2) - 60), 400, "SHOOT", c_white, c_white, c_white, c_white, 1)
    else
        draw_text_colour(((obj_screensizer.actual_width / 2) - 60), 400, "SHOOT", c_white, c_white, c_white, c_white, 0.5)
    draw_text(((obj_screensizer.actual_width / 2) + 100), 400, scr_keyname(global.key_shootN))
    if (key_select == 8)
        draw_text_colour(((obj_screensizer.actual_width / 2) - 60), 450, "TAUNT", c_white, c_white, c_white, c_white, 1)
    else
        draw_text_colour(((obj_screensizer.actual_width / 2) - 60), 450, "TAUNT", c_white, c_white, c_white, c_white, 0.5)
    draw_text(((obj_screensizer.actual_width / 2) + 100), 450, scr_keyname(global.key_tauntN))
    if (key_select == 9)
        draw_text_colour(((obj_screensizer.actual_width / 2) - 60), 500, "PAUSE", c_white, c_white, c_white, c_white, 1)
    else
        draw_text_colour(((obj_screensizer.actual_width / 2) - 60), 500, "PAUSE", c_white, c_white, c_white, c_white, 0.5)
    draw_text(((obj_screensizer.actual_width / 2) + 100), 500, scr_keyname(global.key_startN))
}
