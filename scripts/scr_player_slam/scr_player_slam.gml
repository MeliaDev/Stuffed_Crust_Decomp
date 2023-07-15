function scr_player_slam() //scr_player_slam
{
    if (windingAnim < 2000)
        windingAnim += 5
    move = (key_left + key_right)
    if (!grounded)
        hsp = (move * movespeed)
    if ((scr_solid((x + 1), y) && xscale == 1) || (scr_solid((x - 1), y) && xscale == -1))
        movespeed = 0
    if (move == 0)
        movespeed = 0
    if (move != 0 && movespeed < 4)
        movespeed += 0.5
    if (xscale == 1 && move == -1)
        movespeed = 0
    if (xscale == -1 && move == 1)
        movespeed = 0
    jumpAnim = 1
    dashAnim = 1
    landAnim = 0
    machslideAnim = 1
    moveAnim = 1
    stopAnim = 1
    crouchslideAnim = 1
    crouchAnim = 1
    if (floor(image_index) == (image_number - 1))
        state = (0 << 0)
    if (move != 0)
        xscale = move
    if (floor(image_index) == 3 && (!grounded))
        image_speed = 0
    else if (grounded && slamming == 0 && vsp > 0)
    {
        slamming = 1
        hsp = 0
        image_speed = 0.35
        with (obj_camera)
        {
            shake_mag = 10
            shake_mag_acc = (30 / room_speed)
        }
        if (baddiegrabbedID != obj_null)
        {
            with (baddiegrabbedID)
            {
                other.thrown = 1
                instance_create(x, y, obj_slapstar)
                instance_create(x, y, obj_baddiegibs)
                other.flash = 1
                x = other.x
                y = other.y
                state = (107 << 0)
                hsp = ((-image_xscale) * 10)
                vsp = -10
                alarm[8] = 60
                alarm[7] = 120
                other.baddiegrabbedID = 741
                elitehit = 0
                instance_destroy()
            }
        }
    }
}

