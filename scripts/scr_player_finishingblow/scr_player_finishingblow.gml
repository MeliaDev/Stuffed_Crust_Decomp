function scr_player_finishingblow() //scr_player_finishingblow
{
    hsp = movespeed
    move = (key_right + key_left)
    if (floor(image_index) < 4 && sprite_index != spr_swingdingend)
        movespeed = Approach(movespeed, 0, 1)
    else
        movespeed = Approach(movespeed, ((-xscale) * 4), 0.5)
    if (floor(image_index) == 0 && (!instance_exists(obj_swordhitbox)))
    {
        with (instance_create(x, y, obj_swordhitbox))
            playerid = other.object_index
    }
    if (floor(image_index) == (image_number - 1))
    {
        image_index = 0
        movespeed = 0
        railmovespeed = 4
        raildir = (-xscale)
        state = (0 << 0)
    }
    image_speed = 0.4
    landAnim = 0
    if ((!instance_exists(obj_dashcloud2)) && grounded && movespeed > 3)
    {
        with (instance_create(x, y, obj_dashcloud2))
            image_xscale = other.xscale
    }
    if (punch_afterimage > 0)
        punch_afterimage--
    else
    {
        punch_afterimage = 5
        if (global.blueeffects > 0)
        {
            if (global.blueeffects == 1)
            {
                with (create_firemouth_afterimage(x, y, sprite_index, image_index, 1))
                {
                    image_xscale = other.xscale
                    playerid = other.id
                }
            }
            if (global.blueeffects == 2)
            {
                with (create_blue_afterimage(x, y, sprite_index, image_index, 1))
                {
                    image_xscale = other.xscale
                    playerid = other.id
                }
            }
            if (global.blueeffects == 3)
            {
                with (create_red_afterimage(x, y, sprite_index, image_index, 1))
                {
                    image_xscale = other.xscale
                    playerid = other.id
                }
            }
        }
        else
        {
            with (create_mach3effect(x, y, sprite_index, image_index, 1))
            {
                image_xscale = other.xscale
                playerid = other.id
            }
        }
    }
}

