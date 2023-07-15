function scr_player_actor() //scr_player_actor
{
    if (!ispeppino)
    {
        if (sprite_index == spr_playerN_idlemask)
        {
            if (sprite_index == spr_playerN_idlemask && image_index > (image_number - 1))
                sprite_index = spr_playerN_idle
        }
        if (sprite_index == spr_playerN_bossintro)
        {
            if (image_index > (image_number - 1))
                sprite_index = spr_playerN_idle
        }
        if (sprite_index == spr_playerN_idle || sprite_index == spr_playerN_facehurt)
        {
            if (image_index > (image_number - 1))
                image_index = 0
        }
        if (sprite_index == spr_player_gnomecutscene1)
            sprite_index = spr_playerN_idle
        if (sprite_index == spr_player_screamtransition)
            sprite_index = spr_playerN_facehurt
        if (sprite_index == spr_player_gnomecutscene3)
            sprite_index = spr_playerN_bossintro
        if (sprite_index == spr_player_gnomecutscene4)
            sprite_index = spr_playerN_facehurt
        if (sprite_index == spr_player_gnomecutscene2)
            sprite_index = spr_playerN_idlemask
    }
    if (sprite_index == spr_player_givepizza || sprite_index == spr_player_gnomecutscene2)
    {
        if (image_index > (image_number - 1))
            image_index = (image_number - 1)
    }
    cutscene = 1
    movespeed = 0
    var _room_x = 0
    var _room_y = 0
    var _room_w = room_width
    var _room_h = room_height
    if (room == custom_lvl_room && cam != noone)
    {
        _room_x = cam.x
        _room_y = cam.y
        _room_w = cam_width
        _room_h = cam_height
    }
    if instance_exists(obj_lapportal)
    {
        if (obj_lapportal.doit == 1)
        {
            obj_screensizer.camzoom = lerp(obj_screensizer.camzoom, 0.5, 0.1)
            camera_set_view_size(view_camera[0], (obj_screensizer.actual_width * obj_screensizer.camzoom), (obj_screensizer.actual_height * obj_screensizer.camzoom))
        }
    }
    else
    {
        x = clamp(x, _room_x, _room_w)
        y = clamp(y, _room_y, _room_h)
    }
    if float
    {
        hsp = 0
        vsp = 0
    }
    if (room == boss_vigilante && sprite_index == spr_player_pistolshotend)
    {
        if (actorbuffer > 0)
            actorbuffer--
        else
        {
            landAnim = 0
            state = (0 << 0)
        }
    }
}

