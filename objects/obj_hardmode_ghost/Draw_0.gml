fake_y = Approach(fake_y, y, 5)
draw_sprite_ext(sprite_index, image_index, x, fake_y, image_xscale, image_yscale, 0, c_white, 0.7)
if ((!obj_camera.visible) || (!global.hardmode) || room == strongcold_endscreen || room == rank_room || room == timesuproom || room == Realtitlescreen || room == characterselect || is_bossroom())
    instance_destroy()
