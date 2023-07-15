function scr_init_input() //scr_init_input
{
    key_up = 0
    key_up2 = 0
    key_right = 0
    key_right2 = 0
    key_left = 0
    key_left2 = 0
    key_down = 0
    key_down2 = 0
    key_jump = 0
    key_jump2 = 0
    key_slap = 0
    key_slap2 = 0
    key_taunt = 0
    key_taunt2 = 0
    key_attack = 0
    key_attack2 = 0
    key_shoot = 0
    key_shoot2 = 0
    key_start = 0
    key_escape = 0
    key_chainsaw = 0
    key_chainsaw2 = 0
    key_superjump = 0
    key_superjump2 = 0
    key_groundpound = 0
    key_groundpound2 = 0
    stickpressed = 0
    stickpressed_horizontal = 0
    stickpressed_vertical = 0
}

function scr_check_superjump() //scr_check_superjump
{
    var sj = global.gamepad_superjump
    if (obj_inputAssigner.player_input_device[0] < 0)
        sj = 1
    return ((sj && key_up) || key_superjump);
}

function scr_check_groundpound() //scr_check_groundpound
{
    var gp = global.gamepad_groundpound
    if (obj_inputAssigner.player_input_device[0] < 0)
        gp = 1
    return ((gp && key_down2) || key_groundpound);
}

function scr_check_groundpound2() //scr_check_groundpound2
{
    gp = global.gamepad_groundpound
    if (obj_inputAssigner.player_input_device[0] < 0)
        gp = 1
    return ((gp && key_down) || key_groundpound2);
}

function scr_getinput() //scr_getinput
{
    if (instance_exists(obj_debugcontroller) && obj_debugcontroller.active)
        return;
    var _dvc = obj_inputAssigner.player_input_device[0]
    gamepad_set_axis_deadzone(_dvc, global.gamepad_deadzone)
    var verticaldeadzone = global.gamepad_deadzone_vertical
    var horizontaldeadzone = global.gamepad_deadzone_horizontal
    var vertpress_dz = global.gamepad_deadzone_press
    var horizpress_dz = global.gamepad_deadzone_press
    key_up = (keyboard_check(global.key_up) || gamepad_button_check(_dvc, global.key_upC) || gamepad_axis_value(_dvc, gp_axislv) < (-verticaldeadzone))
    key_up2 = (keyboard_check_pressed(global.key_up) || gamepad_button_check_pressed(_dvc, global.key_upC) || (gamepad_axis_value(_dvc, gp_axislv) < (-vertpress_dz) && stickpressed_vertical == 0))
    key_right = (keyboard_check(global.key_right) || gamepad_button_check(_dvc, global.key_rightC) || gamepad_axis_value(_dvc, gp_axislh) > horizontaldeadzone)
    key_right2 = (keyboard_check_pressed(global.key_right) || gamepad_button_check_pressed(_dvc, global.key_rightC) || (gamepad_axis_value(_dvc, gp_axislh) > horizpress_dz && stickpressed_horizontal == 0))
    key_left = (-((keyboard_check(global.key_left) || gamepad_button_check(_dvc, global.key_leftC) || gamepad_axis_value(_dvc, gp_axislh) < (-horizontaldeadzone))))
    key_left2 = (-((keyboard_check_pressed(global.key_left) || gamepad_button_check_pressed(_dvc, global.key_leftC) || (gamepad_axis_value(_dvc, gp_axislh) < (-horizpress_dz) && stickpressed_horizontal == 0))))
    key_down = (keyboard_check(global.key_down) || gamepad_button_check(_dvc, global.key_downC) || gamepad_axis_value(_dvc, gp_axislv) > verticaldeadzone)
    key_down2 = (keyboard_check_pressed(global.key_down) || gamepad_button_check_pressed(_dvc, global.key_downC) || (gamepad_axis_value(_dvc, gp_axislv) > vertpress_dz && stickpressed_vertical == 0))
    key_jump = (keyboard_check_pressed(global.key_jump) || gamepad_button_check_pressed(_dvc, global.key_jumpC))
    key_jump2 = (keyboard_check(global.key_jump) || gamepad_button_check(_dvc, global.key_jumpC))
    key_slap = (keyboard_check(global.key_slap) || gamepad_button_check(_dvc, global.key_slapC))
    key_slap2 = (keyboard_check_pressed(global.key_slap) || gamepad_button_check_pressed(_dvc, global.key_slapC))
    key_taunt = (keyboard_check(global.key_taunt) || gamepad_button_check(_dvc, global.key_tauntC))
    key_taunt2 = (keyboard_check_pressed(global.key_taunt) || gamepad_button_check_pressed(_dvc, global.key_tauntC))
    key_attack = (keyboard_check(global.key_attack) || gamepad_button_check(_dvc, global.key_attackC))
    key_attack2 = (keyboard_check_pressed(global.key_attack) || gamepad_button_check_pressed(_dvc, global.key_attackC))
    key_shoot = (keyboard_check(global.key_shoot) || gamepad_button_check(_dvc, global.key_shootC))
    key_shoot2 = (keyboard_check_pressed(global.key_shoot) || gamepad_button_check_pressed(_dvc, global.key_shootC))
    key_start = (keyboard_check_pressed(global.key_start) || gamepad_button_check_pressed(_dvc, global.key_startC))
    key_escape = (keyboard_check_pressed(vk_escape) || gamepad_button_check(_dvc, gp_select))
    key_chainsaw = (keyboard_check(global.key_chainsaw) || gamepad_button_check(_dvc, global.key_chainsawC))
    key_chainsaw2 = (keyboard_check_pressed(global.key_chainsaw) || gamepad_button_check_pressed(_dvc, global.key_chainsawC))
    key_superjump = (global.key_superjumpC != -4 ? gamepad_button_check(_dvc, global.key_superjumpC) : 0)
    key_superjump2 = (global.key_superjumpC != -4 ? gamepad_button_check_pressed(_dvc, global.key_superjumpC) : 0)
    key_groundpound = (global.key_groundpoundC != -4 ? gamepad_button_check_pressed(_dvc, global.key_groundpoundC) : 0)
    key_groundpound2 = (global.key_groundpoundC != -4 ? gamepad_button_check(_dvc, global.key_groundpoundC) : 0)
    if (gamepad_axis_value(_dvc, gp_axislh) >= horizpress_dz || gamepad_axis_value(_dvc, gp_axislh) <= (-horizpress_dz))
        stickpressed_horizontal = 1
    else
        stickpressed_horizontal = 0
    if (gamepad_axis_value(_dvc, gp_axislv) >= vertpress_dz || gamepad_axis_value(_dvc, gp_axislv) <= (-vertpress_dz))
        stickpressed_vertical = 1
    else
        stickpressed_vertical = 0
    if (object_index == obj_player1)
    {
        if (state == (99 << 0) || state == (100 << 0) || state == (260 << 0))
        {
            var haxis = gamepad_axis_value(_dvc, gp_axislh)
            var vaxis = gamepad_axis_value(_dvc, gp_axislv)
            if (haxis != 0 || vaxis != 0)
            {
                var _deadzone = floor((global.gamepad_deadzone_superjump * 120))
                if (state == (100 << 0) || state == (260 << 0))
                {
                    vaxis *= -1
                    _deadzone = floor((global.gamepad_deadzone_crouch * 120))
                }
                var _dir = point_direction(0, 0, haxis, vaxis)
                trace(_dir, ":", _deadzone)
                if ((_dir <= (120 + _deadzone) && _dir >= (60 - _deadzone)) || _dir >= (420 - _deadzone))
                {
                    if (state == (99 << 0))
                        key_up = 1
                    else if ((state == (100 << 0) && uncrouch <= 0) || state == (260 << 0))
                        key_down = 1
                }
            }
        }
    }
}

