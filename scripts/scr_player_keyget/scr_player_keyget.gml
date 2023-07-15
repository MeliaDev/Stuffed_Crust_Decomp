function scr_player_keyget() //scr_player_keyget
{
    hsp = 0
    vsp = 0
    image_speed = 0.35
    movespeed = 0
    mach2 = 0
    jumpAnim = 1
    dashAnim = 1
    landAnim = 0
    moveAnim = 1
    stopAnim = 1
    crouchslideAnim = 1
    crouchAnim = 1
    machhitAnim = 0
    global.combotime = 60
    sprite_index = spr_keyget
    if ((!keysound) && floor(image_index) >= 16)
        keysound = ground_boundtitrle_cardd
    if (floor(image_index) == (image_number - 1))
    {
        global.keyget = 0
        state = (0 << 0)
        image_index = 0
        instance_create(x, y, obj_keyfollow)
    }
}

